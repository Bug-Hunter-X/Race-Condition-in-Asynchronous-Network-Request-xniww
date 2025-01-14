import Dispatch

func fetchData(completion: @escaping (Result<[String], Error>) -> Void) {
    semaphore.wait()
    // Simulate network request
    DispatchQueue.global().asyncAfter(deadline: .now() + 2) { 
        let data = ["item1", "item2", "item3"]
        // Simulate a network error
        if arc4random_uniform(2) == 0 {  // 50% chance of error
            completion(.failure(NSError(domain: "NetworkError", code: 1, userInfo: nil)))
        } else {
            completion(.success(data))
        }
        self.semaphore.signal()
    }
}

let semaphore = DispatchSemaphore(value: 1) 