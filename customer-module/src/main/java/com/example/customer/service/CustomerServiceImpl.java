package com.example.service;

import com.example.domain.CustomerProfile;
import com.example.domain.CustomerProfileDTO;
import com.example.domain.CustomerUser;
import com.example.domain.CustomerDTO;
import com.example.repository.CustomerProfileRepository;
import com.example.repository.CustomerRepository;
import jakarta.persistence.EntityNotFoundException;
import jakarta.transaction.Transactional;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;



@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {
    
    private final CustomerRepository customerRepository;
    private final CustomerProfileRepository profileRepository;
    private final PasswordEncoder passwordEncoder;
    
    public CustomerServiceImpl(CustomerRepository customerRepository,
                               CustomerProfileRepository profileRepository,
                               PasswordEncoder passwordEncoder) {
        this.customerRepository = customerRepository;
        this.profileRepository = profileRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public CustomerDTO createUser(CustomerDTO dto) {
        CustomerUser user = new CustomerUser();
        user.setUuid(UUID.randomUUID().toString());
        user.setUserName(dto.userName());
        user.setPassword(passwordEncoder.encode(dto.password()));
        user.setActivated(dto.activated());
        user.setImageUrl(dto.imageUrl());
        
        CustomerUser saved = customerRepository.save(user);
        if(dto.profile()!= null){
            CustomerProfileDTO pprofileDTO = dto.profile() ;
            createProfile(saved,pprofileDTO);
            
        }
        return toDTO(saved);
    }
    
    private void createProfile(CustomerUser user, CustomerProfileDTO dto) {
        
        CustomerProfile profile = new CustomerProfile();
        profile.setFirstName(dto.firstName());
        profile.setMiddleName(dto.middleName());
        profile.setLastName(dto.lastName());
        profile.setPhone(dto.phone());
        profile.setEmail(dto.email());
        profile.setGender(dto.gender());
        profile.setCustomer(user);
        profile.setCreatedBy("admin");
        
        
        profileRepository.save(profile);
        
    }
    @Override
    public CustomerDTO getUserById(Long id) {
        CustomerUser user = customerRepository.findById(id)
                                    .orElseThrow(() -> new EntityNotFoundException("Customer not found with ID: " + id));
        return toDTO(user);
    }
    
    @Override
    public List<CustomerDTO> getAllUsers() {
        return customerRepository.findAll().stream()
                       .map(this::toDTO)
                       .toList();
    }
    
    @Override
    public CustomerDTO updateUser(Long id, CustomerDTO dto) {
        CustomerUser user = customerRepository.findById(id)
                                    .orElseThrow(() -> new EntityNotFoundException("Customer not found with ID: " + id));

        user.setUserName(dto.userName());
        user.setImageUrl(dto.imageUrl());
        user.setActivated(dto.activated());
        if(dto.password()!=null && dto.password().isBlank()){
            user.setPassword(passwordEncoder.encode(dto.password()));
        }
        if(dto.profile()!= null){
            updateProfile(user.getId(), dto.profile());
        }
        return toDTO(customerRepository.save(user));
    }
    
    
    @Override
    public CustomerProfileDTO getProfileByUserId(Long userId) {
        CustomerUser customer = customerRepository.findById(userId)
                                        .orElseThrow(() -> new EntityNotFoundException("Customer not found with ID: " + userId));
        
        return profileRepository.findByCustomer(customer)
                       .map(this::toDTO)
                       .orElse(null);
    }
    

private void updateProfile(Long userId, CustomerProfileDTO dto) {
        CustomerUser customer = customerRepository.findById(userId)
                                        .orElseThrow(() -> new EntityNotFoundException("Customer not found with ID: " + userId));

        CustomerProfile profile = profileRepository.findByCustomer(customer)
                                          .orElseThrow(() -> new EntityNotFoundException("Profile not found for user ID: " + userId));

        profile.setFirstName(dto.firstName());
        profile.setMiddleName(dto.middleName());
        profile.setLastName(dto.lastName());
        profile.setPhone(dto.phone());
        profile.setEmail(dto.email());
        profile.setGender(dto.gender());
        profile.setUpdatedBy("sysem");
        profileRepository.save(profile);
        
    }

    @Override
    public void deleteUser(Long id) {
        if (!customerRepository.existsById(id)) {
            throw new EntityNotFoundException("Customer not found with ID: " + id);
        }
        customerRepository.deleteById(id);
    }
    @Override
    public void deleteProfileByUserId(Long userId ) {
        CustomerUser customer = customerRepository.findById(userId)
                                        .orElseThrow(() -> new EntityNotFoundException("Customer not found with ID: " + userId));
        CustomerProfile profile = profileRepository.findByCustomer(customer)
                                                           .orElseThrow(() ->new EntityNotFoundException("Profile not found user ID" + userId));
        profileRepository.findByCustomer(customer)
                .ifPresent(profileRepository::delete);
        customer.setProfile(null);
        customerRepository.save(customer);
        profileRepository.delete(profile);
    }

    
    // Mapping methods
    private CustomerDTO toDTO(CustomerUser entity) {
        CustomerProfileDTO profileDTO = null;
        if (entity.getProfile() != null) {
            profileDTO = toDTO(entity.getProfile());
        }
        return new CustomerDTO(
                entity.getId(),
                entity.getUuid(),
                entity.getUserName(),
                entity.getPassword(),
                entity.getActivated(),
                entity.getImageUrl(),
                profileDTO
        );
    }
    
    private CustomerProfileDTO toDTO(CustomerProfile entity) {
        return new CustomerProfileDTO(
                entity.getId(),
                entity.getFirstName(),
                entity.getMiddleName(),
                entity.getLastName(),
                entity.getPhone(),
                entity.getEmail(),
                entity.getGender(),
                entity.getCustomerId().getId()
        );
    }
  
}
