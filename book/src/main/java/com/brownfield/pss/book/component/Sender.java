package com.brownfield.pss.book.component;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.stereotype.Component;

import org.springframework.cloud.stream.annotation.Output;

@EnableBinding(BookingSource.class)
@RefreshScope
@Component
public class Sender {

	public Sender() {

	}

	/**
	 * RabbitMessagingTemplate template;
	 * 
	 * @Autowired Sender(RabbitMessagingTemplate template){ this.template =
	 *            template; }
	 * @Bean Queue queue() { return new Queue("InventoryQ", false); }
	 * @Bean Queue queue1() { return new Queue("CheckInQ", false); }
	 * 
	 **/

	@Output(BookingSource.INVENTORYQ)
	@Autowired
	private MessageChannel messageChannel;

	public void send(Object message) {
		// template.convertAndSend("InventoryQ", message);

		System.out.println("Output InventoryQ:"+message.toString());
		boolean result = messageChannel.send(MessageBuilder.withPayload(message).build());
		System.out.println("Result:" + result);
	}
}

interface BookingSource {
	public static String INVENTORYQ = "inventoryQ";

	@Output(BookingSource.INVENTORYQ)
	public MessageChannel inventoryQ();

}
