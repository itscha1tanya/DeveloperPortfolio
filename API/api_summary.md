# API Integration Summary

## 1. What is a REST API?

A REST API allows different software applications to communicate and exchange data over the internet using HTTP requests.

## 2. HTTP Status Codes

- **200 OK:** The request was successful, and the server returned the requested data.
- **404 Not Found:** The requested resource could not be found on the server.

## 3. GitHub API

The GitHub REST API was used to retrieve my public GitHub profile information.

The following details were extracted:
- Name
- Public repositories
- Followers
- Account creation date

## 4. JSONPlaceholder API

The JSONPlaceholder API was used to retrieve sample post data.

A total of 100 posts were received successfully.

## 5. Role of jq

jq is a command-line tool used to process and filter JSON data.

The `length` filter counts the number of elements in a JSON array.

The selected fields from the GitHub API were extracted using a jq filter.
