import csv
from jobspy import scrape_jobs

# I choose only Indeed as I can take skills from descreption
df = scrape_jobs(
    site_name=["indeed"],
    search_term='"data engineer"',
    google_search_term="",
    location="France",
    results_wanted=300,
    #hours_old=168, #max week
    country_indeed='France',
    # linkedin_fetch_description=True # gets more info such as description, direct job url (slower)
    # proxies=["208.195.175.46:65095", "208.195.175.45:65095", "localhost"],
)
print(f"Found {len(df)} jobs")