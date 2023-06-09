package com.linh.service.imp;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.linh.model.ChatMessage;
import com.linh.model.ChatRoom;
import com.linh.model.ConnectedUser;
import com.linh.respository.IChatRoomRepo;
import com.linh.service.IChatMessageService;
import com.linh.service.IChatRoomService;
import com.linh.utils.Destination;
import lombok.AllArgsConstructor;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessageType;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

@Service
@AllArgsConstructor
public class ChatRoomService implements IChatRoomService {

    private final IChatRoomRepo chatRoomRepo;
    private final SimpMessagingTemplate webSocketMessagingTemplate;
    private final IChatMessageService messageService;

    @Override
    public ChatRoom save(ChatRoom chatRoom) {
        chatRoom.setConnectedUsers("[]");
        return chatRoomRepo.saveAndFlush(chatRoom);
    }

    @Override
    public List<ChatRoom> findAll() {
        return chatRoomRepo.findAll();
    }

    @Override
    public ChatRoom findByUserId(Integer userId) {
        return chatRoomRepo.findByUserId(userId);
    }

    @Override
    public List<ChatRoom> findByAdminId(Integer adminId) {
        return chatRoomRepo.findByAdminId(adminId);
    }

    @Override
    public ChatRoom findById(Integer id) {
        return chatRoomRepo.findById(id).get();
    }

    @Override
    public ChatRoom join(Integer chatRoomId, ConnectedUser user) {
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            ChatRoom chatRoom = chatRoomRepo.findById(chatRoomId).get();
            List<ConnectedUser> connectedUsersList = objectMapper.readValue(chatRoom.getConnectedUsers(), ArrayList.class);
            connectedUsersList.add(user);
            String connectedUsers = objectMapper.writeValueAsString(connectedUsersList);
            chatRoom.setConnectedUsers(connectedUsers);
            chatRoom = chatRoomRepo.save(chatRoom);

//            updateConnectedUsersViaWebSocket(chatRoom);
            return chatRoom;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public ChatRoom leave(Integer chatRoomId, ConnectedUser user) throws JsonProcessingException {
        ObjectMapper objectMapper = new ObjectMapper();
        ChatRoom chatRoom = chatRoomRepo.findById(chatRoomId).get();
        List<LinkedHashMap<String, String>> connectedUsersList = objectMapper.readValue(chatRoom.getConnectedUsers(), ArrayList.class);
        for (LinkedHashMap<String, String> item : connectedUsersList){
            if (item.get("username").equals(user.getUsername())){
                connectedUsersList.remove(item);
                break;
            }
        }
        String connectedUsers = objectMapper.writeValueAsString(connectedUsersList);
        chatRoom.setConnectedUsers(connectedUsers);
        chatRoom = chatRoomRepo.save(chatRoom);
//        updateConnectedUsersViaWebSocket(chatRoom);
        return chatRoom;
    }

    @Override
    public void sendPublicMessage(ChatMessage message) throws JsonProcessingException {
        webSocketMessagingTemplate.convertAndSend(
                Destination.publicMessages(message.getChatRoomId()+""),
                message
        );
        messageService.appendInstantMessageToConversations(message);
    }

    @Override
    public void sendPrivateMessage(ChatMessage message) throws JsonProcessingException {
        webSocketMessagingTemplate.convertAndSendToUser(
                message.getToUser(),
                Destination.privateMessages(message.getChatRoomId()+""),
                message);

        webSocketMessagingTemplate.convertAndSendToUser(
                message.getFromUser(),
                Destination.privateMessages(message.getChatRoomId()+""),
                message);

        messageService.appendInstantMessageToConversations(message);
    }

    @Override
    public void loadOldMessage(Integer chatRoomId, String username) {
        List<ChatMessage> oldMessages = messageService.findByChatRoomId(chatRoomId);
        webSocketMessagingTemplate.convertAndSendToUser(
                    username,
                    Destination.oldMessages(chatRoomId+""),
                    oldMessages);
    }

    public void updateConnectedUsersViaWebSocket(ChatRoom chatRoom) throws JsonProcessingException {
        List<ConnectedUser> connectedUsers = new ObjectMapper().readValue(chatRoom.getConnectedUsers(), ArrayList.class);
        webSocketMessagingTemplate.convertAndSend(
                Destination.connectedUsers(chatRoom.getId()+""),
                connectedUsers
        );
    }
}
