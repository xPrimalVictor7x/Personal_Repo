import requests

# Check what functions requests offers
check_function = dir(requests)
print() #OR print(dir(requests)) 

# Primary functions for the requests library
	# r shows basic server response
	# r.content shows the response body in bytes
	# r.text shows the content from the servers response
	# r.status_code shows only the status code
	# r.ok shows TRUE or FALSE which is anything other than a 400 error
	# r.headers shows the header of the GET request
	# r.url shows the exact requested URL from the server
	# r.json() shows a python dictionary from a json response

# Sending GET Requests
payload = {'key1': 'value1'}
r = requests.get('https://httpbin.org/get', params= payload) # GET REQs use parameters instead of data
print()

# Sending POST requests
payload = {'key1': 'value1'} #OR {"firstName": "John", "lastName": "Smith"}
r = requests.post('https://httpbin.org/post', data= payload) # POST REQs use data instead of parameters
print()

# Sending basic-authenticated requests
r = requests.get('https://httpbin.org/basic-auth/user/passwd', auth=('user', 'passwd'))
print()

# Sending requests with Cookies and Headers
cookies = dict(key1= 'value1')
r = requests.get('https://httpbin.org/cookies', cookies= cookies) # In order to send cookies, its added as a dictionary
print()

# Downloading images using Requests and F
r = requests.get('https://imgs.xkcd.com/comics/python.png')
# print(r.content) ## Prints out the content in bytes
with open('comic.png', 'wb') as f:	#comic.png is the name of the file, wb means write bytes, open as "f"
	f.write(r.content)				#this will save in the current directory since the file path isn't specified
