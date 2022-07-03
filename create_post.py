blog_post_name = input("Enter title of blog post: ")
filename = blog_post_name.replace(" ","-",99)
filename = filename.lower()


with open(f"posts/{filename}.md",'w') as f:
    f.write(f"# {blog_post_name}")