import numpy as np
import scipy.sparse as sp
import json
import urllib
import requests
import os
import pickle
from time import sleep
from requests.adapters import HTTPAdapter
import json

def preprocess(files, make_txt = True):
    # files is an array of string of our 3 files of diff language wiki
    # files[0] is pagelink file, file[1] is page file and file[2] is redirect file
    folder_path = (files[0][0:files[0].find("/",files[0].find("/")+1)+1])
    wiki_name = files[0][files[0].find("/")+1:files[0].find("wiki")]

    if (make_txt):
        make_txt_files(files) # first make our txt files from sqldump

    pagelinks_file = open(files[0].replace(".sql", ".txt"),'r')
    page_file = open(files[1].replace(".sql", ".txt"), 'r')
    redirects = open(files[2].replace(".sql", ".txt"),'r')

    page_dict = {}
    page_dict_inv = {}
    for line in page_file:
        separated_line = line.split(',')
        namespace_page = int(separated_line[1])
        if (namespace_page==0):
            page_id = separated_line[0]
            page_name = separated_line[2]
            page_dict[page_name] = int(page_id)
            page_dict_inv[int(page_id)] = page_name

    redirects_dict = {} # total = 63 redirects id - redirect_to -> page_name
    redirects_dict_id_to_id = {} # total = 41, some dont exist??, redirects: id - redirect_to -> id
    for line in redirects:
        separated_line = line.split(',')
        if ((separated_line[1]) == '0'):
            redirects_dict[int(separated_line[0])]=(separated_line[2]) # 0 = page_id, 2 = redirect from page_id to this name
            if (page_dict.get(separated_line[2])!=None):
                redirects_dict_id_to_id[int(separated_line[0])] = int(page_dict.get(separated_line[2]))

    non_existing_pages = 0
    page_links = np.array([]).reshape(0,2)
    for line in pagelinks_file:
        separated_line = line.split(',')

        if (int(separated_line[-1])==0 and separated_line[1]=='0'): # namespace 0 = article
            id_from = separated_line[0] # link from
            page_title = separated_line[2] # link to page_name

            if (page_dict.get(page_title) != None):
                if (redirects_dict_id_to_id.get(int(id_from))!= None and int(redirects_dict_id_to_id.get(int(id_from)))==int(page_dict.get(page_title))):
                    pass # we do not need redirect links
                elif (redirects_dict_id_to_id.get(int(page_dict.get(page_title)))!=None):
                    '''
                    taking care of redirects
                    If link: C->A and redirect A->B, save only link C->B
                    '''
                    #print("Link from: _ to: _ ",id_from,page_title, page_dict.get(page_title))
                    #print("Redirect from: _ to: _", page_dict.get(page_title), redirects_dict_id_to_id.get(int(page_dict.get(page_title))))
                    redirected_link_to = redirects_dict_id_to_id.get(int(page_dict.get(page_title)))
                    page_links = np.vstack([page_links, [id_from, redirected_link_to]])

                else:
                    page_links = np.vstack([page_links, [id_from, page_dict.get(page_title)]])
            '''
            else:
                #print("https://ve.wikipedia.org/wiki/%s"%page_title[1:-1])
                r = requests.get("https://ve.wikipedia.org/wiki/%s"%page_title[1:-1])
                #print("Status", r)

                if (r.status_code==404):
                    non_existing_pages = non_existing_pages+1
                else:
                    print(r)
                    print(page_title)
            '''

    unique_ids = sorted(list(set(page_links.ravel())))
    ## mapping: 1->0, 1574->1, 1888->2, ..., 3718->256

    map_dict = {}
    j=0
    for i in unique_ids:
        map_dict[int(i)] = j
        j=j+1


    i=0
    view_counts = np.zeros((len(unique_ids), 2))
    for pg in unique_ids:
        pg_name = page_dict_inv.get(int(pg))
        print(wiki_name, pg_name[1:-1])
        url = "https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/%s.wikipedia/all-access/user/%s/daily/20150111/20160111"%(wiki_name,pg_name[1:-1])
        r = requests.Session()
        r.mount(url, HTTPAdapter(max_retries=5))
        try:
            r = r.get(url)
            if r.status_code == 200:
                data = r.json()
                if (len(data)!=0):

                    for d in data['items']:
                        view_counts[i, 1] = view_counts[i, 1] + d['views']# view count!

            view_counts[i, 0] = (map_dict.get(int(pg)))
            i=i+1
            #print(page_dict[pg])
        except requests.exceptions.ConnectionError:
            print("Connection refused")
    view_counts = (view_counts[np.argsort(view_counts[:,0])])
    view_counts[:,1]=view_counts[:,1]/np.sum(view_counts[:,1])

    #  make adjacency matrix
    A = np.zeros((len(unique_ids), len(unique_ids)))


    for link in page_links:
        link_from = map_dict.get(int(link[0]))
        link_to = map_dict.get(int(link[1]))
        A[link_to, link_from] = 1


    A = sp.csr_matrix(A) # make it sparse
    #pickle.dump(A, open(folder_path+"A.p", "wb"))
    #pickle.dump(view_counts, open(folder_path+"view_counts.p", "wb"))


    with open('unique_ids.json', 'w') as fp:
        json.dump(unique_ids, fp)
    with open('page_dict.json', 'w') as fp:
        json.dump(page_dict, fp)

    with open('page_dict_inv.json', 'w') as fp:
        json.dump(page_dict_inv, fp)
    with open('redirects_dict.json', 'w') as fp:
        json.dump(redirects_dict, fp)
    with open('redirects_dict_id_to_id.json', 'w') as fp:
        json.dump(redirects_dict_id_to_id, fp)
    return A, view_counts


def make_txt_files(files):
    #pagelinks_file = open('Data/sowiki/sowiki-20160111-pagelinks.sql','r')

    for f in files:
        sql_dump = open(f, "r")
        fl = open(f.replace(".sql", ".txt"), "a")
        for l in sql_dump:
            if (l.startswith("INSERT INTO")):
                vals_tmp = (l[l.find("("):-3])
                vals_tmp = (vals_tmp.replace("(",""))
                vals_tmp = (vals_tmp.replace("),", "\n"))
                fl.write(vals_tmp)


#preprocess(['Data/vewiki/vewiki-20160111-pagelinks.sql','Data/vewiki/vewiki-20160111-page.sql', 'Data/vewiki/vewiki-20160111-redirect.sql'], make_txt="False")

#r = requests.get('https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/ve.wikipedia/all-access/user/Hayani/daily/20160111/20160112')
#%data = (r.json())
#data = data['items'][0]['views']
#print(data)

