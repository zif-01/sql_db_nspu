SELECT 
    User.FullName AS UserName,
    Ticket.TicketID,
    Ticket.Subject,
    Ticket.CreatedAt,
    Ticket.StatusID
FROM 
    User
LEFT JOIN 
    Ticket ON User.UserID = Ticket.UserID
ORDER BY 
    UserName, Ticket.CreatedAt DESC;

SELECT 
    SupportAgent.FullName AS AgentName,
    COUNT(Ticket.TicketID) AS TicketCount
FROM 
    SupportAgent
LEFT JOIN 
    Ticket ON SupportAgent.AgentID = Ticket.AgentID
GROUP BY 
    SupportAgent.AgentID, SupportAgent.FullName
ORDER BY 
    TicketCount DESC;

SELECT 
    Ticket.TicketID,
    Ticket.Subject,
    Ticket.CreatedAt,
    TicketStatus.StatusName,
    Category.CategoryName
FROM 
    Ticket
INNER JOIN 
    TicketStatus ON Ticket.StatusID = TicketStatus.StatusID
INNER JOIN 
    Category ON Ticket.CategoryID = Category.CategoryID
ORDER BY 
    Ticket.CreatedAt DESC;

SELECT 
    Department.DepartmentName,
    COUNT(SupportAgent.AgentID) AS AgentCount
FROM 
    Department
LEFT JOIN 
    SupportAgent ON Department.DepartmentID = SupportAgent.DepartmentID
GROUP BY 
    Department.DepartmentID, Department.DepartmentName
ORDER BY 
    AgentCount DESC;

SELECT 
    Ticket.TicketID,
    Ticket.Subject,
    Ticket.Description,
    Ticket.UpdatedAt
FROM 
    Ticket
WHERE 
    Ticket.UpdatedAt >= NOW() - INTERVAL 7 DAY
ORDER BY 
    Ticket.UpdatedAt DESC;

SELECT 
    Category.CategoryName,
    COUNT(Ticket.TicketID) AS TicketCount,
    AVG(TIMESTAMPDIFF(HOUR, Ticket.CreatedAt, Ticket.UpdatedAt)) AS AvgProcessingTime
FROM 
    Category
LEFT JOIN 
    Ticket ON Category.CategoryID = Ticket.CategoryID
GROUP BY 
    Category.CategoryID, Category.CategoryName
ORDER BY 
    TicketCount DESC;

SELECT 
    Ticket.TicketID,
    Ticket.Subject,
    Ticket.CreatedAt,
    SupportAgent.FullName AS AgentName,
    Department.DepartmentName
FROM 
    Ticket
INNER JOIN 
    SupportAgent ON Ticket.AgentID = SupportAgent.AgentID
INNER JOIN 
    Department ON SupportAgent.DepartmentID = Department.DepartmentID
WHERE 
    Department.DepartmentName = 'Отдел технической поддержки'
ORDER BY 
    Ticket.CreatedAt DESC;

SELECT 
    SupportAgent.FullName AS AgentName,
    COUNT(Ticket.TicketID) AS ClosedTickets
FROM 
    SupportAgent
INNER JOIN 
    Ticket ON SupportAgent.AgentID = Ticket.AgentID
INNER JOIN 
    TicketStatus ON Ticket.StatusID = TicketStatus.StatusID
WHERE 
    TicketStatus.StatusName = 'Закрыт'
GROUP BY 
    SupportAgent.AgentID, SupportAgent.FullName
ORDER BY 
    ClosedTickets DESC;

SELECT 
    User.FullName AS UserName,
    COUNT(Ticket.TicketID) AS TicketCount
FROM 
    User
LEFT JOIN 
    Ticket ON User.UserID = Ticket.UserID
GROUP BY 
    User.UserID, User.FullName
ORDER BY 
    TicketCount DESC
LIMIT 10;

SELECT 
    Ticket.TicketID,
    Ticket.Subject,
    Ticket.Description,
    Ticket.CreatedAt
FROM 
    Ticket
WHERE 
    Ticket.AgentID IS NULL
ORDER BY 
    Ticket.CreatedAt DESC;
