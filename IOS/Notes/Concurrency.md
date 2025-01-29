
# What is Concurrency?

* Concurrency is defined as the fact of two or more events or circumstances happening or existing at the same time.
* In programming, concurrency refers to the execution of multiple instruction sequences at the same time or appearing to take place at the same time [2].

## Serial vs Concurrent Queues

* **Serial queues** execute one task at a time.
* **Concurrent queues** can execute multiple tasks simultaneously.
* Even in concurrent queues, tasks are dequeued serially but can process at the same time and also it can not be started at the same time.
* The key takeaway is that serial or concurrent affects the destination queue, while sync and async affect the current thread.

### Concurrency in iOS: A Detailed Overview

The video focuses on providing a solid foundation in **concurrency** for iOS developers, explaining how it is achieved using various methods and how to avoid common pitfalls.

#### Concurrency vs. Parallelism

* **Concurrency** is when multiple tasks appear to happen at the same time, but they may be taking turns using a single resource.
  * Think of a **telephone operator** who seems to be handling multiple calls simultaneously but is actually switching between them.
  * This is achieved via techniques such as time slicing and context switching.
* **Parallelism** is when multiple tasks are actually happening at the same time, using multiple processing resources.
  * Think of a **super mom** who is doing multiple tasks simultaneously.
  * Parallelism involves multiple resources and can give more speed, but involves more cost.

#### Time Slicing and Context Switching

* **Time Slicing**: This is the process where the OS gives each thread or task a small amount of time to execute before pausing it.
  * The scheduler grants each thread a period of time before the preemption (pausing) occurs.
* **Context Switching**: This is the act of saving the current state of a thread or task (like the values in registers, stack pointer, program counter) so it can be resumed later.
  * This allows the system to switch rapidly between tasks, giving the appearance of simultaneous execution.
  * These switches happen very frequently, which creates the illusion that multiple tasks are being executed at the same point of time although they are not.

#### Multi-threading

* Concurrency in iOS is achieved through **multi-threading**, where multiple threads execute tasks.
  * This means multiple instruction sequences are being executed at the same time.
* Although you can create threads manually, it's not recommended due to the issues this introduces.
  * Manual threads provide more control, but also more responsibility. Developers need to handle thread management, resource deallocation, and memory leaks.

#### Grand Central Dispatch (GCD)

* **GCD** is a framework by Apple to execute code concurrently on multi-core hardware.
  * It simplifies concurrent programming using **dispatch queues**.
  * Tasks are submitted to these queues as closures or blocks.
  * GCD manages a **pool of threads** and decides which thread will execute which task depending on priority and quality of service.
  * The developer only needs to submit the task, with GCD handling everything else.
* GCD uses a **worker pool** of threads to execute tasks taken from a queue in FIFO order.
* GCD abstracts away the complexity of managing threads, letting developers focus on tasks.

#### Dispatch Queues

* **Dispatch queues** are an abstraction layer over queues of tasks managed by GCD.
  * They operate on a **first-in, first-out (FIFO)** basis.
  * Tasks are picked up in the order they are submitted to the queue.
* **Serial queues** execute one task at a time.
  * Tasks are executed sequentially, one after the other.
* **Concurrent queues** can execute multiple tasks simultaneously, but the tasks are still dequeued in a serial manner.
  * The start of each task is after the previous one, but the completion can happen before tasks that started earlier.

#### Synchronous vs Asynchronous Execution

* The **manner of execution** defines how a task is executed—whether it blocks the current execution or not.
  * **Synchronous execution** blocks the current thread until the submitted task is completed.
    * The current execution stops until the submitted job has finished.
  * **Asynchronous execution** does not block the current thread. It returns the control immediately so the current execution keeps running and the submitted task is executed separately.
    * The task will be executed either at the same time or later, but without blocking the current thread.
* **Key Difference**:
  * Serial/concurrent affects the **destination queue** where the task is submitted.
  * Sync/async affects the **current thread** from where the dispatch takes place.

### Data Inconsistency

* **Data inconsistency** is the primary challenge with concurrency, which is often the source of crashes and other issues.
* It involves problems like **phantom reads and lost updates**.
* A good understanding of concurrency is necessary to solve data inconsistency issues.

### Main Queue

* The **main queue** is a special serial queue used primarily for updating the UI.

### Code Snippet

* Here's the code snippet that demonstrates the manual creation of a thread:

``` swift
class CustomThread {
    func createThread() {
        let thread = Thread(target: self, selector: #selector(threadSelector), object: nil)
        thread.start()
    }

    @objc func threadSelector() {
        print("Custom thread in action")
    }
}

let customThread = CustomThread()
customThread.createThread()
```

* This code demonstrates manual thread creation, which is not a recommended practice.
* The main queue is a specific serial queue used mainly for updating the UI1.

### Quality of Service (QoS)

* Quality of Service (QoS) is an abstract parameter used to specify the priority of tasks dispatched to global concurrent queues, ensuring efficient use of system resources2.
* QoS helps the system allocate the necessary resources based on the type of job that is being performed.

### The QoS options are

* User Interactive: Used for animations and user interactive jobs. Has the highest priority5.
* User-Initiated: Used when immediate results are required for tasks initiated by the user, such as scrolling a table view.4. Has high priority5.
* Utility: Used for long-running tasks, such as downloads, where the user is aware of the progress4. Has medium priority5.
* Background: Used for tasks that are not visible to the user, such as backups4. Has the lowest priority.
* Default: Falls between user-initiated and utility in terms of priority5.
* Unspecified: Used when QoS information is missing, having the least priority5.

### Target Queues

* A target queue is a queue on which the actual execution of tasks dispatched to custom queues happens6.

* All tasks dispatched to either global concurrent or custom queues are executed on a fixed set of queues, known as target queues6.
* The priority of any custom queue is inherited from its target queue7.
* You can use target queues to make different queues serial to each other8.
* Target queues can also be used to change the priority of a task.
* If a target queue is not set at the time of initialization, it cannot be changed later.

### Auto Release Frequency

* Auto release frequency is a constant that specifies how often a dispatch queue auto-releases objects9. It's related to ARC (Automatic Reference Counting) memory management9.

* The options for auto-release frequency are:
* Inherit: The behavior is inherited from the target queue10.
* Work Item: An individual auto-release pool is set up for the dispatch queue10.
* Never: A separate auto-release pool is never set up for the dispatch queue10.

### General Concept Questions

1. **What is the difference between synchronous execution and asynchronous execution?**

    * **Synchronous** execution blocks the current thread until the task is completed.

    * **Asynchronous** execution does not block the current thread, allowing it to continue executing while the task runs elsewhere.

2. **What is the difference between a serial queue and a concurrent queue?**

    * **Serial Queue**: Executes one task at a time in a FIFO (First-In-First-Out) order.

    * **Concurrent Queue**: Executes multiple tasks simultaneously but still dequeues tasks in FIFO order.

3. **What is the difference between serial vs. synchronous and concurrent vs. asynchronous?**

    * **Serial vs. Concurrent** affects the destination queue, dictating whether tasks execute one at a time or simultaneously.

    * **Synchronous vs. Asynchronous** affects the current thread, determining whether it is blocked or allowed to continue execution.

4. **What is QoS (Quality of Service), and where should you use which one?**  
    QoS controls how system resources are allocated to tasks.

    * **User Interactive**: For UI updates and immediate results.

    * **User Initiated**: For tasks requiring immediate data, like loading table view rows.

    * **Utility**: For long-running tasks with progress updates, such as downloading files.

    * **Background**: For tasks invisible to users, like backups or migrations.

---

### Predict the Output

1. **What will be the output of a given concurrency-related code?**

    * **Serial Queue**: Tasks execute one by one in order.

    * **Concurrent Queue**: Tasks can run simultaneously, but their order depends on complexity.

    * If tasks append results to a shared resource (like a string) and print the result afterward, the batch will print together, preserving execution order within the batch.

---

### Practical Application Questions

1. **How can you make multiple API calls together and proceed only on the completion of all?**  
    Use **Dispatch Group**:

    * Add tasks to the group using `enter()` and mark them complete with `leave()`.

    * When all tasks are completed, `notify()` is called to proceed.

2. **How can you fix the issue in code to handle race conditions or critical sections?**

    * Use synchronization tools like **Dispatch Barrier**, **Semaphore**, or **Locks** to manage access to the critical section and prevent simultaneous execution.

3. **What is the difference between GCD and Operation Queue?**

    * **GCD (Grand Central Dispatch)** is a low-level API for task management. It is simple, efficient, but provides less control.

    * **Operation Queue** is built on top of GCD, offering higher-level abstractions like task dependencies, reusability, and pause/resume capabilities.

4. **Can we cancel a task in GCD?**  
    Yes, using **Dispatch Work Item**, which allows cancellation of tasks before execution starts.

5. **How can you make an operation asynchronous?**

    * Track operation states (`isExecuting`, `isFinished`) using **KVO (Key-Value Observing)**.

    * Override the `start` and `cancel` methods to manage state transitions.
    * Perform the task asynchronously, updating the state appropriately.

6. **How can you add dependencies between tasks?**

    * **Operation Queue**: Use the `addDependency` method to specify dependencies between operations.

    * **GCD**: Use **Dispatch Semaphore** or **Dispatch Barrier** to coordinate task execution.

7. **How can you make a class thread-safe?**

    * Identify critical sections and protect them using synchronization mechanisms like **Dispatch Barrier**, **Semaphore**, or **Locks**.

8. **Are structs thread-safe? If yes, how?**

    * Yes, structs are thread-safe because they are value types, and each thread gets its copy when a struct is used

9. **What else is thread-safe besides structs?**

    * **Actors**, introduced in Swift, provide a thread-safe environment for managing state.

10. **Can you update the UI on a background thread?**  
    No, UIKit is tied to the **main thread** because:

    * UI updates are rendered in the **main run loop**.

    * Graphics rendering (like rasterization and pixel placement) must occur synchronously to prevent flickering.

### Follow-Up and Advanced Questions

1. **What is the purpose of the main thread, and why is UIKit tied to it?**

    * The **main thread** ensures UI updates happen in a synchronized and flicker-free manner. UIKit is tied to it to guarantee consistent rendering and a smooth user experience.

2. **How does the graphics rendering pipeline work about threading?**

    * When UI changes occur, components like labels and buttons are rasterized and converted into pixels. This process must be synchronized on the main thread to ensure proper placement and avoid rendering issues.

3. **If I create a framework similar to UIKit that allows UI updates on a background thread, will it work? Why or why not?**

    * It won’t work effectively because asynchronous updates may cause flickering or incomplete rendering. Graphics rendering relies on sequential and synchronized updates.

#### Notes

* Custom queues are serial unless you specify the .concurrent attribute.
* Target queues are where tasks are executed, but they don't change whether your custom queue is serial or concurrent.
* The default target queue is a concurrent global queue, but your custom queue will not become concurrent unless you specifically set it as concurrent when creating the queue using the attributes parameter.
