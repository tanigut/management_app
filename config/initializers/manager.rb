Rails.application.configure do 
  config.manager = {
    staff: { host: "manager.example.com", path: "" },
    admin: { host: "manager.example.com", path: "admin" },
    customer: { host: "example.com", path: "mypage" },
    restrict_ip_addresses: ENV["RESTRICT_IP_ADDRESS"] == "1"
  }
end
