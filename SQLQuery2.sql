WITH total_received AS (
	SELECT SUM(Transactions.amount) as total_amount
		FROM Transactions
	WHERE Transactions.receiver_id = 1
	GROUP BY Transactions.receiver_id
), total_sent AS (
	SELECT SUM(Transactions.amount) as total_amount
		FROM Transactions
	WHERE Transactions.senders_id = 1
	GROUP BY Transactions.senders_id
) SELECT total_received.total_amount - total_sent.total_amount AS Sum FROM total_received, total_sent