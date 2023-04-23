require 'kafka'

kafka = Kafka.new(
  seed_brokers: ['172.18.0.2:9092'],
  client_id: 'book_shop'
)

KAFKA_TOPIC = 'book_shop_topic'

producer = kafka.producer

at_exit { producer.shutdown }

KafkaProducer = producer

$kafka = Kafka.new(kafka_config)