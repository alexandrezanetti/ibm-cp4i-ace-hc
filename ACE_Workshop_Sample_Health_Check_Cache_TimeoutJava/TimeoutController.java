
import java.util.concurrent.*;

public class TimeoutController {

    public Object callWithTimeout(Callable<Object> callableTask, long timeoutInMillis) throws TimeoutException, Exception {
        ExecutorService executor = Executors.newSingleThreadExecutor();
        Future<Object> future = executor.submit(callableTask);
        
        try {
            // Wait for the specified timeout
            return future.get(timeoutInMillis, TimeUnit.MILLISECONDS);
        } catch (TimeoutException e) {
            // Cancel the task if it times out
            future.cancel(true); 
            throw new TimeoutException("Task timed out after " + timeoutInMillis + " milliseconds.");
        } catch (ExecutionException e) {
            // If the task threw an exception
            throw new Exception("Task execution failed: " + e.getCause());
        } catch (InterruptedException e) {
            // Handle thread interruption
            Thread.currentThread().interrupt();
            throw new Exception("Task was interrupted.");
        } finally {
            executor.shutdownNow(); // Ensure executor is shut down
        }
    }
}
