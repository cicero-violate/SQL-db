function modify_user_data()
    println("Enter your choice:\n1. Insert new user\n2. Update existing user")
    choice = readline()

    if choice == "1"
        println("Enter name:")
        name = readline()
        println("Enter age:")
        age = tryparse(Int, readline())  # Attempts to parse, returns nothing if fails

        if isnothing(age)
            println("Invalid age entered. Please enter a numeric value.")
            return
        end

        # Insert data into the database
        SQLite.execute(db, "INSERT INTO users (name, age) VALUES (?, ?);", name, age)
        println("User added successfully!")
    elseif choice == "2"
        println("Enter user ID:")
        user_id = tryparse(Int, readline())
        if isnothing(user_id)
            println("Invalid user ID entered. Please enter a numeric value.")
            return
        end

        println("Enter new age:")
        new_age = tryparse(Int, readline())
        if isnothing(new_age)
            println("Invalid age entered. Please enter a numeric value.")
            return
        end

        # Update data in the database
        SQLite.execute(db, "UPDATE users SET age = ? WHERE id = ?;", new_age, user_id)
        println("User updated successfully!")
    else
        println("Invalid choice!")
    end
end
