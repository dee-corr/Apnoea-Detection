import com.dcsquare.hivemq.spi.callback.CallbackPriority;
import com.dcsquare.hivemq.spi.callback.events.broker.OnBrokerStop;
import com.zaxxer.hikari.HikariDataSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.inject.Inject;

public class HiveMQStop implements OnBrokerStop {

    private static Logger log = LoggerFactory.getLogger(HiveMQStop.class);
    private final HikariDataSource hikariDataSource;


    @Inject
    public HiveMQStop(final HikariDataSource hikariDataSource) {
        this.hikariDataSource = hikariDataSource;
    }

    @Override
    public void onBrokerStop() {
        log.info("Shutting down DB connection pool");
        hikariDataSource.shutdown();
    }

    @Override
    public int priority() {
        return CallbackPriority.LOW;
    }
}
