-- Create users table
CREATE TABLE IF NOT EXISTS users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  email TEXT NOT NULL UNIQUE,
  password TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Create customers table
CREATE TABLE IF NOT EXISTS customers (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  email TEXT NOT NULL UNIQUE,
  image_url TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Create invoices table
CREATE TABLE IF NOT EXISTS invoices (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  customer_id UUID NOT NULL REFERENCES customers(id),
  amount INTEGER NOT NULL,
  date DATE NOT NULL,
  status TEXT NOT NULL CHECK (status IN ('pending', 'paid')),
  created_at TIMESTAMP DEFAULT NOW()
);

-- Create revenue table
CREATE TABLE IF NOT EXISTS revenue (
  month TEXT NOT NULL PRIMARY KEY,
  revenue INTEGER NOT NULL
);

-- Insert placeholder data for users
INSERT INTO users (id, name, email, password) VALUES
('410544b2-4001-4271-9855-fec4b6a6442a', 'User', 'user@nextmail.com', '$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi')
ON CONFLICT (email) DO NOTHING;

-- Insert placeholder data for customers
INSERT INTO customers (id, name, email, image_url) VALUES
('d6e15727-9fe1-4961-8c5b-ea44a9bd81aa', 'Evil Rabbit', 'evil@rabbit.com', '/customers/evil-rabbit.png'),
('3958dc9e-712f-4377-85e9-fec4b6a6442a', 'Delba de Oliveira', 'delba@oliveira.com', '/customers/delba-de-oliveira.png'),
('3958dc9e-742f-4377-85e9-fec4b6a6442a', 'Lee Robinson', 'lee@robinson.com', '/customers/lee-robinson.png'),
('76d65c26-f784-44a2-ac19-586678f7c2f2', 'Michael Novotny', 'michael@novotny.com', '/customers/michael-novotny.png'),
('CC27C14A-0ACF-4F4A-A6C9-D45682C144B9', 'Amy Burns', 'amy@burns.com', '/customers/amy-burns.png'),
('13D07535-C59E-4157-A011-F8D2EF4E0CBB', 'Balazs Orban', 'balazs@orban.com', '/customers/balazs-orban.png')
ON CONFLICT (email) DO NOTHING;

-- Insert placeholder data for invoices
INSERT INTO invoices (customer_id, amount, date, status) VALUES
('d6e15727-9fe1-4961-8c5b-ea44a9bd81aa', 15795, '2022-12-06', 'pending'),
('3958dc9e-712f-4377-85e9-fec4b6a6442a', 20348, '2022-11-14', 'pending'),
('CC27C14A-0ACF-4F4A-A6C9-D45682C144B9', 3040, '2022-10-29', 'paid'),
('76d65c26-f784-44a2-ac19-586678f7c2f2', 44800, '2023-09-10', 'paid'),
('13D07535-C59E-4157-A011-F8D2EF4E0CBB', 34577, '2023-08-05', 'pending'),
('3958dc9e-742f-4377-85e9-fec4b6a6442a', 54246, '2023-07-16', 'pending'),
('d6e15727-9fe1-4961-8c5b-ea44a9bd81aa', 666, '2023-06-27', 'pending'),
('76d65c26-f784-44a2-ac19-586678f7c2f2', 32545, '2023-06-09', 'paid'),
('CC27C14A-0ACF-4F4A-A6C9-D45682C144B9', 1250, '2023-06-17', 'paid'),
('13D07535-C59E-4157-A011-F8D2EF4E0CBB', 8546, '2023-06-07', 'paid'),
('3958dc9e-712f-4377-85e9-fec4b6a6442a', 500, '2023-08-19', 'paid'),
('13D07535-C59E-4157-A011-F8D2EF4E0CBB', 8945, '2023-06-03', 'paid'),
('3958dc9e-742f-4377-85e9-fec4b6a6442a', 1000, '2022-06-05', 'paid')
ON CONFLICT DO NOTHING;

-- Insert placeholder data for revenue
INSERT INTO revenue (month, revenue) VALUES
('Jan', 2000),
('Feb', 1800),
('Mar', 2200),
('Apr', 2500),
('May', 2300),
('Jun', 3200),
('Jul', 3500),
('Aug', 3700),
('Sep', 2500),
('Oct', 2800),
('Nov', 3000),
('Dec', 4800)
ON CONFLICT (month) DO NOTHING;

-- Grant necessary permissions
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO postgres;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO postgres;
