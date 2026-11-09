Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794255060;
	b=k1RL3sqoJ272XnDT94gByqo4QI3Mucx42eiyyXBRVaZpALng9R4Syq8Jc/EvlxLG0koX
	 TiUrIxBH91zM4h4j8FphR2ByvGe43gTqgR7SIffuaIGRsnsSafdssdAA5v5aha3ZjFuMA
	 GiZUbYYXRfFS3l2xlsys34H5VjG3BX1vUq4iYPsZIpujgEIg8CFRkxoiLvmvgpSTqZCKs
	 LRKdHD0kmOSwJJmCJtPwnQSy8OYclDel5VrBqpX9ZsyoHi6pEjbgsddaWnB8NdTm+6rIm
	 ROXNjh62NtJleGFNT04TcaR1fqpIrALfJZoJoJrPYtULgn/1pQKYe/tj+nbrHTSg2KA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794255060;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Subject:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID;
	bh=r2OaLKuID3RskLkxT195kD6QFP7g3mld6rWh6+ydpnI=;
	b=YviYJAzh+oF8ZBdFwQvGA3KdMXuJtaDaWBYZh3hpPl3oRY0uusc5N/QXXE3cc4/SgI1g
	 DKOc5I3mPcFjXl0zHRFFOyVnMZA2WwVxNw9zz800mtpR3Z7KCkRgES/CdtMOSugVXIcXT
	 i7g71L8flLKPxEVwKysMfUr94BBqMRqsji6d8zArf04D9QkAjWevmEbZoabsi8nqf+zSM
	 RjowDwScAFKoPdNLf5jefd7A+a3XPP8x/00//a/y1WSk6SvQ6i2fHvNKkJ316iA/gbpVl
	 mgqTn6+Lba6EsneDQLq3HKo1VpqzZqE9wIv5mdOSBJHBbq8MrALeLM7On9itEI55EgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=ZJ5eDAhn;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=YaayDa2E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFB1606A31C
	for <dtrace@lists.linux.dev>; Mon,  9 Nov 2026 20:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AFB1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=ZJ5eDAhn;
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=YaayDa2E
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9EH8dv1240670
	for <dtrace@lists.linux.dev>; Mon, 9 Nov 2026 20:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=r2OaLKuID3RskLkxT195kD6QFP7g3mld6rWh6+ydpnI=; b=
	ZJ5eDAhnB5Gl+elCrnIgOXGcthJZAozaGsBXzWPeIOuX9t+EegKFHG/O3gLvmYrA
	J0K9azK8isoBb2MGhryzgEfZa4iYSboKUcGPLeQmuu58WD8FnaqHXEtaFz3Vjnmk
	DVXqH98Vn9pKqWM8kkem/Fw96xXgLZ+55qCGDMZRv4EkexV7QCct+qnX4hgPb9Qi
	JH/6/UOSmE2ZpYd99b+ZDHFiQIKs13lrsZQ+3MpvSTpJ8JacKeqmKj7fB8MbDG6L
	cI68x8NZ644o69Jirjt8pRhqbjK3jodpCli6E8Jr4LFRYoAl6H7aDoCah21KCBlV
	hKwAruY04nW+5aRVGq0Gow==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hstdbk1w7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Nov 2026 20:10:59 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9Jusv22025257
	for <dtrace@lists.linux.dev>; Mon, 9 Nov 2026 20:10:58 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010069.outbound.protection.outlook.com [52.101.56.69])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4hugvus24b-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Mon, 09 Nov 2026 20:10:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPqYfaDM+lGtIWS4AGyHRXRWwpibYJxdL8aIKCxwximU8jMeP6VXlvIPjAhaqbspTWmvEKTP92iUsKd0DNwapo0sB+dQq/p8VPC6e819SKXBUo95ZiObGHZmY8i5svZuSskNyOcqv0cdBClSrzgBBaZIrS6zblifyjdJIiMG15FrsHMdaNROqvyRr7DyqyazsTsQQafUwtHGltAxJK5iAuiyC97jjDyX91VJPsUWu+vPeulPG/TNgaB9jR1aSrVYNBC4zSCf+whtU7zQKpcxXbT1CVXFfweNjV6dhx27XBjM7+XDAnSi4+jcRD7Lr+RJM4cfoVXo34mw65c8eWc/CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2OaLKuID3RskLkxT195kD6QFP7g3mld6rWh6+ydpnI=;
 b=modjUD0AeVhF+8RLANFmGA3QrY/kPq2Uc+uQeg79wsbTq823AcYWrSS0QRunbluSlwvC5pTR7Uq17KvcAQc/UXhzrECUP0uAK1+cfK6wQz+OZLXJgVFksbTSocLTjRVd1Ah8kzWnz1d1nl5IQtCknGefChEqgKB0HU3tvLit3p/UCgaiojSxtQ0TYkL5HCdnYHrkoJW6e4fXSObzy8CnJKhgK1b7wtKHkXi/OaZ7ax3P5oJ8nqMqLL2iBU72erlgbhAvQ9QPtRIbkoza9i3d3eFhuYYBey4Z0nY31m3EiFt3bmgDdFhroVEG7t6yfgba1wZiC/X/DwCpO9D7XSg1tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2OaLKuID3RskLkxT195kD6QFP7g3mld6rWh6+ydpnI=;
 b=YaayDa2EnNm3+Q1QalCDXiKTiHT09xDkgbzLcAclfwJ3TyDFBwQPeUI7fcRquJiHwuOJHJ9Vg+0b8+VreyiKPzn2glLcyPJO+kSPVGYPsPytrfcT6cmjYfZW3MW5EX/NYsBPUTFN2wQ/3wMckp/bCMj1F0G4beVmRmmTTCQbvy4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by CY8PR10MB7171.namprd10.prod.outlook.com (2603:10b6:930:75::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 20:10:55 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 20:10:55 +0000
Date: Mon, 09 Nov 2026 20:09:14 +0000
Message-ID: <41d2adfe9a6f03ad47bd6994c12dc73e@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/4] bpf, fbt: implement a fallback in case
 bpf_get_func_ret() is not supported
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0059.namprd07.prod.outlook.com
 (2603:10b6:510:e::34) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|CY8PR10MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c2149fb-5ed4-4e34-2676-08df3e9d8fb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|6133799003|10067099003|261102123227099003|261022105027099003|261026140227099003|261022075727099003|56012099006|261021123027099003|261021121427099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	oANGrdJ3Hwo8r4aaWbNRVkfyVgYFAa9LP0ha+90d7IJn7cLwb7Twgjm+xm3GTxCM5tCxUuQyPoy1VFHyAFwX/x2z0dXejPtLhxhr6CLZZxdXEFbD+CP6BFC5kbGCQ4tzKQR6QJLQJvUpSiAFkVEf0Qw4zl8OVxIkb9wyldEk8U3IICTu389g39VqyN1q74FM0yt9Qrwv+px6a0TZZoyRky94ppHvTS6K9lZ8oUrrFKW5nr1nzm4PJILKxz4ctE3E1YVWuOayJMm8GSiyI9w633QO+9gCODAh6t/eDgnr+r10tNiblpeJZCf/z6sq6gNVWxeXw6uhmHzarF0h2EjGvgdjQcojHej9sCd6pUEiwboQR7onX3Eh6wzpl7KHsawZa6JxBaStdCQ802kE4oJKoSCXBBF088ccS7RdK4B0J3+8IUaD033DAr9c7OxjVrHkaZvo5y928elsQCiGlD9kN8gekcjcDS92KrhYymwHJHjOjtyGRXm9bK1Yq6jL2Z+zDF+sgidHXwC688BdRJtFBhk9Bw7XnSUaBjRdk8tc6/LYVsE2P+jBE2y6gwjqmHQsGQOTYk/Avdn2QoFxKUtlgNNOZmDHrhF+RN6Fpu7sZlAav10wJrVC33zLGC/SyXk/BhNR2CmXR8AV9rqfT8eetrf2r0ARK5MPP+wtKysXPTE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(6133799003)(10067099003)(261102123227099003)(261022105027099003)(261026140227099003)(261022075727099003)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I37WZF2yGInLAS3ySxVUFXfni0Ah5nJcKCAf1QJa8scy9w/060LB4LTgWpHC?=
 =?us-ascii?Q?PccsaLCLKRih98uBaFr4XaluWID483HlCU9Atybx7XK5ZGHgriWnxNConKkL?=
 =?us-ascii?Q?GE2g7W7f8+8xVKtej/gM1Fky1G3Hs8sdztlBt5QXv7rf2CLfSGkniCg3WWjq?=
 =?us-ascii?Q?rK8Hi5CchzgmC/FEjsWuWiYZYQpRbszrIkzMkDZvRzeAhqPrADCwHgO356aN?=
 =?us-ascii?Q?sfqYzob9Qvdfg5qB4jv+6BGiZD6chq4cvU2lu0uxu5WX6W1gd6/MHiqKU6hH?=
 =?us-ascii?Q?d+O2FI1tvv0Xn5RpQD9iTw89MKnkBFH4pwIFhif2X4LwVxR3Ku2jVri3YG5Q?=
 =?us-ascii?Q?O8kV8qitsjv/JieZG7MWHBJDbsWvpRXr4G7XCwhUiHSqEYbt1UViKSMWBDiW?=
 =?us-ascii?Q?8G/EUKkSaYXXXQXIBbE+6aeGmAyQnYYmNSZdz3LHURStGI7x6zpHuhpaMr1a?=
 =?us-ascii?Q?Oi0UKwXLc2z1W5z7jji8bYrm7gqxrXme4m0h+zEuwLn5JGtyspYKH6vD4Hhh?=
 =?us-ascii?Q?FT9QnzFO29r33v77asOEB1Xv7VIfimw2aGlF0cLw3l8X2cgosPompOGsbilG?=
 =?us-ascii?Q?15bgzPIWhBeRtwwXt9XujhFMLguS55OZcYzvf9sH4E6JAerhqtTHYLTMPtt6?=
 =?us-ascii?Q?t+6PN4UsD+Wtp7a99St2JIKqBG9DFMX/boc+YVJOdUUg/1eY4alGaU65JkEa?=
 =?us-ascii?Q?zcmfBkNdzEZx62FlEYmhgDVvly9aPpe0Pf2aVXMLTGr3WNDXgQ+Mhqpcg3hz?=
 =?us-ascii?Q?3iXk+anMtWf55F/5I9pLq4bGxICT82kb/0tRaNx4YJ6B7+jwbGmX1LQDJ8/Q?=
 =?us-ascii?Q?qZp+BswgrM668UcTXFk4z71aBZuldezZqGUFMGxlnUCqyEZn4T+9QuGMryM9?=
 =?us-ascii?Q?p3oxGCfRl8Q2roIU+MpNu+dG8bDgVEvzAySxIEEBoHS6h/GELittC0g8pUL3?=
 =?us-ascii?Q?eJ5jUwsj3ko6ZemuL5i/HVwDiMf4HcUddOPflr60Enfev0z6RjaeXU4x4AbI?=
 =?us-ascii?Q?eur1ov7SoWWIE7twZ6XxeYYUGHl4kYKWBTRosDr61dseEvgtRGxtX73L3XgV?=
 =?us-ascii?Q?GpEjdWv94uv1dqHaghlGWSf40yvrBzeehHDa4FUcIV10nztkugjOep5yJDK+?=
 =?us-ascii?Q?vJheIsJXTC0UDrAWthbq5bDwbbFfPl+M8hukUwxKHEvPgMXelNN6DCRrn8md?=
 =?us-ascii?Q?RqWqu6QeTnNWTUBOer99BBPfVSpubXpIT8C/tbaFDmBLUKbyJI2FbHNU2uDp?=
 =?us-ascii?Q?Cjp/pS1KcCBZlV+hxFLlQpLxHAb/V9vSyyYO+SD45lFQYPhiWtd4XSz0WqdC?=
 =?us-ascii?Q?XsI/3jKORnM/InFsm3AqbPO+mry8rQTfH080nN5x5QNz0O1tI71xy6uERL7C?=
 =?us-ascii?Q?3teAP61xDMZh/+OTsu8Mlbm//w8hdbq1DQVhP97cpfTEh3T/LcHFWsA4rHJH?=
 =?us-ascii?Q?9CF+CCJ3uFG94EeN+bpJ6D7xRGU6Tm/IpfO0l+F43qUhUUZVZxL8TcF0tEG2?=
 =?us-ascii?Q?Xh+nVhyWbLiyNxmg/lN7Mp0KF+qdaoJ9KQsxYRHXUEdb7xY2/pmRDEYtrmNu?=
 =?us-ascii?Q?NagArt/YYMDdsMVaiedAj4AwZJFJFCql8ublhqXQ5hr9viOn6T6SNBsUoCyq?=
 =?us-ascii?Q?1anmLmLXPA0xyF7R17H3CYArhm0UC9k28UbuxId/JYQ8x6+qSd4xFSx5pSpk?=
 =?us-ascii?Q?dUNC+TnYKWwZOWh6e4dQJdYDufV+fzrhcetWlTVem4Q6pspTYJi9gPD0+0Z2?=
 =?us-ascii?Q?4nJ0rF09HA=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	cRx2jHQEodyoLQzHsFUpU3PfEx81zyRpyxklEP6jSUsOZ2+O63vLXXy62sXw24g6MYtKe1UatxDPpoy0Ik+P5aNzxMUsl32n900JORtIKKYqKq94SNi6NW0t3mku/EAucbgBw+5bWv87U7Hni3+sc0QoRflu0l/JYfyCXBcBxfxg+nUIbP9LzdbSbB+ZCQkZw/U8bn9DZFNyx3yzcuKWwTLv/LbJeXKbgajrGnb34OivlxbQQTw0CYSm6uSUcq2UI8xUJNVAZyrmqu7eEQLzdwoM9n/TotkAq/mTAq1IpEaG5jBh4OzciPey5Y2gFs3mv6xarA7t5f+Ays2LkbyR8w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EHz8nepwaBMhIcJuAo/f8anQWtmH9ghMMJ5sQJyveGW/9cphxwzu4CIZnaYLia/yXoQCclwHO00o4dCesTzfR67pJ2UxU2jV4/swdjDlaTw+vaFoXTXrZiz2177OE10hatSrZp/7nx4XJ9xCJ7MabDI4RtHZ0YO3zdI/XgFJUP2jiriHBpEbXSR7bTkpKit2yC+i9LAZK/GiuPHsMCAjkz4J/A9k+RPSU2jb0mFhXUTmlINSybBksw58XlJD8w6vKIcZFigBQ4rpJ8VsRK/2usOzh2TJyZt2sRVS9z4NOnhWPlVeyPGlx0MCdG/ZzHyQBY2A7Em647ZEPppqqTrSqYkLvWKoqHwrNaGWQt22+lZ/mYKIp3T+IM5srfiIXqYgedZZu5LXN9QQLtVAc/gbrjGAL60xKNAblF/6dlej2svIFK1tAU76LiRBBbDl3VGZInSQTmpLWqIWByNNBY+f4A1Sp73cfPvfAgQGWppb7T3XbDLOHD2NRHJRcbIWmXR66MV9xawDf79Sk4/spNWJC5ssuL+VGRMgR8XT7xdcmIV59hR+pleXz2bCrj1K/nWxuwaj6BJEpEp06LWAutvs3ocso3EaUKmgdyv8LQdNrPo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2149fb-5ed4-4e34-2676-08df3e9d8fb4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 20:10:55.2301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1SGn33hMcUKByC0LOUS7+SN/XnFcrQJUjivCkoKIKEudLRazfov6ykRXC5k/SffHXu/LaAjgJS018+32bHCNsu1TOcI+p6L3s+8uK16/K6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7171
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090080
X-Authority-Analysis: v=2.4 cv=cfBHPXDM c=1 sm=1 tr=0 ts=6af228d3 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x4eqshVgHu-cdnggieHk:22 a=yPCof4ZbAAAA:8 a=8KnBjOXZSxCmIwT3dokA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4MCBTYWx0ZWRfX7NAWEsb1xCaD
 aNcxVLkw66Z8yx9HspwEPethrTsrDQTwo0oz8HPPCpU54uhxQHl/gP6ugapnyW9jHAkn0HT80eD
 aRAf6uLFCwpazfzJYicRW04/Txjt9eYAwfmjqiqP7e2rY/Q2VMGbweHFtrH4Qzro713WRxlmQ5V
 71FaM3wYOIE+hJt95cMFxWkcWc+rwy0JTEJWTZTBrmCJeOQy1zgkOeef0r19e5cpTWBx3LVYthC
 /+3gEclYQuHCoKOwcHY/acZTkjzR47GBuR3uwPqkKvR9dSb36pUuLz3Cvak8uF+gfLbld0dlHzi
 +ub57msBDLK3OrXOTxsfXZ4MO3+an5dNhpjfD14XJfsJ4O05nHCNC+MxRWFDtxiwWfbA2JtCjp5
 MSnmzb91byRoRAZJoh5yZpWFXmfpkwHay+upSEW/1g5GMazTR4osYJ0w9DKpUpnxYdWKx8plivZ
 EovJxOZBak27NGmX/HA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4MCBTYWx0ZWRfX3vwWTroo/c4C
 MELVy4PkqNVDYKqmikJZPmEQ5EuGep3VnPAqqZXpkaqaCUPeaVcma+WxQwO92Q093r0yDWoYLNL
 x16t065Rp9XGeNjrRLN+a7du4FPV75w3cVDFFc3vydFgq3/qTIXV
X-Proofpoint-GUID: 9zM_Q1Aci7B_pEgBx3GVc88qSyFkdP0m
X-Proofpoint-ORIG-GUID: 9zM_Q1Aci7B_pEgBx3GVc88qSyFkdP0m

The bpf_get_func_ret() BPF helper was not introduced until Linux 5.17,
and DTrace should still support kernels older than that.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_bpf.c      | 21 ++++++++++++++++-----
 libdtrace/dt_prov_fbt.c | 29 ++++++++++++++++++++++++-----
 2 files changed, 40 insertions(+), 10 deletions(-)

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index c7cde24f..3d12a596 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -414,7 +414,8 @@ dt_bpf_raw_tracepoint_open(const void *tp, int fd)
 }
 
 static int
-have_helper(uint32_t func_id)
+have_helper(uint32_t func_id, enum bpf_prog_type ptype,
+	    enum bpf_attach_type atype, uint32_t btf_id)
 {
 	char		log[DT_BPF_LOG_SIZE_SMALL] = { 0, };
 	char		*ptr = &log[0];
@@ -426,7 +427,7 @@ have_helper(uint32_t func_id)
 	int		fd;
 
 	/* If the program loads, we can use the helper. */
-	fd = dt_bpf_prog_attach(BPF_PROG_TYPE_KPROBE, 0, 0, 0, &dp,
+	fd = dt_bpf_prog_attach(ptype, atype, 0, btf_id, &dp,
 			      1, log, DT_BPF_LOG_SIZE_SMALL);
 	if (fd >= 0) {
 		close(fd);
@@ -463,7 +464,7 @@ dt_bpf_init_helpers(dtrace_hdl_t *dtp)
 
 	/* Verify the existence of some specific helpers. */
 #define BPF_HELPER_MAP(orig, alt)	\
-	if (!have_helper(BPF_FUNC_##orig)) \
+	if (!have_helper(BPF_FUNC_##orig, BPF_PROG_TYPE_KPROBE, 0, 0)) \
 			dtp->dt_bpfhelper[BPF_FUNC_##orig] = BPF_FUNC_##alt;
 
 	BPF_HELPER_MAP(probe_read_user, probe_read);
@@ -473,6 +474,9 @@ dt_bpf_init_helpers(dtrace_hdl_t *dtp)
 	BPF_HELPER_MAP(get_current_task_btf, unspec);
 	BPF_HELPER_MAP(task_pt_regs, unspec);
 #undef BPF_HELPER_MAP
+
+	/* This helper is checked with an fexit program during feature setup. */
+	dtp->dt_bpfhelper[BPF_FUNC_get_func_ret] = BPF_FUNC_unspec;
 }
 
 static int
@@ -519,9 +523,16 @@ dt_bpf_init_features(dtrace_hdl_t *dtp)
 
 	btf_id = dt_btf_lookup_name_kind(dtp, dtp->dt_exec,
 					 "bpf_get_btf_vmlinux", BTF_KIND_FUNC);
-	if (btf_id >= 0 &&
-	    have_attach_type(BPF_PROG_TYPE_TRACING, BPF_TRACE_FENTRY, btf_id))
+	if (btf_id != BTF_TYPE_NONE &&
+	    have_attach_type(BPF_PROG_TYPE_TRACING, BPF_TRACE_FENTRY, btf_id)) {
 		BPF_SET_FEATURE(dtp, BPF_FEAT_FENTRY);
+
+		/* get_func_ret is only available to tracing programs. */
+		if (have_helper(BPF_FUNC_get_func_ret, BPF_PROG_TYPE_TRACING,
+				BPF_TRACE_FEXIT, btf_id))
+			dtp->dt_bpfhelper[BPF_FUNC_get_func_ret] =
+							BPF_FUNC_get_func_ret;
+	}
 }
 
 void
diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index 8bdfc89f..a1bb4918 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -336,11 +336,30 @@ static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		 */
 		dmp = dt_module_lookup_by_name(dtp, prp->desc->mod);
 		if (dmp && prp->argc == 2) {
-			emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_8));
-			emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
-			emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
-			emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_get_func_ret]));
-			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_FP, DT_TRAMP_SP_SLOT(0)));
+			if (dtp->dt_bpfhelper[BPF_FUNC_get_func_ret] !=
+			    BPF_FUNC_unspec) {
+				emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_8));
+				emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
+				emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
+				emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_get_func_ret]));
+				emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_FP, DT_TRAMP_SP_SLOT(0)));
+			} else {
+				int	argc;
+
+				argc = dt_btf_func_argc(dmp->dm_btf,
+						       dt_tp_probe_get_id(prp));
+				if (argc < 0)
+					return -1;
+
+				/* As for entry args, avoid typed context loads. */
+				emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
+				emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_SLOT(0)));
+				emit(dlp, BPF_MOV_IMM(BPF_REG_2, 8));
+				emit(dlp, BPF_MOV_REG(BPF_REG_3, BPF_REG_8));
+				emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, argc * 8));
+				emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_kernel]));
+				emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_FP, DT_TRAMP_SP_SLOT(0)));
+			}
 			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
 		}
 	}
-- 
2.52.0

