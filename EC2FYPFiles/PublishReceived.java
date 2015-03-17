 String clientID = clientData.getClientId();
        String topic = publish.getTopic();
        String message = new String(publish.getPayload(), Charsets.UTF_8);

try {
        		final PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `table` (col,col) VALUES (?,?)");
        		preparedStatement.setString(1, clientID);
        		preparedStatement.setString(2, topic);
        		preparedStatement.setString(3, message);

        		preparedStatement.execute();
        		preparedStatement.close();
        	} catch (SQLException e) {
        		logger.error("An error occured while preparing the SQL statement", e);
        	} finally {
        		try {
        			connection.close();
        		} catch (SQLException e) {
        			logger.error("An error occured while giving back a connection to the connection pool");
        		}
        	}
