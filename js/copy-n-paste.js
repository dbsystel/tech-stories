document.addEventListener('DOMContentLoaded', function() {
    // Get all divs with the 'copy' class
    const copyDivs = document.querySelectorAll('div.listingblock');

    copyDivs.forEach(listingblock => {
        // Create a button
        const btn = document.createElement('copybutton');
        btn.innerText = '';

        // Add click event to the button
        btn.addEventListener('click', async function() {
            try {
                await copyCodeToClipboard(listingblock);
                alert('Code copied to clipboard!');
            } catch (err) {
                console.error('Failed to copy Code: ', err);
            }
        });

        // Append the button to the div
        listingblock.appendChild(btn);
    });
});

async function copyCodeToClipboard(listingblock) {
    const codeHtml = listingblock.querySelector('div.content').innerText;
    const blob = new Blob([codeHtml], { type: 'text/plain' });
    const data = [new ClipboardItem({ 'text/plain': blob })];
    await navigator.clipboard.write(data);
}

document.addEventListener('DOMContentLoaded', function() {
    // Get all divs with the 'copy' class
    const copyDivs = document.querySelectorAll('table.copy');

    copyDivs.forEach(table => {
        // Create a button
        const btn = document.createElement('copybutton');
        btn.innerText = '';

        // Add click event to the button
        btn.addEventListener('click', async function() {
            try {
                await copyTableToClipboard(table);
                alert('Table copied to clipboard!');
            } catch (err) {
                console.error('Failed to copy table: ', err);
            }
        });

        // Append the button to the div
        table.appendChild(btn);
    });
});

async function copyTableToClipboard(table) {
    const tableHtml = table.outerHTML;
    const blob = new Blob([tableHtml], { type: 'text/html' });
    const data = [new ClipboardItem({ 'text/html': blob })];
    await navigator.clipboard.write(data);
}