Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBED1E7C03
	for <dtrace@lists.linux.dev>; Wed,  6 Aug 2025 17:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754503060; cv=fail; b=PiC66faKlbiU+JLpSYS2McTHyQp5mbncVz87wLRnxeSlDZbOzXUR45HaOHNWHzHf2HTf8u95HF5542Z/iRsmKodgbdBdtFSBQ/0wt2ESF3rOHh/PvoXwrAVFStjuIifQ2EmuV77MH728tN5URbSU2oSoEHIGTgWla3m830E0gOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754503060; c=relaxed/simple;
	bh=gxVBWzoKpOTKuOXKvx2nCbr5tmGa10LoNv36UNpFpEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=R+WmhunooI6TfR1jStAbW5Gptif2PhzlGV45+sQz6oipMJM1zKkoXO7f6N2gdBvutDfzHkBZ7EaPJmLVkXXZgGbh6f+dhWkfC5y3GcfC5SJ4utxGAY79Eab0eM8FgYjvoMVluL1Hj+G8HLVwlGMZ0qt1/CKDYqSJJgqpaOE40H8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UHZ9xese; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=AGhVYdBK; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UHZ9xese";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="AGhVYdBK"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576GRPiH026018
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 17:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=HIZxprUU9FGxH1uqvy
	KjqOaRvOEcFLn5An2xbFc20MM=; b=UHZ9xeseG+y6M46joq27o7GXwH6WR86CyV
	UBfpqh+YUSniRX/xFUcc1Ptd2OIQyXdeQJ7OZ85Jg8gtizymxjpmWHaNqV2Bsai9
	XeNCBvV25oRSkpw8YnAybEFy7PXPBp0WxRkxqwfGrDO1W6d7n0zndDi3AKT01Awq
	Ft9bEDcsRpRB8ASvXYiGLX5ARlLaKsQX09RqzBwB/nzVusuqXplww1oFgsP4VQ+A
	lv3gxaZRUdd78S+WBF5FZgAWywpMKeBhtaE+PO8OCFjluvMjwM/NYE6GKrYNtgxO
	yOurh7w5UZvTznDR97B+yvLOK7Zxn8lJ3DX2sRYYcheCT/pb9ilA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvg29qs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 17:57:38 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 576HMjJP005674
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 17:57:36 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwxc4nq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 17:57:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQ96HL/7JliLZi6owaZtFLeNCCdNyJcBAW2kqUE6i5JWA//gZzZ6XoQQCY/FzKtQ3Q3RyXH8dKfvtBmsd+tnwWR9urtQ/rU4BMnnCvNf3p3b5zIuvs5Rm4rV738m5YiElkFqO7Fb19r8lQj0fAap84EopfjMV+v3wAdP1QExlk6nv95hPzmMiLZlo/f5mZ2tkCAHxK4xxyTI1IbuZrT8u3xvzQ5458QTo77695H4zkD3gTvyptFhiUNSjwjeFUVhi3FoJW2ThI4hBMdmnvLy8JOA6IVCxmj4xgwKl+8DDuhsPr1UPPTWBkqyp+On1x2qOJInQ3fUkbx3J9Ys0+ULuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIZxprUU9FGxH1uqvyKjqOaRvOEcFLn5An2xbFc20MM=;
 b=afpmJxKr5LpWLEoAM0BNKf8oWgPX9SHFkrn+s7RG1NW4fXWKH32X3nuTX7zIAUAEn5wyhD5zBTw9zCglIG6is2K4mYheB5bgAEABi2HHQDPSOAp+wHRodUlK4Fav4CWM2/9OjBvXf2nMxbXvwYApD9D6rwq4VP7O7keVgHcLoYcmVdPvZfi1VlwwsHUETN4QJYpjFiMcUjEbkPK9I+W8+uO5AlBITqsLqNFxCB+yRFzw3f387PAeqVm9jk3cMSEy2LDtzz1Z3Gt2yY0zMUa3gcFRJemnuPDcp9aJbgcv3TlVtWpfUm0nqTphdeeMudnNjAKtcJ4QRWKZDHe8mtewzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIZxprUU9FGxH1uqvyKjqOaRvOEcFLn5An2xbFc20MM=;
 b=AGhVYdBKb6a0S55i/Wgj7xwlK6ki6V6WtG07sRWZAbxOBgHeYk7rzJEBorxiqXe4R374azr951zkxKlZy71l024Rh6M9lf5GTMHFkCDC1dGH8VwdSkfD7PBzev82BUQeerdxYrwWLNKj6kaF3R53wrgXE1eblx3WmFE/znls2kY=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SA1PR10MB7853.namprd10.prod.outlook.com (2603:10b6:806:3ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 17:57:32 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 17:57:32 +0000
Date: Wed, 6 Aug 2025 13:57:29 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Fix tstring_ternary_nested .r file
Message-ID: <aJOXiVvp+P+Q7nGD@oracle.com>
References: <20250805184350.18391-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805184350.18391-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:208:36e::25) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SA1PR10MB7853:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b87015f-217d-4aec-bc26-08ddd512b797
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JODQSc77/QWlXV3oeEEngPFaZN2r8yBAkamwLvbsuoDmis74DDnASg+gq16E?=
 =?us-ascii?Q?UejHDKVPod6AuAN5spBQbpSQAGOuwObNMd7aZ8DbTgwT4+QcxlR0hW+LekFs?=
 =?us-ascii?Q?Afq2ccLad2oH1AfFBJKEGZF0t5ucJj2NCSRBdOxN3o9xajyRhHAwDJ8Wf93Z?=
 =?us-ascii?Q?yckuTYm7dTF2OSzAvcyMWEAyiKUzqjlwEcBWo8/k3pWE9yDUbQ0/tGRo091R?=
 =?us-ascii?Q?bmg066NmKLAImQ6FgZvkDMplaTKsZBJ7zPgwQ6PrjqvQRMYVNa/yImV9H6+N?=
 =?us-ascii?Q?U/rXyk5ADa1hiY7c5SI4M4Gz3qwMdZoJonumdOSLDWcic9LHF8LRBrqgNbef?=
 =?us-ascii?Q?7dv4MEB9IWIcd9cMxERbkZEJu6ta6uudRBKVZ2dLDkDtCIe/1fSKzp+whqAY?=
 =?us-ascii?Q?39rbaP7112G4YQw0awpgjUzn0C/afJYbV2pe8CZZX49CvziL/IU/B6Wy1FsR?=
 =?us-ascii?Q?QOy7xRnMSGpqALw+p0uvGRJqq3wcLEeTDsodC0broOOZTuOj7iQlKkBWpJAR?=
 =?us-ascii?Q?hCi85VjPEfbe1Gfv1l+2kWUNEcyLy58MEN+16D25LxmmwUiU4Ibx9fopaNIE?=
 =?us-ascii?Q?w/1QbuBWQzIFG+2pwq5TOQ7aqy1vKiEv3q2DpRT7xTNdhpgD+nytg2V10wpa?=
 =?us-ascii?Q?HVt8bfpfSNg+EETQWBhqo/OKOSm/vq+/BGh4YoTVFR9b8Wp0jxxuTn8K0mwu?=
 =?us-ascii?Q?2sKfpleRMaiEA+dsyCMIh6zpUWHKAfEx4W1GNaG+NFIWWUeOSylnsCri4V2X?=
 =?us-ascii?Q?3mQDDUwz6MhRs0/Z/3TWm9yxV23fJdjZQXf75PBX0Ppht6Kb80jdKepdlTc7?=
 =?us-ascii?Q?igVp/uR8xFkNraCj/WJezdOb1K7DucBPX6VA5Yk1AkBkA2n/pQd5k4UPZlrf?=
 =?us-ascii?Q?8HRCZ0YXioQ2Da5iY/zJJegAbDC9CAO2/6iBLZ4iOzLSEIC29y1uag7B9tM+?=
 =?us-ascii?Q?bVLqOSYA2Gh0FIC7eCWykGs6HPrbrR1kV1gkoWeOxpAH/Qym8GlcgJjDI5Ms?=
 =?us-ascii?Q?xSnVgEnbCXO8he0BbEw4p47s3LSmunQXUgb8Fch6VWZApYtODcPGO2xlWFLm?=
 =?us-ascii?Q?9Pvd/JPjtqhuWfEyUZ1lDYOXY5qft+iuUQdVFTR7pyr8klpzs8dtcaepZdxD?=
 =?us-ascii?Q?sD6noB75aQ8PQI8yK5KMv3HR5MT5QV044lguh/Xb/tb8SpIlwyjGk+tlM8Ue?=
 =?us-ascii?Q?f8yFTSHA8l6nE8w17harUwRMaVq5OMI9gWVkU+2Y/2JCZqUOJwlHOHh2FF7O?=
 =?us-ascii?Q?9kdJC2qOtWSeR7RULGu20u/PznzkcKNvTcl5WNies52cTByPkr3fBhidbHaa?=
 =?us-ascii?Q?WWagiGHuSAfbda/9aR9LsjMGgqF53Uq6tjYtJppIwt7tIQd0g89JkeSwy5B+?=
 =?us-ascii?Q?0KSuYkdugFvC8QoYs5UuBVC174s/WFmahq8on8r7T2ngyLC76cYjpvC24zI2?=
 =?us-ascii?Q?CgBPUpBaqHI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cecqJDR5ZxJMJaroLxXmxG/KUObeM9J5hIp1tc+f+0dj3Tl7AKWYpU7WtiiG?=
 =?us-ascii?Q?aXUd67goog4LSCr4QbOl26Vm2YJYRE+UYEhONTAZhZxxg7IYf9TtT0ph44Fc?=
 =?us-ascii?Q?41b8BdCpdSFGDaZoIVLurWjD+xlUKG6DKJyitz3F1PlYTs625+xaNb7oz5Z5?=
 =?us-ascii?Q?i//ycsBil45cCF7A5pQ8nQH3NlPkD2WjkOzGTU3Qxq7eB2FXwsL2cTcW/tl5?=
 =?us-ascii?Q?Ld/CcNmY0FbVw43NYG+c7fm5AXm6p2rXx679NzSIu5zU+Lg65IF4U+3kH5pM?=
 =?us-ascii?Q?EYNSGGFkGki3CjoNiInWyFhON5MFkRK7Ho/K1zjVjhBhS5JYGBsx4ZUniSg4?=
 =?us-ascii?Q?aZUNbfdKsTV9ErDoqjW9hEl6Og5kZFKGkdlTdhDAvH4SuUHsk2Sl+iL6sArg?=
 =?us-ascii?Q?aBJ5kxGbjOBEFTZ6nni84aeIZxKrH2leD/VXbI7QZ3s74yFocmTl8bZUHbOC?=
 =?us-ascii?Q?BdcPFuyJFMjKMiYQJmaZzwVrffxtW01bVMPi04nn0Du3YgiguCR+IeEhtEPA?=
 =?us-ascii?Q?ygdu0/cJgrUoM1VnOv+j8WkSRMYyPWA8K2H3CdTuE3ZlWx4ZcrUYpW3Xkmij?=
 =?us-ascii?Q?uGbut4mj18Ux4oBez/JnajM7aESrxIQDnbRN1u7lVq5z6xpV70URm54Ar8sI?=
 =?us-ascii?Q?USfsB/QMiXVyjPVjnSX/b8WVgAlvQzR8GJxuSvAC7r9SEBg8SHA/lPCH5iKt?=
 =?us-ascii?Q?5siOccKUZZx1UCS8XwKgXXmYAxGe8cgbLllggUWVWsZNgfD5DgAsBtPo827C?=
 =?us-ascii?Q?5sGGg6ucyqPaeHekNtWu4poHzr45EIm+OxRY69LxMa6KnCULkBjmFi+FlAzP?=
 =?us-ascii?Q?Mz9QOhPPhu1hZwYqyD/mWRgWUR9ypOIiko6vLJTYLKcb1n2W0FWpQeYiPInJ?=
 =?us-ascii?Q?fAZY+eEj/+LzoNbaXZU4tEdapoI7LANasauFGAMP4eYohomqsGx+eBYNMuTt?=
 =?us-ascii?Q?8lU72Lnd+fGziY8Boz3Y6nfoqPXGpuGLdaop6//p5+jKmKIDsnVA1jX08oIJ?=
 =?us-ascii?Q?W8kzagrFM9hdKvLwQEEOiTLu2t7I5ioshqeoKrVzZX28KjUM6MlrDNKxRtYW?=
 =?us-ascii?Q?InA4U8+dvuxgrdBWDVB8nQiMKLUS+KViKTf+wpGc2XNZf6P3r6bBd6bUdfkU?=
 =?us-ascii?Q?G+qd93wxHgmmnGztQVJO2M/kxntul8IWp2hPiOjM3uQy36oDEEBCuFIlcof8?=
 =?us-ascii?Q?YbWJJBzDGD11p1Uwi+fjZ3huvC0wzlrLHX28fgAABTX8/supghG/oWu3/7SX?=
 =?us-ascii?Q?rhj1igVDRe3Y/WYO4V43rPvJUm01OsFTXHfmlKgf7wAl0hDpLs4d7bGnyLwZ?=
 =?us-ascii?Q?UPl7ASYIHazA7ga5YlGaIMiDeC6QJlWMMPmjjYmlPqmp7S+1wBp2Q/ViorJj?=
 =?us-ascii?Q?cP1FXnGO9MBTGKP3p5V0FVlM8vYaJ6U0EZ89H054ZUquPCkKqR+Kn/xOGs00?=
 =?us-ascii?Q?MWXVLI/v6ndPpM1qP2gFHfUvG/IidYWdmiKVS/t7sjEnnc62beFfHmYOWeAj?=
 =?us-ascii?Q?JrpuK8Ng+/tZEfuo0idbis3XywX7QYPqJr6aXvQL0WgiScCboqajQnQ5KgUZ?=
 =?us-ascii?Q?kynEp2zTxjOJU9QksulgONYv/I61YZZu7B3kBJFQ7VclKgSrRfDahA4vkq5K?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5gR0li9ueueBr3BJHGJJYiycY33J/q87+gO7XRMEmw7Jo4xBAI1sCIIw3tLXwg1rSiqyqxjXXf4Jqsk1LRixpUzHRZIAO4sIOHFesLoMG8HiO+JhRUzJJuK9x3h/1zLlF6thAPZkO6GqJR2I/PDC1aTUJbQ5mZGsn6l76OSj9v+N3eCg26T0eyTg3ypL8VVctYu2amFOF6wXY/sJapnd+36+xlBu8IGcgHmyCjwzEEVbewr1x6JO6Uu3uo+m2SpQWLZ5xyG4HzRFmL3hhMov52RiUWd958j4rafaQFpJwnJafndWwcqWKvn7juYJXkVPXwlXct6UIqfF9z3hWSqY1YB3zjNFQrjdkcjBn5F/+68ErZ75yYHaRQNjj6gMLcwPUq1Y6Uf8kFgxD9i2vYQg2crjxNfhXog1thCbYe1RorialTEqMj9kcuZe5gHsXmqNj0ztrb7jVFqXPwZq94J1ClvyC9NBzs6fMz3cte0ayIzI3cXDoUX8iR7mLtBZk0f1VMs/HRnmlqbqVHajWqcGkcmP5l5UNnJ8uqilQD3KJHarrJRfIY3d0hbffQW6ik2/SDrqgrtaFcqlbtQeLw4hVZrZLGljjhYEO3o1XoomBHM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b87015f-217d-4aec-bc26-08ddd512b797
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 17:57:32.4105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jNwgbXQL4+kVa+RyM3J26/rRQC4hhYSGI1W9P/1RQTDu+mhbmrNCHTCXUmSUdbT1zwe6j7feaeqFfIKjowHNpbLa+bLtKcZ6CO6XshqiEsA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7853
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508060117
X-Proofpoint-ORIG-GUID: y_tbZs2E-14TvkazcoEu5xdsw_P0xM24
X-Proofpoint-GUID: y_tbZs2E-14TvkazcoEu5xdsw_P0xM24
X-Authority-Analysis: v=2.4 cv=QORoRhLL c=1 sm=1 tr=0 ts=68939792 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=ZTxCmJYcA-zpfo3CqXcA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12069
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDExNyBTYWx0ZWRfXwrz19nB7o4jW
 e3GuGdh5N9/gzIN5h+Tye07sCQ2ifgWALM8kndD21o3G87b5hVQ4BjnsLYyLCuKpCBi3o3gjbxP
 Wv+iTrFkE7mDQTX2IOMUoq6VYiQIOqkNf3hDGFiU6wme4agNf9GKiaRg4BO3Yk560GQ2dYYAOjQ
 bjv/TkWl7Dr6tZG4jnaFqfkFnOHEPJ9/sE40dphOfF7D6sz7WhhA3j2buzzfNbhIMoYJrtcHkrQ
 /bMJA9v2CoYzPvgCwQRUGHF2XNpTBxkNQzDT5mAz19Q6fFtv6JvjW71MxAYp9EHSJfhke2LEYzZ
 pditiNMMPDDO2fBKZmoQCbiaH1v80i1UFMUZzlPTPwNsyPIUE/8/e6Ie8m9Nn3KBEaM7nuVBWim
 /uc5cBzcXU6OrGgdbuhP6dr+h/xjdCa5CUKXs8aBKsSBbA528appKyUkYdCT0UYlkcdnYV4I

On Tue, Aug 05, 2025 at 02:43:50PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> In commit 5b20226bc ("cg: optimize ternary expressions for strings"),
> new tests were added.  Fix the apparent typo that is in one of them.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

Thank you for fixing my mistake.

> ---
>  test/unittest/codegen/tst.tstring_ternary_nested.r | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/test/unittest/codegen/tst.tstring_ternary_nested.r b/test/unittest/codegen/tst.tstring_ternary_nested.r
> index 9c70ea196..1ab56ba84 100644
> --- a/test/unittest/codegen/tst.tstring_ternary_nested.r
> +++ b/test/unittest/codegen/tst.tstring_ternary_nested.r
> @@ -1 +1 @@
> -ucwxyz
> +uvwxyz
> -- 
> 2.43.5
> 
