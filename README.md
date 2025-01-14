# Race Condition in Asynchronous Network Request

This repository demonstrates a race condition in asynchronous network request handling in Swift and provides a solution.

## Bug

The `fetchData` function simulates an asynchronous network request.  Due to the use of `DispatchQueue.global()`, calling `fetchData` multiple times rapidly can lead to unpredictable results. If an error occurs in one of the requests, the application might crash or handle the response incorrectly.

## Solution

The solution uses a `DispatchSemaphore` to ensure that only one network request executes concurrently. This prevents multiple network requests from interfering with each other and guarantees that the completion handlers are called correctly in the correct order.