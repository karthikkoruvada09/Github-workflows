const fs = require('fs');

// Check if the required command line arguments are provided
if (process.argv.length !== 4) {
    console.error('Usage: node script.js filepath vus-required');
    process.exit(1); // Exit the script with an error code
}

const filePath = process.argv[2];
const vus = process.argv[3];

if (vus <= 0) {
    console.error("Vu's can't be 0. Please give a proper vu's required")
    process.exit(1);
}


function updatePropertyValuesVus() {
    // Read the file content
    const data = fs.readFileSync(filePath, 'utf8');
    let numberOfTasksToCreate = Math.ceil(Number(vus) / 5000)

    // Split the file content into lines
    const lines = data.split('\n');

    // Update the desired property values
    lines.forEach((line, index) => {
        const trimmedLine = line.trim();
        if (trimmedLine.startsWith('service_desired_task_count')) {
            lines[index] = `  service_desired_task_count = "${numberOfTasksToCreate}"`;
        } else if (trimmedLine.startsWith('max_tasks')) {
            lines[index] = `  max_tasks                  = "${numberOfTasksToCreate}"`;
        }
    });

    // Join the lines back into a single string
    const updatedContent = lines.join('\n');

    // Write the updated content back to the file
    fs.writeFileSync('./terraform2.tfvars', updatedContent, 'utf8');
}

updatePropertyValuesVus();


// Get the values from command line arguments
/* 
const filePath = process.argv[2];
const desiredTaskValue = process.argv[3];
const maxTaskValue = process.argv[4];

// Function to update property values in the file
function updatePropertyValues() {
    // Read the file content
    const data = fs.readFileSync(filePath, 'utf8');

    // Split the file content into lines
    const lines = data.split('\n');

    // Update the desired property values
    lines.forEach((line, index) => {
        const trimmedLine = line.trim();
        if (trimmedLine.startsWith('service_desired_task_count')) {
            lines[index] = `  service_desired_task_count = "${desiredTaskValue}"`;
        } else if (trimmedLine.startsWith('max_tasks')) {
            lines[index] = `  max_tasks                  = "${maxTaskValue}"`;
        }
    });

    // Join the lines back into a single string
    const updatedContent = lines.join('\n');

    // Write the updated content back to the file
    fs.writeFileSync(filePath, updatedContent, 'utf8');
}

 */
