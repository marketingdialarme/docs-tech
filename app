<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dialarme - Application</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: #ffffff;
            min-height: 100vh;
            color: #000000;
        }

        /* Header */
        .header {
            background: #000000;
            padding: 30px;
            text-align: center;
            border-bottom: 4px solid #f4e600;
        }

        .logo {
            font-size: 42px;
            font-weight: 900;
            letter-spacing: -2px;
            color: #f4e600;
            margin-bottom: 8px;
        }

        .subtitle {
            color: #ffffff;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        /* Container */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        /* Section title */
        .section-title {
            font-size: 22px;
            font-weight: 700;
            color: #000000;
            margin-bottom: 25px;
            padding-left: 15px;
            position: relative;
        }

        .section-title::before {
            content: '';
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            width: 4px;
            height: 28px;
            background: #f4e600;
            border-radius: 2px;
        }

        /* Grid */
        .documents-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 20px;
            margin-bottom: 40px;
        }

        /* Card */
        .card {
            background: #ffffff;
            border: 2px solid #e0e0e0;
            border-radius: 12px;
            padding: 25px;
            cursor: pointer;
            transition: all 0.2s ease;
            position: relative;
        }

        .card:hover {
            border-color: #f4e600;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            transform: translateY(-2px);
        }

        .card-icon {
            width: 60px;
            height: 60px;
            background: #f4e600;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 15px;
            font-size: 28px;
        }

        .card-title {
            font-size: 18px;
            font-weight: 600;
            color: #000000;
            margin-bottom: 5px;
        }

        .card-type {
            font-size: 13px;
            color: #666666;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        /* Folder special */
        .folder {
            background: #fafafa;
            border: 2px solid #f4e600;
        }

        .folder .card-icon {
            background: #000000;
        }

        /* Hidden section */
        .hidden {
            display: none;
        }

        /* Back button */
        .back-btn {
            background: #000000;
            color: #f4e600;
            border: none;
            padding: 12px 25px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 15px;
            cursor: pointer;
            margin-bottom: 25px;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: all 0.2s ease;
        }

        .back-btn:hover {
            background: #1a1a1a;
            transform: translateX(-3px);
        }

        /* Form Section */
        .form-container {
            background: #ffffff;
            border: 2px solid #e0e0e0;
            border-radius: 12px;
            padding: 30px;
            max-width: 1000px;
            margin: 0 auto;
            max-height: 80vh;
            overflow-y: auto;
        }

        .form-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 2px solid #f4e600;
        }

        .form-title {
            font-size: 24px;
            font-weight: 700;
            color: #000000;
        }

        .form-close {
            background: #ff3333;
            color: white;
            border: none;
            width: 32px;
            height: 32px;
            border-radius: 50%;
            cursor: pointer;
            font-size: 18px;
            transition: all 0.2s ease;
        }

        .form-close:hover {
            background: #cc0000;
            transform: rotate(90deg);
        }

        /* Form sections */
        .form-section {
            margin-bottom: 30px;
            padding: 20px;
            background: #f9f9f9;
            border-radius: 8px;
        }

        .form-section-title {
            font-size: 18px;
            font-weight: 600;
            color: #000;
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 2px solid #f4e600;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            color: #333333;
            margin-bottom: 8px;
        }

        .form-input {
            width: 100%;
            padding: 10px 12px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 15px;
            transition: all 0.2s ease;
        }

        .form-input:focus {
            outline: none;
            border-color: #f4e600;
            box-shadow: 0 0 0 3px rgba(244, 230, 0, 0.1);
        }

        .form-textarea {
            width: 100%;
            padding: 10px 12px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 15px;
            min-height: 100px;
            resize: vertical;
            transition: all 0.2s ease;
        }

        .form-textarea:focus {
            outline: none;
            border-color: #f4e600;
            box-shadow: 0 0 0 3px rgba(244, 230, 0, 0.1);
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .form-row-3 {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            gap: 20px;
        }

        /* Checkbox groups */
        .checkbox-group {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 12px;
            margin-top: 10px;
        }

        .checkbox-item {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .checkbox-item input[type="checkbox"] {
            width: 18px;
            height: 18px;
            cursor: pointer;
        }

        .checkbox-item label {
            font-size: 14px;
            cursor: pointer;
        }

        /* Input with checkbox */
        .input-with-checkbox {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .input-with-checkbox input[type="number"] {
            width: 80px;
        }

        .quantity-group {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
            gap: 15px;
            margin-top: 10px;
        }

        .quantity-item {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .quantity-item label {
            font-size: 14px;
            min-width: 60px;
        }

        .quantity-item input[type="number"] {
            width: 80px;
            padding: 5px 8px;
            border: 1px solid #e0e0e0;
            border-radius: 4px;
        }

        /* Dynamic table */
        .dynamic-table {
            width: 100%;
            margin-top: 15px;
            overflow-x: auto;
        }

        .dynamic-table table {
            width: 100%;
            border-collapse: collapse;
        }

        .dynamic-table th {
            background: #f4e600;
            color: #000;
            padding: 10px;
            text-align: left;
            font-size: 14px;
            font-weight: 600;
        }

        .dynamic-table td {
            padding: 10px;
            border-bottom: 1px solid #e0e0e0;
        }

        .dynamic-table input {
            width: 100%;
            padding: 5px;
            border: 1px solid #e0e0e0;
            border-radius: 4px;
        }

        .dynamic-table select {
            width: 100%;
            padding: 5px;
            border: 1px solid #e0e0e0;
            border-radius: 4px;
        }

        /* Buttons */
        .btn {
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .btn-primary {
            background: #f4e600;
            color: #000000;
        }

        .btn-primary:hover {
            background: #e6d800;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(244, 230, 0, 0.3);
        }

        .btn-secondary {
            background: #666666;
            color: #ffffff;
        }

        .btn-secondary:hover {
            background: #555555;
        }

        .btn-add {
            background: #4CAF50;
            color: white;
            padding: 8px 16px;
            font-size: 14px;
            margin-top: 10px;
        }

        .btn-add:hover {
            background: #45a049;
        }

        .btn-remove {
            background: #ff4444;
            color: white;
            padding: 5px 10px;
            font-size: 12px;
        }

        .btn-remove:hover {
            background: #cc0000;
        }

        .form-actions {
            display: flex;
            gap: 15px;
            justify-content: flex-end;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #e0e0e0;
        }

        /* Radio groups */
        .radio-group {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-top: 10px;
        }

        .radio-item {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .radio-item input[type="radio"] {
            width: 18px;
            height: 18px;
            cursor: pointer;
        }

        /* Totals section */
        .totals-section {
            background: #f0f0f0;
            padding: 15px;
            border-radius: 8px;
            margin-top: 20px;
        }

        .total-row {
            display: flex;
            justify-content: space-between;
            padding: 8px 0;
            font-size: 15px;
        }

        .total-row.grand-total {
            font-weight: bold;
            font-size: 18px;
            border-top: 2px solid #333;
            padding-top: 15px;
            margin-top: 10px;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .documents-grid {
                grid-template-columns: 1fr;
            }
            
            .form-row, .form-row-3 {
                grid-template-columns: 1fr;
            }

            .checkbox-group {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <div class="logo">DIALARME</div>
        <div class="subtitle">Documents techniques</div>
    </div>

    <div class="container">
        <!-- Main Documents Section -->
        <div id="mainSection">
            <div class="documents-grid">
                <div class="card" onclick="openForm('Installation')">
                    <div class="card-icon">⚡</div>
                    <div class="card-title">Installation</div>
                    <div class="card-type">Formulaire Technique</div>
                </div>

                <div class="card" onclick="openForm('SAV avec modifications')">
                    <div class="card-icon">🔧</div>
                    <div class="card-title">SAV avec modifications</div>
                    <div class="card-type">Service Technique</div>
                </div>

                <div class="card" onclick="openForm('SAV démontage')">
                    <div class="card-icon">🔄</div>
                    <div class="card-title">SAV démontage</div>
                    <div class="card-type">Désinstallation</div>
                </div>

                <div class="card" onclick="openForm('SAV simple')">
                    <div class="card-icon">📋</div>
                    <div class="card-title">SAV simple</div>
                    <div class="card-type">Intervention Rapide</div>
                </div>

                <div class="card folder" onclick="showFolder()">
                    <div class="card-icon">📁</div>
                    <div class="card-title">Fiches Individuelles</div>
                    <div class="card-type">Dossier Documents</div>
                </div>
            </div>
        </div>

        <!-- Individual Files Section (Hidden) -->
        <div id="folderSection" class="hidden">
            <button class="back-btn" onclick="showMain()">
                ← Retour aux Documents
            </button>
            <div class="section-title">Fiches Individuelles</div>
            <div class="documents-grid">
                <div class="card" onclick="openForm('Facturier')">
                    <div class="card-icon">📊</div>
                    <div class="card-title">Facturier</div>
                    <div class="card-type">Gestion Factures</div>
                </div>

                <div class="card" onclick="openForm('Quittance clé')">
                    <div class="card-icon">🔑</div>
                    <div class="card-title">Quittance clé</div>
                    <div class="card-type">Réception</div>
                </div>
            </div>
        </div>

        <!-- Form Section (Hidden) -->
        <div id="formSection" class="hidden">
            <button class="back-btn" onclick="closeForm()">
                ← Retour
            </button>
            <div class="form-container">
                <div class="form-header">
                    <h2 class="form-title" id="formTitle">Installation</h2>
                    <button class="form-close" onclick="closeForm()">×</button>
                </div>
                
                <form id="documentForm">
                    <!-- Installation Form -->
                    <div id="installationForm" style="display: none;">
                        <!-- Section 1: Informations générales -->
                        <div class="form-section">
                            <div class="form-section-title">Informations générales</div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Technicien</label>
                                    <select class="form-input" name="technicien" required>
                                        <option value="">Sélectionner un technicien...</option>
                                        <option value="Alexis DEVILLE">Alexis DEVILLE</option>
                                        <option value="Corentin LE JONCOUR">Corentin LE JONCOUR</option>
                                        <option value="Faith ERSOY">Faith ERSOY</option>
                                        <option value="Guillaume BEX">Guillaume BEX</option>
                                        <option value="Ismail ECH CHATOUI">Ismail ECH CHATOUI</option>
                                        <option value="Jamal EL HALFI">Jamal EL HALFI</option>
                                        <option value="Mathieu CLAVEL">Mathieu CLAVEL</option>
                                        <option value="Sedat MADEN">Sedat MADEN</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">N° de client</label>
                                    <input type="text" class="form-input" name="num_client">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Date d'intervention</label>
                                    <input type="date" class="form-input" name="date_intervention" id="date_intervention_install">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Type d'installation</label>
                                    <input type="text" class="form-input" name="type_installation">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Heure de début</label>
                                    <input type="time" class="form-input" name="heure_debut">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Heure de fin</label>
                                    <input type="time" class="form-input" name="heure_fin">
                                </div>
                            </div>
                        </div>

                        <!-- Section 2: Informations client -->
                        <div class="form-section">
                            <div class="form-section-title">Informations client</div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Nom</label>
                                    <input type="text" class="form-input" name="nom_client">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Prénom</label>
                                    <input type="text" class="form-input" name="prenom_client">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Adresse</label>
                                <input type="text" class="form-input" name="adresse">
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Localité</label>
                                    <input type="text" class="form-input" name="localite">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Téléphone</label>
                                    <input type="tel" class="form-input" name="telephone">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Téléphone du site (FIXE uniquement)</label>
                                    <input type="tel" class="form-input" name="telephone_fixe">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Adresse mail</label>
                                    <input type="email" class="form-input" name="email">
                                </div>
                            </div>
                        </div>

                        <!-- Section 3: Opérations effectuées -->
                        <div class="form-section">
                            <div class="form-section-title">Opérations effectuées</div>
                            <div class="checkbox-group">
                                <div class="checkbox-item">
                                    <input type="checkbox" id="op_installation" name="op_installation" checked>
                                    <label for="op_installation">Installation</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="op_demontage" name="op_demontage">
                                    <label for="op_demontage">Démontage</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="op_remontage" name="op_remontage">
                                    <label for="op_remontage">Remontage</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="op_demenagement" name="op_demenagement">
                                    <label for="op_demenagement">Déménagement</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="op_reception_cle" name="op_reception_cle">
                                    <label for="op_reception_cle">Réception clé</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="op_rajout" name="op_rajout">
                                    <label for="op_rajout">Rajout matériel</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="op_deplacement" name="op_deplacement">
                                    <label for="op_deplacement">Déplacement matériel</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="op_probleme" name="op_probleme">
                                    <label for="op_probleme">Problème matériel</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="op_remplacement" name="op_remplacement">
                                    <label for="op_remplacement">Remplacement matériel</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="op_autres" name="op_autres" onchange="toggleAutresField()">
                                    <label for="op_autres">Autres</label>
                                </div>
                            </div>
                            <div id="autres_field" style="display: none; margin-top: 10px;">
                                <input type="text" class="form-input" name="op_autres_text" placeholder="Précisez...">
                            </div>
                        </div>

                        <!-- Section 4: Informations techniques -->
                        <div class="form-section">
                            <div class="form-section-title">Informations techniques</div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">N° série de la centrale</label>
                                    <input type="text" class="form-input" name="num_serie_centrale">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">N° téléphone SIM</label>
                                    <input type="text" class="form-input" name="num_telephone_sim">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Type de centrale</label>
                                    <select class="form-input" name="type_centrale">
                                        <option value="">Sélectionner...</option>
                                        <option value="titane">Centrale Titane</option>
                                        <option value="ax_pro">Centrale AX Pro</option>
                                        <option value="jablotron">Centrale Jablotron</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Mot de passe</label>
                                    <input type="text" class="form-input" name="mot_de_passe">
                                </div>
                            </div>
                            <div class="form-row-3">
                                <div class="form-group">
                                    <label class="form-label">Nombre de radars</label>
                                    <input type="number" class="form-input" name="nombre_radars" min="0">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Nombre de contacts</label>
                                    <input type="number" class="form-input" name="nombre_contacts" min="0">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Nombre de télécommandes</label>
                                    <input type="number" class="form-input" name="nombre_telecommandes" min="0">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Nombre de claviers</label>
                                    <input type="number" class="form-input" name="nombre_claviers" min="0">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Autres équipements</label>
                                    <input type="text" class="form-input" name="autres_equipements">
                                </div>
                            </div>
                        </div>

                        <!-- Section 5: Remplacement de piles -->
                        <div class="form-section">
                            <div class="form-section-title">Remplacement de piles</div>
                            <div class="quantity-group">
                                <div class="quantity-item">
                                    <label for="pile_centrale_qty">Centrale</label>
                                    <input type="number" id="pile_centrale_qty" name="pile_centrale_qty" min="0" value="0">
                                </div>
                                <div class="quantity-item">
                                    <label for="pile_clavier_qty">Clavier</label>
                                    <input type="number" id="pile_clavier_qty" name="pile_clavier_qty" min="0" value="0">
                                </div>
                                <div class="quantity-item">
                                    <label for="pile_dv_qty">DV</label>
                                    <input type="number" id="pile_dv_qty" name="pile_dv_qty" min="0" value="0">
                                </div>
                                <div class="quantity-item">
                                    <label for="pile_dvc_qty">DVC</label>
                                    <input type="number" id="pile_dvc_qty" name="pile_dvc_qty" min="0" value="0">
                                </div>
                                <div class="quantity-item">
                                    <label for="pile_do_qty">DO</label>
                                    <input type="number" id="pile_do_qty" name="pile_do_qty" min="0" value="0">
                                </div>
                                <div class="quantity-item">
                                    <label for="pile_df_qty">DF</label>
                                    <input type="number" id="pile_df_qty" name="pile_df_qty" min="0" value="0">
                                </div>
                                <div class="quantity-item">
                                    <label for="pile_tcde_qty">TCDE</label>
                                    <input type="number" id="pile_tcde_qty" name="pile_tcde_qty" min="0" value="0">
                                </div>
                            </div>
                        </div>

                        <!-- Section 6: Contrôle d'installation -->
                        <div class="form-section">
                            <div class="form-section-title">Contrôle d'installation</div>
                            <div class="checkbox-group">
                                <div class="checkbox-item">
                                    <input type="checkbox" id="ctrl_zone" name="ctrl_zone">
                                    <label for="ctrl_zone">Zone</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="ctrl_quantite" name="ctrl_quantite">
                                    <label for="ctrl_quantite">Quantité matériel</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="ctrl_parametre" name="ctrl_parametre">
                                    <label for="ctrl_parametre">Paramètre TMT & APN</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="ctrl_detection" name="ctrl_detection">
                                    <label for="ctrl_detection">Test de détection</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="ctrl_transmission" name="ctrl_transmission">
                                    <label for="ctrl_transmission">Test de transmission</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="ctrl_protege" name="ctrl_protege">
                                    <label for="ctrl_protege">Système protégé par détecteur</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="ctrl_secteur" name="ctrl_secteur">
                                    <label for="ctrl_secteur">Système sur secteur</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="ctrl_instructions" name="ctrl_instructions">
                                    <label for="ctrl_instructions">Instructions</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="ctrl_telephone" name="ctrl_telephone">
                                    <label for="ctrl_telephone">Téléphone</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="ctrl_internet" name="ctrl_internet">
                                    <label for="ctrl_internet">Internet du client</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="ctrl_divers" name="ctrl_divers">
                                    <label for="ctrl_divers">Divers</label>
                                </div>
                            </div>
                        </div>

                        <!-- Section 7: Matériel installé -->
                        <div class="form-section">
                            <div class="form-section-title">Matériel installé</div>
                            <div class="dynamic-table">
                                <table id="materielTable">
                                    <thead>
                                        <tr>
                                            <th>Matériel</th>
                                            <th>Quantité</th>
                                            <th>Localisation</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="materielBody">
                                        <tr>
                                            <td><input type="text" name="materiel_nom[]"></td>
                                            <td><input type="number" name="materiel_qty[]" min="1"></td>
                                            <td><input type="text" name="materiel_loc[]"></td>
                                            <td><button type="button" class="btn btn-remove" onclick="removeRow(this)">Supprimer</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <button type="button" class="btn btn-add" onclick="addMaterielRow()">+ Ajouter une ligne</button>
                            </div>
                        </div>

                        <!-- Section 8: Descriptif des zones -->
                        <div class="form-section">
                            <div class="form-section-title">Descriptif des zones</div>
                            <div class="form-row-3">
                                <div class="form-group">
                                    <label class="form-label">Nombre de niveaux</label>
                                    <input type="number" class="form-input" name="nombre_niveaux" min="0">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Carte SIM</label>
                                    <input type="text" class="form-input" name="carte_sim">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Code immeuble</label>
                                    <input type="text" class="form-input" name="code_immeuble">
                                </div>
                            </div>
                            <div class="checkbox-group">
                                <div class="checkbox-item">
                                    <input type="checkbox" id="type_villa" name="type_villa">
                                    <label for="type_villa">Villa</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="type_appartement" name="type_appartement">
                                    <label for="type_appartement">Appartement</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="type_arcade" name="type_arcade">
                                    <label for="type_arcade">Arcade</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="type_entreprise" name="type_entreprise">
                                    <label for="type_entreprise">Entreprise</label>
                                </div>
                            </div>
                            <div class="dynamic-table" style="margin-top: 20px;">
                                <table id="zonesTable">
                                    <thead>
                                        <tr>
                                            <th>Canal</th>
                                            <th>Tempo entrée</th>
                                            <th>Tempo sortie</th>
                                            <th>Étage</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="zonesBody">
                                        <tr>
                                            <td>Canal 1</td>
                                            <td><input type="text" name="zone_tempo_entree[]"></td>
                                            <td><input type="text" name="zone_tempo_sortie[]"></td>
                                            <td><input type="text" name="zone_etage[]"></td>
                                            <td><button type="button" class="btn btn-remove" onclick="removeRow(this)">Supprimer</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <button type="button" class="btn btn-add" onclick="addZoneRow()">+ Ajouter un canal</button>
                            </div>
                        </div>

                        <!-- Section 9: Observations -->
                        <div class="form-section">
                            <div class="form-section-title">Observations</div>
                            <div class="form-group">
                                <label class="form-label">Explication intervention</label>
                                <textarea class="form-textarea" name="explication_intervention"></textarea>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Observations technicien</label>
                                <textarea class="form-textarea" name="observations_technicien"></textarea>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Observations client</label>
                                <textarea class="form-textarea" name="observations_client"></textarea>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Observation responsable</label>
                                <textarea class="form-textarea" name="observation_responsable"></textarea>
                            </div>
                        </div>

                        <!-- Section 10: Facturation -->
                        <div class="form-section">
                            <div class="form-section-title">Facturation</div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Total déplacement HT</label>
                                    <input type="number" class="form-input" name="total_deplacement" step="0.01" min="0">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Total main d'œuvre HT</label>
                                    <input type="number" class="form-input" name="total_main_oeuvre" step="0.01" min="0">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Total matériel HT</label>
                                    <input type="number" class="form-input" name="total_materiel" step="0.01" min="0">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Total montant HT</label>
                                    <input type="number" class="form-input" name="total_montant" step="0.01" min="0">
                                </div>
                            </div>
                            <div class="checkbox-group">
                                <div class="checkbox-item">
                                    <input type="checkbox" id="paiement_comptant" name="paiement_comptant">
                                    <label for="paiement_comptant">Paiement comptant</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="paiement_carte" name="paiement_carte">
                                    <label for="paiement_carte">Carte bancaire</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="paiement_bulletin" name="paiement_bulletin">
                                    <label for="paiement_bulletin">Bulletin de versement</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="paiement_autres" name="paiement_autres">
                                    <label for="paiement_autres">Autres</label>
                                </div>
                            </div>
                        </div>

                        <!-- Section 11: Remise des clés -->
                        <div class="form-section">
                            <div class="form-section-title">Remise des clés au technicien</div>
                            <div class="radio-group">
                                <div class="radio-item">
                                    <input type="radio" id="cle_oui" name="remise_cles" value="oui">
                                    <label for="cle_oui">Oui, les clés sont remises au technicien ce jour</label>
                                </div>
                                <div class="radio-item">
                                    <input type="radio" id="cle_transmettre" name="remise_cles" value="transmettre">
                                    <label for="cle_transmettre">Non, le client se charge de nous les transmettre dans les plus brefs délais</label>
                                </div>
                                <div class="radio-item">
                                    <input type="radio" id="cle_refuse" name="remise_cles" value="refuse">
                                    <label for="cle_refuse">Non, le client ne souhaite pas remettre ses clés</label>
                                </div>
                            </div>
                        </div>

                        <!-- Section 12: Période d'installation -->
                        <div class="form-section">
                            <div class="form-section-title">Période d'installation</div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Date d'installation</label>
                                    <input type="date" class="form-input" name="date_installation">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Date de fin d'installation</label>
                                    <input type="date" class="form-input" name="date_fin_installation">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Date de mise en service</label>
                                    <input type="date" class="form-input" name="date_mise_service">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Nom du conseiller</label>
                                    <input type="text" class="form-input" name="nom_conseiller">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Horaire d'ouverture</label>
                                <input type="text" class="form-input" name="horaire_ouverture">
                            </div>
                        </div>

                        <!-- Section 13: Personnes de contact -->
                        <div class="form-section">
                            <div class="form-section-title">Personnes de contact</div>
                            <div class="dynamic-table">
                                <table id="contactsTable">
                                    <thead>
                                        <tr>
                                            <th>Nom et Prénom</th>
                                            <th>Adresse</th>
                                            <th>Fixe/Natel</th>
                                            <th>Mot de passe</th>
                                            <th>Clé</th>
                                            <th>Lien</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="contactsBody">
                                        <tr>
                                            <td><input type="text" name="contact_nom[]"></td>
                                            <td><input type="text" name="contact_adresse[]"></td>
                                            <td><input type="text" name="contact_tel[]"></td>
                                            <td><input type="text" name="contact_mdp[]"></td>
                                            <td><input type="text" name="contact_cle[]"></td>
                                            <td><input type="text" name="contact_lien[]"></td>
                                            <td><button type="button" class="btn btn-remove" onclick="removeRow(this)">Supprimer</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <button type="button" class="btn btn-add" onclick="addContactRow()">+ Ajouter un contact</button>
                            </div>
                        </div>
                    </div>

                    <!-- SAV avec modifications Form -->
                    <div id="savModificationsForm" style="display: none;">
                        <!-- Section 1: Informations générales -->
                        <div class="form-section">
                            <div class="form-section-title">Informations générales</div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">N° de client</label>
                                    <input type="text" class="form-input" name="sav_mod_num_client">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Technicien</label>
                                    <select class="form-input" name="sav_mod_technicien" required>
                                        <option value="">Sélectionner un technicien...</option>
                                        <option value="Alexis DEVILLE">Alexis DEVILLE</option>
                                        <option value="Corentin LE JONCOUR">Corentin LE JONCOUR</option>
                                        <option value="Faith ERSOY">Faith ERSOY</option>
                                        <option value="Guillaume BEX">Guillaume BEX</option>
                                        <option value="Ismail ECH CHATOUI">Ismail ECH CHATOUI</option>
                                        <option value="Jamal EL HALFI">Jamal EL HALFI</option>
                                        <option value="Mathieu CLAVEL">Mathieu CLAVEL</option>
                                        <option value="Sedat MADEN">Sedat MADEN</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Date d'intervention</label>
                                    <input type="date" class="form-input" name="sav_mod_date_intervention" id="date_intervention_sav_mod">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Type d'installation</label>
                                    <input type="text" class="form-input" name="sav_mod_type_installation">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Heure de début</label>
                                    <input type="time" class="form-input" name="sav_mod_heure_debut">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Heure de fin</label>
                                    <input type="time" class="form-input" name="sav_mod_heure_fin">
                                </div>
                            </div>
                        </div>

                        <!-- Section 2: Informations client -->
                        <div class="form-section">
                            <div class="form-section-title">Informations client</div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Nom</label>
                                    <input type="text" class="form-input" name="sav_mod_nom_client">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Prénom</label>
                                    <input type="text" class="form-input" name="sav_mod_prenom_client">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Adresse</label>
                                    <input type="text" class="form-input" name="sav_mod_adresse">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Localité</label>
                                    <input type="text" class="form-input" name="sav_mod_localite">
                                </div>
                            </div>
                        </div>

                        <!-- Section 3: Opérations effectuées -->
                        <div class="form-section">
                            <div class="form-section-title">Opérations effectuées</div>
                            <div class="checkbox-group">
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_mod_op_installation" name="sav_mod_op_installation">
                                    <label for="sav_mod_op_installation">Installation</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_mod_op_demontage" name="sav_mod_op_demontage">
                                    <label for="sav_mod_op_demontage">Démontage</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_mod_op_remontage" name="sav_mod_op_remontage">
                                    <label for="sav_mod_op_remontage">Remontage</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_mod_op_demenagement" name="sav_mod_op_demenagement">
                                    <label for="sav_mod_op_demenagement">Déménagement</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_mod_op_reception_cle" name="sav_mod_op_reception_cle">
                                    <label for="sav_mod_op_reception_cle">Réception des clés</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_mod_op_rajout" name="sav_mod_op_rajout">
                                    <label for="sav_mod_op_rajout">Rajout matériel</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_mod_op_deplacement" name="sav_mod_op_deplacement">
                                    <label for="sav_mod_op_deplacement">Déplacement matériel</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_mod_op_probleme" name="sav_mod_op_probleme">
                                    <label for="sav_mod_op_probleme">Problème matériel</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_mod_op_remplacement" name="sav_mod_op_remplacement">
                                    <label for="sav_mod_op_remplacement">Remplacement matériel</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_mod_op_autres" name="sav_mod_op_autres" onchange="toggleSavModAutresField()">
                                    <label for="sav_mod_op_autres">Autres</label>
                                </div>
                            </div>
                            <div id="sav_mod_autres_field" style="display: none; margin-top: 10px;">
                                <input type="text" class="form-input" name="sav_mod_op_autres_text" placeholder="Précisez...">
                            </div>
                        </div>

                        <!-- Section 4: Remplacement de piles -->
                        <div class="form-section">
                            <div class="form-section-title">Remplacement de piles</div>
                            <div class="quantity-group">
                                <div class="quantity-item">
                                    <label for="sav_mod_pile_centrale">Centrale</label>
                                    <input type="number" id="sav_mod_pile_centrale" name="sav_mod_pile_centrale" min="0" value="0">
                                </div>
                                <div class="quantity-item">
                                    <label for="sav_mod_pile_clavier">Clavier</label>
                                    <input type="number" id="sav_mod_pile_clavier" name="sav_mod_pile_clavier" min="0" value="0">
                                </div>
                                <div class="quantity-item">
                                    <label for="sav_mod_pile_dv">DV</label>
                                    <input type="number" id="sav_mod_pile_dv" name="sav_mod_pile_dv" min="0" value="0">
                                </div>
                                <div class="quantity-item">
                                    <label for="sav_mod_pile_dvc">DVC</label>
                                    <input type="number" id="sav_mod_pile_dvc" name="sav_mod_pile_dvc" min="0" value="0">
                                </div>
                                <div class="quantity-item">
                                    <label for="sav_mod_pile_do">DO</label>
                                    <input type="number" id="sav_mod_pile_do" name="sav_mod_pile_do" min="0" value="0">
                                </div>
                                <div class="quantity-item">
                                    <label for="sav_mod_pile_df">DF</label>
                                    <input type="number" id="sav_mod_pile_df" name="sav_mod_pile_df" min="0" value="0">
                                </div>
                                <div class="quantity-item">
                                    <label for="sav_mod_pile_tcde">TCDE</label>
                                    <input type="number" id="sav_mod_pile_tcde" name="sav_mod_pile_tcde" min="0" value="0">
                                </div>
                            </div>
                        </div>

                        <!-- Section 5: Informations techniques -->
                        <div class="form-section">
                            <div class="form-section-title">Informations techniques</div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">N° série de la centrale</label>
                                    <input type="text" class="form-input" name="sav_mod_num_serie_centrale">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">N° téléphone SIM</label>
                                    <input type="text" class="form-input" name="sav_mod_num_telephone_sim">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Type de centrale</label>
                                    <select class="form-input" name="sav_mod_type_centrale">
                                        <option value="">Sélectionner...</option>
                                        <option value="titane">Centrale Titane</option>
                                        <option value="ax_pro">Centrale AX Pro</option>
                                        <option value="jablotron">Centrale Jablotron</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Mot de passe</label>
                                    <input type="text" class="form-input" name="sav_mod_mot_de_passe">
                                </div>
                            </div>
                            <div class="form-row-3">
                                <div class="form-group">
                                    <label class="form-label">Nombre de radars</label>
                                    <input type="number" class="form-input" name="sav_mod_nombre_radars" min="0">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Nombre de contacts</label>
                                    <input type="number" class="form-input" name="sav_mod_nombre_contacts" min="0">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Nombre de télécommandes</label>
                                    <input type="number" class="form-input" name="sav_mod_nombre_telecommandes" min="0">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Nombre de claviers</label>
                                    <input type="number" class="form-input" name="sav_mod_nombre_claviers" min="0">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Autres équipements</label>
                                    <input type="text" class="form-input" name="sav_mod_autres_equipements">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Horaire d'ouverture</label>
                                <input type="text" class="form-input" name="sav_mod_horaire_ouverture">
                            </div>
                        </div>

                        <!-- Section 6: Contrôle d'installation -->
                        <div class="form-section">
                            <div class="form-section-title">Contrôle d'installation</div>
                            <div class="checkbox-group">
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_mod_ctrl_zone" name="sav_mod_ctrl_zone">
                                    <label for="sav_mod_ctrl_zone">Zone</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_mod_ctrl_quantite" name="sav_mod_ctrl_quantite">
                                    <label for="sav_mod_ctrl_quantite">Quantité matériel</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_mod_ctrl_parametre" name="sav_mod_ctrl_parametre">
                                    <label for="sav_mod_ctrl_parametre">Paramètre TMT & APN</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_mod_ctrl_detection" name="sav_mod_ctrl_detection">
                                    <label for="sav_mod_ctrl_detection">Test de détection</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_mod_ctrl_transmission" name="sav_mod_ctrl_transmission">
                                    <label for="sav_mod_ctrl_transmission">Test de transmission</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_mod_ctrl_protege" name="sav_mod_ctrl_protege">
                                    <label for="sav_mod_ctrl_protege">Système protégé par détecteur</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_mod_ctrl_secteur" name="sav_mod_ctrl_secteur">
                                    <label for="sav_mod_ctrl_secteur">Système sur secteur</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_mod_ctrl_instructions" name="sav_mod_ctrl_instructions">
                                    <label for="sav_mod_ctrl_instructions">Instructions</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_mod_ctrl_telephone" name="sav_mod_ctrl_telephone">
                                    <label for="sav_mod_ctrl_telephone">Téléphone et internet du client</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_mod_ctrl_divers" name="sav_mod_ctrl_divers">
                                    <label for="sav_mod_ctrl_divers">Divers</label>
                                </div>
                            </div>
                        </div>

                        <!-- Section 7: Observations -->
                        <div class="form-section">
                            <div class="form-section-title">Observations</div>
                            <div class="form-group">
                                <label class="form-label">Observations technicien</label>
                                <textarea class="form-textarea" name="sav_mod_observations_technicien"></textarea>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Explication intervention</label>
                                <textarea class="form-textarea" name="sav_mod_explication_intervention"></textarea>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Observation client</label>
                                <textarea class="form-textarea" name="sav_mod_observations_client"></textarea>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Observation responsable</label>
                                <textarea class="form-textarea" name="sav_mod_observation_responsable"></textarea>
                            </div>
                        </div>

                        <!-- Section 8: Facturation -->
                        <div class="form-section">
                            <div class="form-section-title">Facturation</div>
                            <div class="checkbox-group">
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_mod_fact_deplacement" name="sav_mod_fact_deplacement">
                                    <label for="sav_mod_fact_deplacement">Total déplacement HT</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_mod_fact_main_oeuvre" name="sav_mod_fact_main_oeuvre">
                                    <label for="sav_mod_fact_main_oeuvre">Total main d'œuvre HT</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_mod_fact_materiel" name="sav_mod_fact_materiel">
                                    <label for="sav_mod_fact_materiel">Total matériel HT</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_mod_fact_montant" name="sav_mod_fact_montant">
                                    <label for="sav_mod_fact_montant">Total montant HT</label>
                                </div>
                            </div>
                            <div class="checkbox-group" style="margin-top: 20px;">
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_mod_paiement_comptant" name="sav_mod_paiement_comptant">
                                    <label for="sav_mod_paiement_comptant">Paiement comptant</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_mod_paiement_carte" name="sav_mod_paiement_carte">
                                    <label for="sav_mod_paiement_carte">Carte bancaire</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_mod_paiement_bulletin" name="sav_mod_paiement_bulletin">
                                    <label for="sav_mod_paiement_bulletin">Bulletin de versement</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_mod_paiement_autres" name="sav_mod_paiement_autres">
                                    <label for="sav_mod_paiement_autres">Autres</label>
                                </div>
                            </div>
                        </div>

                        <!-- Section 9: Descriptif des zones -->
                        <div class="form-section">
                            <div class="form-section-title">Descriptif des zones</div>
                            <div class="checkbox-group">
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_mod_type_villa" name="sav_mod_type_villa">
                                    <label for="sav_mod_type_villa">Villa</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_mod_type_appartement" name="sav_mod_type_appartement">
                                    <label for="sav_mod_type_appartement">Appartement</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_mod_type_arcade" name="sav_mod_type_arcade">
                                    <label for="sav_mod_type_arcade">Arcade</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_mod_type_entreprise" name="sav_mod_type_entreprise">
                                    <label for="sav_mod_type_entreprise">Entreprise</label>
                                </div>
                            </div>
                            <div class="dynamic-table" style="margin-top: 20px;">
                                <table id="savModZonesTable">
                                    <thead>
                                        <tr>
                                            <th>Canal</th>
                                            <th>Tempo entrée</th>
                                            <th>Tempo sortie</th>
                                            <th>Étage</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="savModZonesBody">
                                        <tr>
                                            <td>Canal 1</td>
                                            <td><input type="text" name="sav_mod_zone_tempo_entree[]"></td>
                                            <td><input type="text" name="sav_mod_zone_tempo_sortie[]"></td>
                                            <td><input type="text" name="sav_mod_zone_etage[]"></td>
                                            <td><button type="button" class="btn btn-remove" onclick="removeRow(this)">Supprimer</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <button type="button" class="btn btn-add" onclick="addSavModZoneRow()">+ Ajouter un canal</button>
                            </div>
                            <div class="form-row-3" style="margin-top: 20px;">
                                <div class="form-group">
                                    <label class="form-label">Nombre d'étages</label>
                                    <input type="number" class="form-input" name="sav_mod_nombre_etages" min="0">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Étages</label>
                                    <input type="text" class="form-input" name="sav_mod_etages">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Code immeuble</label>
                                    <input type="text" class="form-input" name="sav_mod_code_immeuble">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Équipement supplémentaire (ex: grande échelle)</label>
                                <input type="text" class="form-input" name="sav_mod_equipement_supplementaire" placeholder="grande échelle">
                            </div>
                        </div>

                        <!-- Section 10: Personnes de contact -->
                        <div class="form-section">
                            <div class="form-section-title">Personnes de contact</div>
                            <div class="dynamic-table">
                                <table id="savModContactsTable">
                                    <thead>
                                        <tr>
                                            <th>Nom et Prénom</th>
                                            <th>Adresse</th>
                                            <th>Clé</th>
                                            <th>Lien</th>
                                            <th>Fixe/Natel</th>
                                            <th>Mot de passe</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="savModContactsBody">
                                        <tr>
                                            <td><input type="text" name="sav_mod_contact_nom[]"></td>
                                            <td><input type="text" name="sav_mod_contact_adresse[]"></td>
                                            <td><input type="text" name="sav_mod_contact_cle[]"></td>
                                            <td><input type="text" name="sav_mod_contact_lien[]"></td>
                                            <td><input type="text" name="sav_mod_contact_tel[]"></td>
                                            <td><input type="text" name="sav_mod_contact_mdp[]"></td>
                                            <td><button type="button" class="btn btn-remove" onclick="removeRow(this)">Supprimer</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <button type="button" class="btn btn-add" onclick="addSavModContactRow()">+ Ajouter un contact</button>
                            </div>
                        </div>
                    </div>

                    <!-- SAV démontage Form -->
                    <div id="savDemontageForm" style="display: none;">
                        <!-- Section 1: Informations générales -->
                        <div class="form-section">
                            <div class="form-section-title">Informations générales</div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">N° de client</label>
                                    <input type="text" class="form-input" name="sav_dem_num_client">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">N° du contrat</label>
                                    <input type="text" class="form-input" name="sav_dem_num_contrat">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Nom</label>
                                    <input type="text" class="form-input" name="sav_dem_nom_client">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Prénom</label>
                                    <input type="text" class="form-input" name="sav_dem_prenom_client">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Adresse</label>
                                    <input type="text" class="form-input" name="sav_dem_adresse">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Localité</label>
                                    <input type="text" class="form-input" name="sav_dem_localite">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Date d'intervention</label>
                                    <input type="date" class="form-input" name="sav_dem_date_intervention" id="date_intervention_sav_dem">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Type d'installation</label>
                                    <input type="text" class="form-input" name="sav_dem_type_installation">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Heure de début</label>
                                    <input type="time" class="form-input" name="sav_dem_heure_debut">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Heure de fin</label>
                                    <input type="time" class="form-input" name="sav_dem_heure_fin">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Technicien</label>
                                <select class="form-input" name="sav_dem_technicien" required>
                                    <option value="">Sélectionner un technicien...</option>
                                    <option value="Alexis DEVILLE">Alexis DEVILLE</option>
                                    <option value="Corentin LE JONCOUR">Corentin LE JONCOUR</option>
                                    <option value="Faith ERSOY">Faith ERSOY</option>
                                    <option value="Guillaume BEX">Guillaume BEX</option>
                                    <option value="Ismail ECH CHATOUI">Ismail ECH CHATOUI</option>
                                    <option value="Jamal EL HALFI">Jamal EL HALFI</option>
                                    <option value="Mathieu CLAVEL">Mathieu CLAVEL</option>
                                    <option value="Sedat MADEN">Sedat MADEN</option>
                                </select>
                            </div>
                        </div>

                        <!-- Section 2: Opérations effectuées -->
                        <div class="form-section">
                            <div class="form-section-title">Opérations effectuées</div>
                            <div class="checkbox-group">
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_dem_op_installation" name="sav_dem_op_installation">
                                    <label for="sav_dem_op_installation">Installation</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_dem_op_demontage" name="sav_dem_op_demontage" checked>
                                    <label for="sav_dem_op_demontage">Démontage</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_dem_op_remontage" name="sav_dem_op_remontage">
                                    <label for="sav_dem_op_remontage">Remontage</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_dem_op_demenagement" name="sav_dem_op_demenagement">
                                    <label for="sav_dem_op_demenagement">Déménagement</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_dem_op_reception_cle" name="sav_dem_op_reception_cle">
                                    <label for="sav_dem_op_reception_cle">Réception des clés</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_dem_op_rajout" name="sav_dem_op_rajout">
                                    <label for="sav_dem_op_rajout">Rajout matériel</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_dem_op_deplacement" name="sav_dem_op_deplacement">
                                    <label for="sav_dem_op_deplacement">Déplacement matériel</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_dem_op_probleme" name="sav_dem_op_probleme">
                                    <label for="sav_dem_op_probleme">Problème matériel</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_dem_op_remplacement" name="sav_dem_op_remplacement">
                                    <label for="sav_dem_op_remplacement">Remplacement matériel</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_dem_op_autres" name="sav_dem_op_autres" onchange="toggleSavDemAutresField()">
                                    <label for="sav_dem_op_autres">Autres</label>
                                </div>
                            </div>
                            <div id="sav_dem_autres_field" style="display: none; margin-top: 10px;">
                                <input type="text" class="form-input" name="sav_dem_op_autres_text" placeholder="Précisez...">
                            </div>
                        </div>

                        <!-- Section 3: Remplacement de piles -->
                        <div class="form-section">
                            <div class="form-section-title">Remplacement de piles</div>
                            <div class="quantity-group">
                                <div class="quantity-item">
                                    <label for="sav_dem_pile_centrale">Centrale</label>
                                    <input type="number" id="sav_dem_pile_centrale" name="sav_dem_pile_centrale" min="0" value="0">
                                </div>
                                <div class="quantity-item">
                                    <label for="sav_dem_pile_clavier">Clavier</label>
                                    <input type="number" id="sav_dem_pile_clavier" name="sav_dem_pile_clavier" min="0" value="0">
                                </div>
                                <div class="quantity-item">
                                    <label for="sav_dem_pile_dv">DV</label>
                                    <input type="number" id="sav_dem_pile_dv" name="sav_dem_pile_dv" min="0" value="0">
                                </div>
                                <div class="quantity-item">
                                    <label for="sav_dem_pile_dvc">DVC</label>
                                    <input type="number" id="sav_dem_pile_dvc" name="sav_dem_pile_dvc" min="0" value="0">
                                </div>
                                <div class="quantity-item">
                                    <label for="sav_dem_pile_do">DO</label>
                                    <input type="number" id="sav_dem_pile_do" name="sav_dem_pile_do" min="0" value="0">
                                </div>
                                <div class="quantity-item">
                                    <label for="sav_dem_pile_df">DF</label>
                                    <input type="number" id="sav_dem_pile_df" name="sav_dem_pile_df" min="0" value="0">
                                </div>
                                <div class="quantity-item">
                                    <label for="sav_dem_pile_tcde">TCDE</label>
                                    <input type="number" id="sav_dem_pile_tcde" name="sav_dem_pile_tcde" min="0" value="0">
                                </div>
                            </div>
                        </div>

                        <!-- Section 4: Informations système -->
                        <div class="form-section">
                            <div class="form-section-title">Informations système</div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">N° série de la centrale</label>
                                    <input type="text" class="form-input" name="sav_dem_num_serie_centrale">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">N° téléphone SIM</label>
                                    <input type="text" class="form-input" name="sav_dem_num_telephone_sim">
                                </div>
                            </div>
                        </div>

                        <!-- Section 5: Contrôle d'installation -->
                        <div class="form-section">
                            <div class="form-section-title">Contrôle d'installation</div>
                            <div class="checkbox-group">
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_dem_ctrl_zone" name="sav_dem_ctrl_zone">
                                    <label for="sav_dem_ctrl_zone">Zone</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_dem_ctrl_quantite" name="sav_dem_ctrl_quantite">
                                    <label for="sav_dem_ctrl_quantite">Quantité matériel</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_dem_ctrl_parametre" name="sav_dem_ctrl_parametre">
                                    <label for="sav_dem_ctrl_parametre">Paramètre TMT & APN</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_dem_ctrl_detection" name="sav_dem_ctrl_detection">
                                    <label for="sav_dem_ctrl_detection">Test de détection</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_dem_ctrl_transmission" name="sav_dem_ctrl_transmission">
                                    <label for="sav_dem_ctrl_transmission">Test de transmission</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_dem_ctrl_protege" name="sav_dem_ctrl_protege">
                                    <label for="sav_dem_ctrl_protege">Système protégé par détecteur</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_dem_ctrl_secteur" name="sav_dem_ctrl_secteur">
                                    <label for="sav_dem_ctrl_secteur">Système sur secteur</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_dem_ctrl_instructions" name="sav_dem_ctrl_instructions">
                                    <label for="sav_dem_ctrl_instructions">Instructions</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_dem_ctrl_telephone" name="sav_dem_ctrl_telephone">
                                    <label for="sav_dem_ctrl_telephone">Téléphone et internet du client</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_dem_ctrl_divers" name="sav_dem_ctrl_divers">
                                    <label for="sav_dem_ctrl_divers">Divers</label>
                                </div>
                            </div>
                        </div>

                        <!-- Section 6: Observations -->
                        <div class="form-section">
                            <div class="form-section-title">Observations</div>
                            <div class="form-group">
                                <label class="form-label">Observations techniciens</label>
                                <textarea class="form-textarea" name="sav_dem_observations_technicien"></textarea>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Explication intervention</label>
                                <textarea class="form-textarea" name="sav_dem_explication_intervention"></textarea>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Observation client</label>
                                <textarea class="form-textarea" name="sav_dem_observations_client"></textarea>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Observation responsable</label>
                                <textarea class="form-textarea" name="sav_dem_observation_responsable"></textarea>
                            </div>
                        </div>

                        <!-- Section 7: Facturation -->
                        <div class="form-section">
                            <div class="form-section-title">Facturation</div>
                            <div class="checkbox-group">
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_dem_fact_deplacement" name="sav_dem_fact_deplacement">
                                    <label for="sav_dem_fact_deplacement">Total déplacement HT</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_dem_fact_main_oeuvre" name="sav_dem_fact_main_oeuvre">
                                    <label for="sav_dem_fact_main_oeuvre">Total main d'œuvre HT</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_dem_fact_materiel" name="sav_dem_fact_materiel">
                                    <label for="sav_dem_fact_materiel">Total matériel HT</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_dem_fact_montant" name="sav_dem_fact_montant">
                                    <label for="sav_dem_fact_montant">Total montant HT</label>
                                </div>
                            </div>
                            <div class="checkbox-group" style="margin-top: 20px;">
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_dem_paiement_comptant" name="sav_dem_paiement_comptant">
                                    <label for="sav_dem_paiement_comptant">Paiement comptant</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_dem_paiement_carte" name="sav_dem_paiement_carte">
                                    <label for="sav_dem_paiement_carte">Carte bancaire</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_dem_paiement_bulletin" name="sav_dem_paiement_bulletin">
                                    <label for="sav_dem_paiement_bulletin">Bulletin de versement</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_dem_paiement_autres" name="sav_dem_paiement_autres">
                                    <label for="sav_dem_paiement_autres">Autres</label>
                                </div>
                            </div>
                        </div>

                        <!-- Section 8: Destination du matériel -->
                        <div class="form-section">
                            <div class="form-section-title">Destination du matériel</div>
                            <div class="radio-group">
                                <div class="radio-item">
                                    <input type="radio" id="sav_dem_remontage" name="sav_dem_destination" value="remontage">
                                    <label for="sav_dem_remontage">Démontage ou remontage du système dans mon nouveau domicile situé au :</label>
                                </div>
                                <div class="form-group" style="margin-left: 30px; margin-top: 10px;">
                                    <input type="text" class="form-input" name="sav_dem_nouvelle_adresse" placeholder="Nouvelle adresse">
                                </div>
                                <div class="radio-item" style="margin-top: 15px;">
                                    <input type="radio" id="sav_dem_reprise" name="sav_dem_destination" value="reprise">
                                    <label for="sav_dem_reprise">Reprise du matériel par Dialarme</label>
                                </div>
                                <div class="radio-item">
                                    <input type="radio" id="sav_dem_remise" name="sav_dem_destination" value="remise">
                                    <label for="sav_dem_remise">Remise du matériel au client</label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- SAV simple Form -->
                    <div id="savSimpleForm" style="display: none;">
                        <!-- Section 1: Informations générales -->
                        <div class="form-section">
                            <div class="form-section-title">Informations générales</div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">N° de client</label>
                                    <input type="text" class="form-input" name="sav_simple_num_client">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">N° du contrat</label>
                                    <input type="text" class="form-input" name="sav_simple_num_contrat">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Nom</label>
                                    <input type="text" class="form-input" name="sav_simple_nom_client">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Prénom</label>
                                    <input type="text" class="form-input" name="sav_simple_prenom_client">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Adresse</label>
                                    <input type="text" class="form-input" name="sav_simple_adresse">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Localité</label>
                                    <input type="text" class="form-input" name="sav_simple_localite">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Date d'intervention</label>
                                    <input type="date" class="form-input" name="sav_simple_date_intervention" id="date_intervention_sav_simple">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Type d'installation</label>
                                    <input type="text" class="form-input" name="sav_simple_type_installation">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Heure de début</label>
                                    <input type="time" class="form-input" name="sav_simple_heure_debut">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Heure de fin</label>
                                    <input type="time" class="form-input" name="sav_simple_heure_fin">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Technicien</label>
                                <select class="form-input" name="sav_simple_technicien" required>
                                    <option value="">Sélectionner un technicien...</option>
                                    <option value="Alexis DEVILLE">Alexis DEVILLE</option>
                                    <option value="Corentin LE JONCOUR">Corentin LE JONCOUR</option>
                                    <option value="Faith ERSOY">Faith ERSOY</option>
                                    <option value="Guillaume BEX">Guillaume BEX</option>
                                    <option value="Ismail ECH CHATOUI">Ismail ECH CHATOUI</option>
                                    <option value="Jamal EL HALFI">Jamal EL HALFI</option>
                                    <option value="Mathieu CLAVEL">Mathieu CLAVEL</option>
                                    <option value="Sedat MADEN">Sedat MADEN</option>
                                </select>
                            </div>
                        </div>

                        <!-- Section 2: Opérations effectuées -->
                        <div class="form-section">
                            <div class="form-section-title">Opérations effectuées</div>
                            <div class="checkbox-group">
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_simple_op_installation" name="sav_simple_op_installation">
                                    <label for="sav_simple_op_installation">Installation</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_simple_op_demontage" name="sav_simple_op_demontage">
                                    <label for="sav_simple_op_demontage">Démontage</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_simple_op_remontage" name="sav_simple_op_remontage">
                                    <label for="sav_simple_op_remontage">Remontage</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_simple_op_demenagement" name="sav_simple_op_demenagement">
                                    <label for="sav_simple_op_demenagement">Déménagement</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_simple_op_reception_cle" name="sav_simple_op_reception_cle">
                                    <label for="sav_simple_op_reception_cle">Réception des clés</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_simple_op_rajout" name="sav_simple_op_rajout">
                                    <label for="sav_simple_op_rajout">Rajout matériel</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_simple_op_deplacement" name="sav_simple_op_deplacement">
                                    <label for="sav_simple_op_deplacement">Déplacement matériel</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_simple_op_probleme" name="sav_simple_op_probleme">
                                    <label for="sav_simple_op_probleme">Problème matériel</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_simple_op_remplacement" name="sav_simple_op_remplacement">
                                    <label for="sav_simple_op_remplacement">Remplacement matériel</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_simple_op_autres" name="sav_simple_op_autres" onchange="toggleSavSimpleAutresField()">
                                    <label for="sav_simple_op_autres">Autres</label>
                                </div>
                            </div>
                            <div id="sav_simple_autres_field" style="display: none; margin-top: 10px;">
                                <input type="text" class="form-input" name="sav_simple_op_autres_text" placeholder="Précisez...">
                            </div>
                        </div>

                        <!-- Section 3: Remplacement de piles -->
                        <div class="form-section">
                            <div class="form-section-title">Remplacement de piles</div>
                            <div class="quantity-group">
                                <div class="quantity-item">
                                    <label for="sav_simple_pile_centrale">Centrale</label>
                                    <input type="number" id="sav_simple_pile_centrale" name="sav_simple_pile_centrale" min="0" value="0">
                                </div>
                                <div class="quantity-item">
                                    <label for="sav_simple_pile_clavier">Clavier</label>
                                    <input type="number" id="sav_simple_pile_clavier" name="sav_simple_pile_clavier" min="0" value="0">
                                </div>
                                <div class="quantity-item">
                                    <label for="sav_simple_pile_dv">DV</label>
                                    <input type="number" id="sav_simple_pile_dv" name="sav_simple_pile_dv" min="0" value="0">
                                </div>
                                <div class="quantity-item">
                                    <label for="sav_simple_pile_dvc">DVC</label>
                                    <input type="number" id="sav_simple_pile_dvc" name="sav_simple_pile_dvc" min="0" value="0">
                                </div>
                                <div class="quantity-item">
                                    <label for="sav_simple_pile_do">DO</label>
                                    <input type="number" id="sav_simple_pile_do" name="sav_simple_pile_do" min="0" value="0">
                                </div>
                                <div class="quantity-item">
                                    <label for="sav_simple_pile_df">DF</label>
                                    <input type="number" id="sav_simple_pile_df" name="sav_simple_pile_df" min="0" value="0">
                                </div>
                                <div class="quantity-item">
                                    <label for="sav_simple_pile_tcde">TCDE</label>
                                    <input type="number" id="sav_simple_pile_tcde" name="sav_simple_pile_tcde" min="0" value="0">
                                </div>
                            </div>
                        </div>

                        <!-- Section 4: Informations système -->
                        <div class="form-section">
                            <div class="form-section-title">Informations système</div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">N° série de la centrale</label>
                                    <input type="text" class="form-input" name="sav_simple_num_serie_centrale">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">N° téléphone SIM</label>
                                    <input type="text" class="form-input" name="sav_simple_num_telephone_sim">
                                </div>
                            </div>
                        </div>

                        <!-- Section 5: Contrôle d'installation -->
                        <div class="form-section">
                            <div class="form-section-title">Contrôle d'installation</div>
                            <div class="checkbox-group">
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_simple_ctrl_zone" name="sav_simple_ctrl_zone">
                                    <label for="sav_simple_ctrl_zone">Zone</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_simple_ctrl_quantite" name="sav_simple_ctrl_quantite">
                                    <label for="sav_simple_ctrl_quantite">Quantité matériel</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_simple_ctrl_parametre" name="sav_simple_ctrl_parametre">
                                    <label for="sav_simple_ctrl_parametre">Paramètre TMT & APN</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_simple_ctrl_detection" name="sav_simple_ctrl_detection">
                                    <label for="sav_simple_ctrl_detection">Test de détection</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_simple_ctrl_transmission" name="sav_simple_ctrl_transmission">
                                    <label for="sav_simple_ctrl_transmission">Test de transmission</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_simple_ctrl_protege" name="sav_simple_ctrl_protege">
                                    <label for="sav_simple_ctrl_protege">Système protégé par détecteur</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_simple_ctrl_secteur" name="sav_simple_ctrl_secteur">
                                    <label for="sav_simple_ctrl_secteur">Système sur secteur</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_simple_ctrl_instructions" name="sav_simple_ctrl_instructions">
                                    <label for="sav_simple_ctrl_instructions">Instructions</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_simple_ctrl_telephone" name="sav_simple_ctrl_telephone">
                                    <label for="sav_simple_ctrl_telephone">Téléphone et internet du client</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_simple_ctrl_divers" name="sav_simple_ctrl_divers">
                                    <label for="sav_simple_ctrl_divers">Divers</label>
                                </div>
                            </div>
                        </div>

                        <!-- Section 6: Observations -->
                        <div class="form-section">
                            <div class="form-section-title">Observations</div>
                            <div class="form-group">
                                <label class="form-label">Observations techniciens</label>
                                <textarea class="form-textarea" name="sav_simple_observations_technicien"></textarea>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Explication intervention</label>
                                <textarea class="form-textarea" name="sav_simple_explication_intervention"></textarea>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Observation client</label>
                                <textarea class="form-textarea" name="sav_simple_observations_client"></textarea>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Observation responsable</label>
                                <textarea class="form-textarea" name="sav_simple_observation_responsable"></textarea>
                            </div>
                        </div>

                        <!-- Section 7: Facturation de base -->
                        <div class="form-section">
                            <div class="form-section-title">Facturation</div>
                            <div class="checkbox-group">
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_simple_fact_deplacement" name="sav_simple_fact_deplacement">
                                    <label for="sav_simple_fact_deplacement">Total déplacement HT</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_simple_fact_main_oeuvre" name="sav_simple_fact_main_oeuvre">
                                    <label for="sav_simple_fact_main_oeuvre">Total main d'œuvre HT</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_simple_fact_materiel" name="sav_simple_fact_materiel">
                                    <label for="sav_simple_fact_materiel">Total matériel HT</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_simple_fact_montant" name="sav_simple_fact_montant">
                                    <label for="sav_simple_fact_montant">Total montant HT</label>
                                </div>
                            </div>
                            <div class="checkbox-group" style="margin-top: 20px;">
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_simple_paiement_comptant" name="sav_simple_paiement_comptant">
                                    <label for="sav_simple_paiement_comptant">Paiement comptant</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_simple_paiement_carte" name="sav_simple_paiement_carte">
                                    <label for="sav_simple_paiement_carte">Carte bancaire</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_simple_paiement_bulletin" name="sav_simple_paiement_bulletin">
                                    <label for="sav_simple_paiement_bulletin">Bulletin de versement</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_simple_paiement_autres" name="sav_simple_paiement_autres">
                                    <label for="sav_simple_paiement_autres">Autres</label>
                                </div>
                            </div>
                        </div>

                        <!-- Section 8: Facture détaillée (optionnelle) -->
                        <div class="form-section">
                            <div class="form-section-title">Facture détaillée (optionnelle)</div>
                            <div class="dynamic-table">
                                <table id="savSimpleFactureTable">
                                    <thead>
                                        <tr>
                                            <th>Nom du produit</th>
                                            <th>Quantité</th>
                                            <th>Prix unitaire</th>
                                            <th>Montant</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="savSimpleFactureBody">
                                        <tr>
                                            <td><input type="text" name="sav_simple_fact_produit[]"></td>
                                            <td><input type="number" name="sav_simple_fact_qty[]" min="1" onchange="calculateSavSimpleRow(this)"></td>
                                            <td><input type="number" name="sav_simple_fact_pu[]" step="0.01" min="0" onchange="calculateSavSimpleRow(this)"></td>
                                            <td><input type="number" name="sav_simple_fact_montant[]" step="0.01" readonly></td>
                                            <td><button type="button" class="btn btn-remove" onclick="removeSavSimpleFactureRow(this)">Supprimer</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <button type="button" class="btn btn-add" onclick="addSavSimpleFactureRow()">+ Ajouter un produit</button>
                            </div>
                            <div class="totals-section">
                                <div class="total-row">
                                    <span>Total HT:</span>
                                    <span id="sav_simple_total_ht">0.00 CHF</span>
                                </div>
                                <div class="total-row">
                                    <span>TVA 8.1%:</span>
                                    <span id="sav_simple_total_tva">0.00 CHF</span>
                                </div>
                                <div class="total-row grand-total">
                                    <span>Total TTC:</span>
                                    <span id="sav_simple_total_ttc">0.00 CHF</span>
                                </div>
                            </div>
                            <div class="checkbox-group" style="margin-top: 20px;">
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_simple_fact_bulletin" name="sav_simple_fact_bulletin">
                                    <label for="sav_simple_fact_bulletin">Bulletin de versement</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_simple_fact_carte" name="sav_simple_fact_carte">
                                    <label for="sav_simple_fact_carte">Carte bancaire</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="sav_simple_fact_espece" name="sav_simple_fact_espece">
                                    <label for="sav_simple_fact_espece">Espèce</label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Facturier Form -->
                    <div id="facturierForm" style="display: none;">
                        <!-- Section 1: Informations client -->
                        <div class="form-section">
                            <div class="form-section-title">Informations client</div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Nom et prénom du client</label>
                                    <input type="text" class="form-input" name="fact_nom_prenom">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">N° client</label>
                                    <input type="text" class="form-input" name="fact_num_client">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Adresse</label>
                                    <input type="text" class="form-input" name="fact_adresse">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Localité</label>
                                    <input type="text" class="form-input" name="fact_localite">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Technicien</label>
                                    <select class="form-input" name="fact_technicien" required>
                                        <option value="">Sélectionner un technicien...</option>
                                        <option value="Alexis DEVILLE">Alexis DEVILLE</option>
                                        <option value="Corentin LE JONCOUR">Corentin LE JONCOUR</option>
                                        <option value="Faith ERSOY">Faith ERSOY</option>
                                        <option value="Guillaume BEX">Guillaume BEX</option>
                                        <option value="Ismail ECH CHATOUI">Ismail ECH CHATOUI</option>
                                        <option value="Jamal EL HALFI">Jamal EL HALFI</option>
                                        <option value="Mathieu CLAVEL">Mathieu CLAVEL</option>
                                        <option value="Sedat MADEN">Sedat MADEN</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Date</label>
                                    <input type="date" class="form-input" name="fact_date" id="date_facturier">
                                </div>
                            </div>
                        </div>

                        <!-- Section 2: Produits -->
                        <div class="form-section">
                            <div class="form-section-title">Détail des produits</div>
                            <div class="dynamic-table">
                                <table id="facturierTable">
                                    <thead>
                                        <tr>
                                            <th>Nom du produit</th>
                                            <th>Quantité</th>
                                            <th>Prix unitaire</th>
                                            <th>Montant</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="facturierBody">
                                        <tr>
                                            <td><input type="text" name="fact_produit[]"></td>
                                            <td><input type="number" name="fact_qty[]" min="1" onchange="calculateFacturierRow(this)"></td>
                                            <td><input type="number" name="fact_pu[]" step="0.01" min="0" onchange="calculateFacturierRow(this)"></td>
                                            <td><input type="number" name="fact_montant[]" step="0.01" readonly></td>
                                            <td><button type="button" class="btn btn-remove" onclick="removeFacturierRow(this)">Supprimer</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <button type="button" class="btn btn-add" onclick="addFacturierRow()">+ Ajouter un produit</button>
                            </div>
                            <div class="totals-section">
                                <div class="total-row">
                                    <span>Total HT:</span>
                                    <span id="fact_total_ht">0.00 CHF</span>
                                </div>
                                <div class="total-row">
                                    <span>TVA 8.1%:</span>
                                    <span id="fact_total_tva">0.00 CHF</span>
                                </div>
                                <div class="total-row grand-total">
                                    <span>Total TTC:</span>
                                    <span id="fact_total_ttc">0.00 CHF</span>
                                </div>
                            </div>
                        </div>

                        <!-- Section 3: Mode de paiement -->
                        <div class="form-section">
                            <div class="form-section-title">Mode de paiement</div>
                            <div class="checkbox-group">
                                <div class="checkbox-item">
                                    <input type="checkbox" id="fact_paiement_bulletin" name="fact_paiement_bulletin">
                                    <label for="fact_paiement_bulletin">Bulletin de versement</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="fact_paiement_carte" name="fact_paiement_carte">
                                    <label for="fact_paiement_carte">Carte bancaire</label>
                                </div>
                                <div class="checkbox-item">
                                    <input type="checkbox" id="fact_paiement_espece" name="fact_paiement_espece">
                                    <label for="fact_paiement_espece">Espèce</label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Quittance clé Form -->
                    <div id="quittanceForm" style="display: none;">
                        <!-- Section 1: Informations générales -->
                        <div class="form-section">
                            <div class="form-section-title">Informations générales</div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Date</label>
                                    <input type="date" class="form-input" name="quit_date" id="date_quittance">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Quittance transfert de matériel pour raccordement n°</label>
                                    <input type="text" class="form-input" name="quit_numero">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Nom</label>
                                    <input type="text" class="form-input" name="quit_nom">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Raison sociale</label>
                                    <input type="text" class="form-input" name="quit_raison_sociale">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Adresse</label>
                                    <input type="text" class="form-input" name="quit_adresse">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">NPA / Lieu</label>
                                    <input type="text" class="form-input" name="quit_npa_lieu">
                                </div>
                            </div>
                        </div>

                        <!-- Section 2: Matériel remis -->
                        <div class="form-section">
                            <div class="form-section-title">Matériel remis</div>
                            <div class="form-group">
                                <div class="checkbox-item">
                                    <input type="checkbox" id="quit_cle1" name="quit_cle1">
                                    <label for="quit_cle1">Clé - Type et N°:</label>
                                    <input type="text" class="form-input" name="quit_cle1_detail" style="width: 200px; margin-left: 10px;">
                                </div>
                                <div class="checkbox-item" style="margin-top: 10px;">
                                    <input type="checkbox" id="quit_cle2" name="quit_cle2">
                                    <label for="quit_cle2">Clé - Type et N°:</label>
                                    <input type="text" class="form-input" name="quit_cle2_detail" style="width: 200px; margin-left: 10px;">
                                </div>
                                <div class="checkbox-item" style="margin-top: 10px;">
                                    <input type="checkbox" id="quit_cle3" name="quit_cle3">
                                    <label for="quit_cle3">Clé - Type et N°:</label>
                                    <input type="text" class="form-input" name="quit_cle3_detail" style="width: 200px; margin-left: 10px;">
                                </div>
                                <div class="checkbox-item" style="margin-top: 10px;">
                                    <input type="checkbox" id="quit_badge1" name="quit_badge1">
                                    <label for="quit_badge1">Badge - Type et N°:</label>
                                    <input type="text" class="form-input" name="quit_badge1_detail" style="width: 200px; margin-left: 10px;">
                                </div>
                                <div class="checkbox-item" style="margin-top: 10px;">
                                    <input type="checkbox" id="quit_badge2" name="quit_badge2">
                                    <label for="quit_badge2">Badge - Type et N°:</label>
                                    <input type="text" class="form-input" name="quit_badge2_detail" style="width: 200px; margin-left: 10px;">
                                </div>
                                <div class="checkbox-item" style="margin-top: 10px;">
                                    <input type="checkbox" id="quit_dossier" name="quit_dossier">
                                    <label for="quit_dossier">Dossier d'intervention - Type et N°:</label>
                                    <input type="text" class="form-input" name="quit_dossier_detail" style="width: 200px; margin-left: 10px;">
                                </div>
                                <div class="checkbox-item" style="margin-top: 10px;">
                                    <input type="checkbox" id="quit_cle_systeme1" name="quit_cle_systeme1">
                                    <label for="quit_cle_systeme1">Clé pour système d'alarme - Type et N°:</label>
                                    <input type="text" class="form-input" name="quit_cle_systeme1_detail" style="width: 200px; margin-left: 10px;">
                                </div>
                                <div class="checkbox-item" style="margin-top: 10px;">
                                    <input type="checkbox" id="quit_cle_systeme2" name="quit_cle_systeme2">
                                    <label for="quit_cle_systeme2">Clé pour système d'alarme - Type et N°:</label>
                                    <input type="text" class="form-input" name="quit_cle_systeme2_detail" style="width: 200px; margin-left: 10px;">
                                </div>
                                <div class="checkbox-item" style="margin-top: 10px;">
                                    <input type="checkbox" id="quit_autre" name="quit_autre">
                                    <label for="quit_autre">Autre - Type et N°:</label>
                                    <input type="text" class="form-input" name="quit_autre_detail" style="width: 200px; margin-left: 10px;">
                                </div>
                            </div>
                        </div>

                        <!-- Section 3: Matériel rendu par CATE -->
                        <div class="form-section">
                            <div class="form-section-title">Rendue par CATE</div>
                            <div class="form-group">
                                <div class="checkbox-item">
                                    <input type="checkbox" id="quit_rendu_cle1" name="quit_rendu_cle1">
                                    <label for="quit_rendu_cle1">Clé - Type et N°:</label>
                                    <input type="text" class="form-input" name="quit_rendu_cle1_detail" style="width: 200px; margin-left: 10px;">
                                </div>
                                <div class="checkbox-item" style="margin-top: 10px;">
                                    <input type="checkbox" id="quit_rendu_cle2" name="quit_rendu_cle2">
                                    <label for="quit_rendu_cle2">Clé - Type et N°:</label>
                                    <input type="text" class="form-input" name="quit_rendu_cle2_detail" style="width: 200px; margin-left: 10px;">
                                </div>
                                <div class="checkbox-item" style="margin-top: 10px;">
                                    <input type="checkbox" id="quit_rendu_cle3" name="quit_rendu_cle3">
                                    <label for="quit_rendu_cle3">Clé - Type et N°:</label>
                                    <input type="text" class="form-input" name="quit_rendu_cle3_detail" style="width: 200px; margin-left: 10px;">
                                </div>
                                <div class="checkbox-item" style="margin-top: 10px;">
                                    <input type="checkbox" id="quit_rendu_badge1" name="quit_rendu_badge1">
                                    <label for="quit_rendu_badge1">Badge - Type et N°:</label>
                                    <input type="text" class="form-input" name="quit_rendu_badge1_detail" style="width: 200px; margin-left: 10px;">
                                </div>
                                <div class="checkbox-item" style="margin-top: 10px;">
                                    <input type="checkbox" id="quit_rendu_badge2" name="quit_rendu_badge2">
                                    <label for="quit_rendu_badge2">Badge - Type et N°:</label>
                                    <input type="text" class="form-input" name="quit_rendu_badge2_detail" style="width: 200px; margin-left: 10px;">
                                </div>
                                <div class="checkbox-item" style="margin-top: 10px;">
                                    <input type="checkbox" id="quit_rendu_dossier" name="quit_rendu_dossier">
                                    <label for="quit_rendu_dossier">Dossier d'intervention - Type et N°:</label>
                                    <input type="text" class="form-input" name="quit_rendu_dossier_detail" style="width: 200px; margin-left: 10px;">
                                </div>
                                <div class="checkbox-item" style="margin-top: 10px;">
                                    <input type="checkbox" id="quit_rendu_cle_systeme1" name="quit_rendu_cle_systeme1">
                                    <label for="quit_rendu_cle_systeme1">Clé pour système d'alarme - Type et N°:</label>
                                    <input type="text" class="form-input" name="quit_rendu_cle_systeme1_detail" style="width: 200px; margin-left: 10px;">
                                </div>
                                <div class="checkbox-item" style="margin-top: 10px;">
                                    <input type="checkbox" id="quit_rendu_cle_systeme2" name="quit_rendu_cle_systeme2">
                                    <label for="quit_rendu_cle_systeme2">Clé pour système d'alarme - Type et N°:</label>
                                    <input type="text" class="form-input" name="quit_rendu_cle_systeme2_detail" style="width: 200px; margin-left: 10px;">
                                </div>
                                <div class="checkbox-item" style="margin-top: 10px;">
                                    <input type="checkbox" id="quit_rendu_autre" name="quit_rendu_autre">
                                    <label for="quit_rendu_autre">Autre - Type et N°:</label>
                                    <input type="text" class="form-input" name="quit_rendu_autre_detail" style="width: 200px; margin-left: 10px;">
                                </div>
                            </div>
                        </div>

                        <!-- Section 4: Commentaire -->
                        <div class="form-section">
                            <div class="form-section-title">Commentaire</div>
                            <div class="form-group">
                                <textarea class="form-textarea" name="quit_commentaire" rows="4"></textarea>
                            </div>
                        </div>
                    </div>

                    <!-- Default form for other documents -->
                    <div id="defaultForm" style="display: none;">
                        <div class="form-section">
                            <p style="text-align: center; color: #666; padding: 40px;">
                                Ce formulaire sera configuré prochainement.
                            </p>
                        </div>
                    </div>
                    
                    <div class="form-actions">
                        <button type="button" class="btn btn-secondary" onclick="clearForm()">Effacer</button>
                        <button type="button" class="btn btn-primary" onclick="exportPDF()">Exporter en PDF</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        // Current form document type
        let currentDocument = '';
        let zoneCounter = 1;
        let savModZoneCounter = 1;

        // Initialize dates to today
        window.onload = function() {
            const today = new Date().toISOString().split('T')[0];
            const dateFields = [
                'date_intervention_install',
                'date_intervention_sav_mod', 
                'date_intervention_sav_dem',
                'date_intervention_sav_simple',
                'date_facturier',
                'date_quittance'
            ];
            dateFields.forEach(id => {
                const field = document.getElementById(id);
                if (field) field.value = today;
            });
        };

        // Show folder section
        function showFolder() {
            document.getElementById('mainSection').classList.add('hidden');
            document.getElementById('folderSection').classList.remove('hidden');
            document.getElementById('formSection').classList.add('hidden');
        }

        // Show main section
        function showMain() {
            document.getElementById('folderSection').classList.add('hidden');
            document.getElementById('mainSection').classList.remove('hidden');
            document.getElementById('formSection').classList.add('hidden');
        }

        // Open form for specific document
        function openForm(docType) {
            currentDocument = docType;
            document.getElementById('mainSection').classList.add('hidden');
            document.getElementById('folderSection').classList.add('hidden');
            document.getElementById('formSection').classList.remove('hidden');
            
            // Set form title
            document.getElementById('formTitle').textContent = docType;
            
            // Hide all forms first
            document.getElementById('installationForm').style.display = 'none';
            document.getElementById('savModificationsForm').style.display = 'none';
            document.getElementById('savDemontageForm').style.display = 'none';
            document.getElementById('savSimpleForm').style.display = 'none';
            document.getElementById('facturierForm').style.display = 'none';
            document.getElementById('quittanceForm').style.display = 'none';
            document.getElementById('defaultForm').style.display = 'none';
            
            // Show appropriate form
            if (docType === 'Installation') {
                document.getElementById('installationForm').style.display = 'block';
                zoneCounter = 1;
            } else if (docType === 'SAV avec modifications') {
                document.getElementById('savModificationsForm').style.display = 'block';
                savModZoneCounter = 1;
            } else if (docType === 'SAV démontage') {
                document.getElementById('savDemontageForm').style.display = 'block';
            } else if (docType === 'SAV simple') {
                document.getElementById('savSimpleForm').style.display = 'block';
            } else if (docType === 'Facturier') {
                document.getElementById('facturierForm').style.display = 'block';
            } else if (docType === 'Quittance clé') {
                document.getElementById('quittanceForm').style.display = 'block';
            } else {
                document.getElementById('defaultForm').style.display = 'block';
            }
        }

        // Close form
        function closeForm() {
            document.getElementById('formSection').classList.add('hidden');
            document.getElementById('folderSection').classList.add('hidden');
            document.getElementById('mainSection').classList.remove('hidden');
        }

        // Clear form
        function clearForm() {
            if (confirm('Êtes-vous sûr de vouloir effacer tous les champs ?')) {
                document.getElementById('documentForm').reset();
                calculateAllTotals();
            }
        }

        // Toggle autres field for Installation
        function toggleAutresField() {
            const checkbox = document.getElementById('op_autres');
            const field = document.getElementById('autres_field');
            if (checkbox && field) {
                field.style.display = checkbox.checked ? 'block' : 'none';
            }
        }

        // Toggle autres field for SAV Modifications
        function toggleSavModAutresField() {
            const checkbox = document.getElementById('sav_mod_op_autres');
            const field = document.getElementById('sav_mod_autres_field');
            if (checkbox && field) {
                field.style.display = checkbox.checked ? 'block' : 'none';
            }
        }

        // Toggle autres field for SAV Démontage
        function toggleSavDemAutresField() {
            const checkbox = document.getElementById('sav_dem_op_autres');
            const field = document.getElementById('sav_dem_autres_field');
            if (checkbox && field) {
                field.style.display = checkbox.checked ? 'block' : 'none';
            }
        }

        // Toggle autres field for SAV Simple
        function toggleSavSimpleAutresField() {
            const checkbox = document.getElementById('sav_simple_op_autres');
            const field = document.getElementById('sav_simple_autres_field');
            if (checkbox && field) {
                field.style.display = checkbox.checked ? 'block' : 'none';
            }
        }

        // Add material row
        function addMaterielRow() {
            const tbody = document.getElementById('materielBody');
            const newRow = tbody.insertRow();
            newRow.innerHTML = `
                <td><input type="text" name="materiel_nom[]"></td>
                <td><input type="number" name="materiel_qty[]" min="1"></td>
                <td><input type="text" name="materiel_loc[]"></td>
                <td><button type="button" class="btn btn-remove" onclick="removeRow(this)">Supprimer</button></td>
            `;
        }

        // Add zone row
        function addZoneRow() {
            zoneCounter++;
            const tbody = document.getElementById('zonesBody');
            const newRow = tbody.insertRow();
            newRow.innerHTML = `
                <td>Canal ${zoneCounter}</td>
                <td><input type="text" name="zone_tempo_entree[]"></td>
                <td><input type="text" name="zone_tempo_sortie[]"></td>
                <td><input type="text" name="zone_etage[]"></td>
                <td><button type="button" class="btn btn-remove" onclick="removeRow(this)">Supprimer</button></td>
            `;
        }

        // Add SAV Mod zone row
        function addSavModZoneRow() {
            savModZoneCounter++;
            const tbody = document.getElementById('savModZonesBody');
            const newRow = tbody.insertRow();
            newRow.innerHTML = `
                <td>Canal ${savModZoneCounter}</td>
                <td><input type="text" name="sav_mod_zone_tempo_entree[]"></td>
                <td><input type="text" name="sav_mod_zone_tempo_sortie[]"></td>
                <td><input type="text" name="sav_mod_zone_etage[]"></td>
                <td><button type="button" class="btn btn-remove" onclick="removeRow(this)">Supprimer</button></td>
            `;
        }

        // Add contact row
        function addContactRow() {
            const tbody = document.getElementById('contactsBody');
            const newRow = tbody.insertRow();
            newRow.innerHTML = `
                <td><input type="text" name="contact_nom[]"></td>
                <td><input type="text" name="contact_adresse[]"></td>
                <td><input type="text" name="contact_tel[]"></td>
                <td><input type="text" name="contact_mdp[]"></td>
                <td><input type="text" name="contact_cle[]"></td>
                <td><input type="text" name="contact_lien[]"></td>
                <td><button type="button" class="btn btn-remove" onclick="removeRow(this)">Supprimer</button></td>
            `;
        }

        // Add SAV Mod contact row
        function addSavModContactRow() {
            const tbody = document.getElementById('savModContactsBody');
            const newRow = tbody.insertRow();
            newRow.innerHTML = `
                <td><input type="text" name="sav_mod_contact_nom[]"></td>
                <td><input type="text" name="sav_mod_contact_adresse[]"></td>
                <td><input type="text" name="sav_mod_contact_cle[]"></td>
                <td><input type="text" name="sav_mod_contact_lien[]"></td>
                <td><input type="text" name="sav_mod_contact_tel[]"></td>
                <td><input type="text" name="sav_mod_contact_mdp[]"></td>
                <td><button type="button" class="btn btn-remove" onclick="removeRow(this)">Supprimer</button></td>
            `;
        }

        // Remove row
        function removeRow(button) {
            const row = button.closest('tr');
            row.remove();
            calculateAllTotals();
        }

        // Calculate row for SAV Simple facture
        function calculateSavSimpleRow(input) {
            const row = input.closest('tr');
            const qty = parseFloat(row.querySelector('input[name="sav_simple_fact_qty[]"]').value) || 0;
            const pu = parseFloat(row.querySelector('input[name="sav_simple_fact_pu[]"]').value) || 0;
            const montant = qty * pu;
            row.querySelector('input[name="sav_simple_fact_montant[]"]').value = montant.toFixed(2);
            calculateSavSimpleTotals();
        }

        // Calculate totals for SAV Simple facture
        function calculateSavSimpleTotals() {
            const montants = document.querySelectorAll('input[name="sav_simple_fact_montant[]"]');
            let totalHT = 0;
            montants.forEach(input => {
                totalHT += parseFloat(input.value) || 0;
            });
            const tva = totalHT * 0.081;
            const totalTTC = totalHT + tva;
            
            document.getElementById('sav_simple_total_ht').textContent = totalHT.toFixed(2) + ' CHF';
            document.getElementById('sav_simple_total_tva').textContent = tva.toFixed(2) + ' CHF';
            document.getElementById('sav_simple_total_ttc').textContent = totalTTC.toFixed(2) + ' CHF';
        }

        // Add SAV Simple facture row
        function addSavSimpleFactureRow() {
            const tbody = document.getElementById('savSimpleFactureBody');
            const newRow = tbody.insertRow();
            newRow.innerHTML = `
                <td><input type="text" name="sav_simple_fact_produit[]"></td>
                <td><input type="number" name="sav_simple_fact_qty[]" min="1" onchange="calculateSavSimpleRow(this)"></td>
                <td><input type="number" name="sav_simple_fact_pu[]" step="0.01" min="0" onchange="calculateSavSimpleRow(this)"></td>
                <td><input type="number" name="sav_simple_fact_montant[]" step="0.01" readonly></td>
                <td><button type="button" class="btn btn-remove" onclick="removeSavSimpleFactureRow(this)">Supprimer</button></td>
            `;
        }

        // Remove SAV Simple facture row
        function removeSavSimpleFactureRow(button) {
            const row = button.closest('tr');
            row.remove();
            calculateSavSimpleTotals();
        }

        // Calculate row for Facturier
        function calculateFacturierRow(input) {
            const row = input.closest('tr');
            const qty = parseFloat(row.querySelector('input[name="fact_qty[]"]').value) || 0;
            const pu = parseFloat(row.querySelector('input[name="fact_pu[]"]').value) || 0;
            const montant = qty * pu;
            row.querySelector('input[name="fact_montant[]"]').value = montant.toFixed(2);
            calculateFacturierTotals();
        }

        // Calculate totals for Facturier
        function calculateFacturierTotals() {
            const montants = document.querySelectorAll('input[name="fact_montant[]"]');
            let totalHT = 0;
            montants.forEach(input => {
                totalHT += parseFloat(input.value) || 0;
            });
            const tva = totalHT * 0.081;
            const totalTTC = totalHT + tva;
            
            document.getElementById('fact_total_ht').textContent = totalHT.toFixed(2) + ' CHF';
            document.getElementById('fact_total_tva').textContent = tva.toFixed(2) + ' CHF';
            document.getElementById('fact_total_ttc').textContent = totalTTC.toFixed(2) + ' CHF';
        }

        // Add Facturier row
        function addFacturierRow() {
            const tbody = document.getElementById('facturierBody');
            const newRow = tbody.insertRow();
            newRow.innerHTML = `
                <td><input type="text" name="fact_produit[]"></td>
                <td><input type="number" name="fact_qty[]" min="1" onchange="calculateFacturierRow(this)"></td>
                <td><input type="number" name="fact_pu[]" step="0.01" min="0" onchange="calculateFacturierRow(this)"></td>
                <td><input type="number" name="fact_montant[]" step="0.01" readonly></td>
                <td><button type="button" class="btn btn-remove" onclick="removeFacturierRow(this)">Supprimer</button></td>
            `;
        }

        // Remove Facturier row
        function removeFacturierRow(button) {
            const row = button.closest('tr');
            row.remove();
            calculateFacturierTotals();
        }

        // Calculate all totals
        function calculateAllTotals() {
            calculateSavSimpleTotals();
            calculateFacturierTotals();
        }

        // Export to PDF
        function exportPDF() {
            const formData = new FormData(document.getElementById('documentForm'));
            const data = {};
            for (let [key, value] of formData.entries()) {
                if (!data[key]) {
                    data[key] = value;
                } else {
                    if (!Array.isArray(data[key])) {
                        data[key] = [data[key]];
                    }
                    data[key].push(value);
                }
            }
            
            console.log('Données du formulaire:', data);
            
            alert(`Document "${currentDocument}" prêt pour l'export PDF!\n\nToutes les données ont été collectées et sont prêtes pour la génération du PDF.\n\nPour une implémentation complète, intégrez une bibliothèque comme jsPDF ou générez le PDF côté serveur.`);
        }
    </script>
</body>
</html>
