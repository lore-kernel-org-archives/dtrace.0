Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6191B0F09
	for <dtrace@lists.linux.dev>; Tue,  3 Dec 2024 20:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733257897; cv=fail; b=lIYlTHAlXPstXWP/WHPGz10oDMkTbuzjqW8/lOhdyHl6gtTUliqGrayPztWH5O59nJxUBxPgDFLFUtOJ5qCH7dCR7civp/iCH1SUD003uJlwblUmH7TvquU/wqYI51vOIaT+vg8EQtRajSG9hLpOoqHPAvDNMSbvId03c6+uNxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733257897; c=relaxed/simple;
	bh=P0CW/EhRpo+XF2/wBIbbInKgAL9/N0ugofQPzBZDnis=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=SFj47ykouyZ8xBHbcMmLxlWQ/w/3e13X+zaZRW+0mlkjqFfh2/oeUKYWxexDkKnXC20ISGiP66+7gOnSDVOwYVtCrjn84ELMkkz4uFeI91YSDvg7VWkqxXVj40MyKZVq7pVkulduCwqhCbw3OQ1cHMe40fL9dbTuEL9pCVNNSjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Zj+4PtWo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=abBcsNOz; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Zj+4PtWo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="abBcsNOz"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3KBpq6019273
	for <dtrace@lists.linux.dev>; Tue, 3 Dec 2024 20:31:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=P0CW/EhRpo+XF2/wBI
	bbInKgAL9/N0ugofQPzBZDnis=; b=Zj+4PtWoXlNHCfgXKC2INbH9k2jlzxWqnu
	Ay7ZF77c8r6ze9c5s24FL2zq19Z72s1cfeY6rUhx0xxRbQgiCvJ0VPnneyqiDgR+
	AgGcSQwS/0JTVdZfN6N39JJB6ujI0IxPkB9L1kz449Tz200wT4TIKVDIsKHtKSTw
	61JTfZwmNsXyQVThbUiw6wBMCLANnjJM1XmPTZYgNhbOoV4X0PQpbfitRafb3Z71
	gIMY7nRTd0Jxgk+wwAsvSOvebtjLW5Ki8QRIPl1m4Ai7vZP//oFJF5sOrvutT4HW
	Knr/klmq9J84qU7FPVV4mYvtGdCm/jt1SgqSsUIGRCV+t8hQNlxw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437sg26yx2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Dec 2024 20:31:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3JE7lQ032675
	for <dtrace@lists.linux.dev>; Tue, 3 Dec 2024 20:31:32 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 437s58g07n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Dec 2024 20:31:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=POj8X+WhqKvU6azZXJ+9fsl5rPKuDIsyF/v9cy0hDfOuNouDvZFKaRoY028x+0ufTAmNSud7ZZQ09bhvsnrcPfm05cpQpOG1nCPHsW0L8thEA3PUNq5U+V9hhtHrlpXNwk2MPTNQ5+UX/HV+HbXI8eEOMeMqkxk4TTj4bM3IrmWVpT9j6LuawC+tt6FdZwpP+JeWHu7e3gyBL4KCK+6FqbqlNNV+CZ9y9QY4/Vws4R95r+BxSCk9n76lXDul8ySLWPiRaB5QAyX/jamNfJ19AUUBCLxXHPPo4/IdVg7O01M6ZxP+6CQAA7IfkP2ZDrGnnwkVY2oTy329ivWhzUSE6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0CW/EhRpo+XF2/wBIbbInKgAL9/N0ugofQPzBZDnis=;
 b=EZauiXZy8u5X+CGuZulQ0GK+pxiK/05GL5HLzEkow9RFyF9A0xspHDb3z3UBk/HN1ndao1tEdn48w0KHUXEJQzyBOaGh7NdYH0EHo8km1jLjOyEUPNRFK6YVIiZfVYlfAnfbI4OtMZ7gEkhXVTiukMVqRkTNHbvCGkhUKCUCeVsvhoqzzh6EkcV6AjwfbM7Qtu48EdlB6ohxsV9bxEoS7xP6koaRBI/fmmPNdwL7bsinVA6xz+hyAq6rbatMMylu4O1+hoT66xw46StdtktlPBdaa98f9u1Yc8mDuzeQ0NB+X55nflYWico1Q5OAT4Liq2Jt4EmK+ig8XlNRRZ7GGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0CW/EhRpo+XF2/wBIbbInKgAL9/N0ugofQPzBZDnis=;
 b=abBcsNOzurAqyaDLuFOea3rU+30luR/nEgtekGhWVuGRVAAqXBYervYP/Is9Vfi3KAyOUo06ulFFCOj57fLyqXiqide01OGPsfxmFKE7QeOHbLDfvSgZf7Ty3sOVURVD27SuAY3Y7OfEdcUJ3gif+ZH84JjaAawnyji51d2Uzcw=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by LV8PR10MB7823.namprd10.prod.outlook.com (2603:10b6:408:1ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 20:31:29 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%3]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 20:31:29 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] test: Retry umount if necessary
References: <20241203201601.28787-1-eugene.loh@oracle.com>
Emacs: because extension languages should come with the editor built in.
Date: Tue, 03 Dec 2024 20:31:26 +0000
In-Reply-To: <20241203201601.28787-1-eugene.loh@oracle.com> (eugene loh's
	message of "Tue, 3 Dec 2024 15:16:01 -0500")
Message-ID: <87frn4y0dd.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0140.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::19) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|LV8PR10MB7823:EE_
X-MS-Office365-Filtering-Correlation-Id: 51fbf2ad-7f98-4a5a-86ae-08dd13d97763
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ViW82hSwrEegYXwBqmGHb780Hp2GDqBNmaDGYaeY5UJjQ8bN575F4CWJb5ba?=
 =?us-ascii?Q?Di0HlSAMuX//+CbxkKYegEf7nU+YS1DlCnzZih92gkM8yPdkaClEoGKUFiDq?=
 =?us-ascii?Q?ScC0QjuTc2zYDhIBLCrOEk2VmEY7CeqToi85QxNDQy0kp1G2fmAFgDfH/lBm?=
 =?us-ascii?Q?Qn1t7YgeCZ123FX+KHHk6ZZi4guxTMyZxeLEnZ7M9O09sYkcEnh898ChakaA?=
 =?us-ascii?Q?gFCR27ITJVqCCbAv9k/vXm6OTR6Ke5ue2xGYpDXzKFJb2SBghB/e72Ly6Ask?=
 =?us-ascii?Q?RfVyLRjWAARQEKmCWtj6FH3qLbhYvk4QWHzLTLMd3fQB2F63z8MYwJHyU2IP?=
 =?us-ascii?Q?2mJa1/Vaeqbjetb9oSpBzsYAg+0ZR2729+DDkG9om/7Ul6YBWtsZzgKZWwot?=
 =?us-ascii?Q?HVDMXtlMQ6KhggyyFyu8U5BbYyEu6N2pLVQ0grgT56krwzN+AOjVTIkUviUB?=
 =?us-ascii?Q?T2NaGXQtRDOJQlOCcrqdqTNF8quFeqXRT4l0yfgjHnBr6420C5QkSPJ9BxrC?=
 =?us-ascii?Q?s1lDeLqruJFZ5d6FpZF0KNy7g6hITSM/hwiemCbBlU+FWMxtkt0a4tI5uStP?=
 =?us-ascii?Q?k+eTbKNCBBtF29uRJK8CuTxMfaJWyR1yKG2CMMNHSDwRnhicZYmuZR5/nYwe?=
 =?us-ascii?Q?sn70TuscAp+7aztH0iv/J3+Afn4ZEkBIfPs0w7fT/y0bbO2QXJzhEA3Gzrm2?=
 =?us-ascii?Q?74eLQoyXMUHp5JmHEVV0qxVtAC/qS/QsDc+AKoBqvRJaBmCK6iwg8xKlJmmb?=
 =?us-ascii?Q?taM+nZMpnNd/B5bCdLNCEvm1kao1Ghu8fW6A5tUPXqCNBY72QK2PGs46tzFP?=
 =?us-ascii?Q?Q+FzCzulkA3n2ifZdIMSHfwWTtSCHUgYNjAofN0RDtEqTmCB5Dy9lcBK7GB7?=
 =?us-ascii?Q?YrgLspkj3zjBb1born9PIb0pxTVtGlKksmuArE3XvMLRJjFfKgXo2aWZd8mi?=
 =?us-ascii?Q?BBUuN6InbBH+HrEyJQ2zMNKsKEZAhtKCxorwt+h6fdxinQzFfX1WvU9r71Ug?=
 =?us-ascii?Q?tfOLYAuAhebxcp/CuU/MICjTccadom8u8fvGo8J369VFex3bpml7d/gB+L4c?=
 =?us-ascii?Q?/U0mfE+Xp2iSvZYyYYKl+1NX534al5Jk4ipGNO0IhVUHWoPXxtPXlSok7UCW?=
 =?us-ascii?Q?oRExJZTdLiD9r0PUdr3qYwRtz8Vn0x80PxR9x8HsPtNeOUg7PyV+pSFs7s+c?=
 =?us-ascii?Q?AohzPn1Cg6rJwJiSMbjSOoKcmttWWvXemzsONFh0s7q1OCPd3t5+02EEpSB3?=
 =?us-ascii?Q?AjMJzcWG0NYagrwn8Ey7t34XTbHv4W/0uxpefkf+hW+EyzUPt+3jKRPD9Ty7?=
 =?us-ascii?Q?0l5JbjID3yhR6wLabdQ4SljlmS2sm54VuAw5J5BSA5dPNg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0x9LK7nz6XaamYxkRmtGqdqmEhpBB7aAhDW148Yh/nWWPWfgx232poeWyjUL?=
 =?us-ascii?Q?li85w6536BBS2BrZWLTqL5C43j0rQLJDGYpdUFjVaHxsX/iqtfw/vxBwJdhM?=
 =?us-ascii?Q?Q1enAlzDtJaSaehVMVueypmSPmZqzPOB2mVYc8BSGpcjzXxFeQl/+b0jBEfO?=
 =?us-ascii?Q?kYOqotQr8B+cmWzF+7BXEjvEnUnq7/XDbifG29BrSAJI1vD6JYe8FwqZA0Q4?=
 =?us-ascii?Q?qJLQotDKTFYmIheV3YXJJU7wgtNI1BnC9aqMJpWE6LnoEcWkbVtEQy/CAlOh?=
 =?us-ascii?Q?pxJ7nNdGZbEsXetIz5uIb/NMQX+/fqk6Zkzv3S9xU0DQr8YpSZCGxUTYZ9cS?=
 =?us-ascii?Q?WDlee+iRXrZx/3C69oJY8rEJTYfyC+nAwsnOronFje4N/2LIXlfR1TW3uiny?=
 =?us-ascii?Q?at8VPc+I5G4s/NGhF5Utmd3CURK2PdqBdXmDl8YLlUiMRmZkDSBKiJyjE7df?=
 =?us-ascii?Q?DJ+GxSBLy0E3S8qhIxJdcIxzOecWCAVWD8/eZIXETnAcDijWBaPsK4VnG7u2?=
 =?us-ascii?Q?VA/4mUIEXp1j7Dilsbj4T/pUxvj7SpIe415QAh+cTMqgnycAIe9ujBS0GuQf?=
 =?us-ascii?Q?4JL6xnb3hN+LKLvxvdPx2wVUXqYMQyuikejjDKr3kLJMxaP4LYRG1SmrB1gM?=
 =?us-ascii?Q?tMk4Q3hso8/KR3Wh4sLlamRWvFO/gpZ3mjfuF2xRUSgKN7fUowZBKXL2ByJw?=
 =?us-ascii?Q?uURNwYWzQBKzMi6w7QinBzOha8dzlD1hCjBF1NUVIFq2whwV7hoDllutm7k/?=
 =?us-ascii?Q?AI+k0HULdZFsnS/lQfpNvvuAOmmkKAOsqrf4D8HKVsn3j4XR5gB15ZMs8Xxz?=
 =?us-ascii?Q?WRCiPE05CpcCmYh0+8GM6GFVoGTFDVCfNxgaSbWFVW42Fkv2CRHayusJiJsv?=
 =?us-ascii?Q?Gx5YfC+PxI+pM2YDFePvHXEkeXrNJkvuPH7pHpELw/NBSfTDOBb7inLE5lY6?=
 =?us-ascii?Q?rIjj5aOj5HDWnQ19ira8UBnyC+GcxrEC36F1k3nRyR8pPqv7e8wBf/uXIh03?=
 =?us-ascii?Q?UmGON5n+UC/aCyQgXMWEghPcMYsNkQEBwSMCxtcNFV4zfZ3oJgZvF5xKg+2Q?=
 =?us-ascii?Q?T6cSeGtAIvpmYhXfTrJ6h3/S4ct1TBTiZ3JREyRjBQM+Zum/764hyqxNwAZi?=
 =?us-ascii?Q?nOmcSBJD2izI8Z6/4ftcwLDPmAPEqxDnNGWlPD+jDDKqbsSKAdzeD7nwMGrD?=
 =?us-ascii?Q?NcJyEEkiR+r6POT50cwM5d1gMHAzXTO4WKgXJIYwz6hicIjC/wyj3wVQu3bv?=
 =?us-ascii?Q?CXG2CjCm95fl7VetxWjW19yYkOkVGPpVg/XpG7bxXtzdfHI4DRMfxpRrXW4l?=
 =?us-ascii?Q?DStavV2IGC6Lsml+jcmrx0CFQR2ZelhG3Uat1GlXxPH6KjSAdnJmntK1RnZv?=
 =?us-ascii?Q?dhgutPB+C/3gTEqy175tKCHLaEpl6yG91JP4dfNa9yN0R6Z2zKttia/PrhR3?=
 =?us-ascii?Q?Diw6eoPaHe/rvk4EfQ2uKO3z78Q0AP3IyN71Gn/A7TWZt8yAzdVEcAV+fZPm?=
 =?us-ascii?Q?H88H6l6j4ivTqACU7DfR3DJq8dYsJDGoF29VK6S9A5iv8q2Vex053AEfF5BF?=
 =?us-ascii?Q?/L17n0Yaj4XfDk5Hpfc2ze5U3P3m+o0kxGpa3Vca8poRQ97nsrWS3a1yUxTO?=
 =?us-ascii?Q?ow=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mTVkwWIxlOD9migYsHZZ0UvwmYx/qN+U/OkqTUwnHUuOc4LLY0YHeEYrTJyOxltf64kmXXz/dg58QoAXPqpWh127Y/doN4Z+VXbChz1QXHYFQ5wkpmM3BsBIdRz5nQ653FIO8xUAJVjLCsAmrgOUjyzn4HZM387BqQ7Ztpm6+mz8sVkRqL9GbQv8X/euYFJaHNu7ABBwj2uj9FwkcxBlGT0TgcOk6LNvK/0UpDMAlCFIn79TdC+Opl/I4Q7U6nzrk3Xs/vbQjibjIwWJP47klqqj+V5J0BTXjcol71FFFuXd6MWuDfBL0KSiWTXgddg2fHO6wIjKl55uXxvy4E43Djx3kqNrt4WkkCJsJNcKciARyClMFPqwSSdkogxAYVjZbjNCRDPz6eX9orI0OqLeEKcJJI42iIttTmtvriXBvBtZq7gJ+03Z/OqcWEoExO27zR7htX4BZoH9mZlb9v7jx9wVDS65QVTGFJahNbV0VSoxZsmTbXcvl6gEPtt7wRGUALWZd/AuOZbF4mOETOhs0sFBRvsMWQrA7B6T0NQ62a1JEWcmwP/lUHtYXDP8STbkHmQRZpQTxoeR/9lvF1GJQBu6VY9kjJoPZYQCE9mfw28=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51fbf2ad-7f98-4a5a-86ae-08dd13d97763
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 20:31:28.9505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DyBbtn5uqiKEItXmH4A1WsF9Dc85YMd8IVia6CzUeeqSsJ8OhG/cCdgkMsbp2K7Jjj5qjyeRp6qtX1GaVhJtVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7823
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-03_08,2024-12-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412030169
X-Proofpoint-ORIG-GUID: eWTZEIWi3-R_pkpKZyqttxYVBYWNKQol
X-Proofpoint-GUID: eWTZEIWi3-R_pkpKZyqttxYVBYWNKQol

On 3 Dec 2024, eugene loh said:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> The io tests tst.local.sh and tst.wait.sh fail with some frequency,
> with error messages like "umount: $iodir: target is busy."

Can you just do a umount -l, then? The only caveat is that while this
will disconnect the mount from the mount tree immediately, the *actual
umount* might happen arbitrarily later -- is that a problem?
