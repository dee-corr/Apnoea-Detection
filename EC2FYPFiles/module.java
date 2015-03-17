@Provides
@Singleton
public HikariDataSource provideConnectionPool() {



        final HikariConfig config = new HikariConfig();
        config.setMaximumPoolSize(15);
        config.setDataSourceClassName("com.mysql.jdbc.jdbc2.optional.MysqlDataSource");
        config.addDataSourceProperty("serverName", "localhost");
        config.addDataSourceProperty("port", "put port number here");
        config.addDataSourceProperty("databaseName", "put name here");
        config.addDataSourceProperty("user", "put user name here");
        config.addDataSourceProperty("password", "put password here");

        config.addDataSourceProperty("cachePrepStmts", true);
        config.addDataSourceProperty("prepStmtCacheSize", 250);
        config.addDataSourceProperty("useServerPrepStmts", true);

        return new HikariDataSource(config);

    }
