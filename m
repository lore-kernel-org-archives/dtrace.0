Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A423D1E131A
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 17:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742406155; cv=fail; b=Rn1Rv0wQpBhcGWOTvhKWVa2hlDwT44qrLmcf7wFyhwZLwbg2vqAxN4GyOZNE5Xd+QYlI87DhpIwYJKabj8Ee3O6lvStlMEHatTrZwenrifdBz0Ui/7ec7UuIRw6/OtI8emkT3noGyJHYakgF9p/du81PugJ9cqmPMqUrpWi3T80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742406155; c=relaxed/simple;
	bh=u/HaYfzI7uNqOqFMH/sqwjFVVRwXQBpzj3QZucQMfqk=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=mpeu8xTh+MYJ/onIUraCbWHShbyA3fS053l1B2nD8h7iyIrRAaE/+DGoQEBkdfFswC3BIdmQG0/dDle8LlcEvTyh91HdVqSClAWpn+P7OyPVKoZ/sioFLLCMbFoGQLP1qdM+1vChsu9mFiAZUukiQPeaDQFT4jIeJyqru1OreLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KlZGHV8N; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=THU1+gBp; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KlZGHV8N";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="THU1+gBp"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JH0pSS019294
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 17:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=GsV4M4XcdoJcuv+O/5uSUDl1XTIWmykR7U/AwoYE5IU=; b=
	KlZGHV8N6rLgsOuJuIeGHoRIMBf/4wSlahX+K3XxuZ5ZDVRHsfen6G1O2ewbZ9XV
	F+q18BqcbdzhK3roeVpQMpa7JRB9RikVwtwBJKWRoUj8C2BEKA/QscQOU4wr42FM
	noweq1Z5iuCYMYnanIPcuHDoblueFnw9U5/vCJCfDChse4+MMcGTPQepJPBj1Pbb
	NA3G7eHCsHEVu/NJeraIBw5Q9GGY6LGEBdW4/aQKnuP2MxI+CshsrJoY6KIS5dgx
	YTf93u5wY+aW+phZXc09o9lhu7P3Mznw2EBKz1Ri7chGP5iur9FzvCNcJ/KojnPH
	5xNeIjuzVT8dUXlNIpk8kQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1hg3vk7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 17:42:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52JH76c0024496
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 17:42:30 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45dxbk8g89-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 17:42:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=al8hTYXhFPNwh1lMe636SQDmWCOsSrmrbL4ZeFV/P5n0uK+L1wsJcWYHkqNRI/msS6NaHU0j202A2lNoCAgWbF32MSrXzmRf//bxN1qnq950xb4Vi1ffG/Wymb4h70Mq/6h6xR3WtM9i8dJHU0rNR/K937hOLDr01k/IG9CfnXvycSrIz7C+1CY9VnpV/ugTQznsfP2bV+MS+BOFUipZW8xhmy3vNPmEU7PAR1yGQe+ATrFgbgZ1smwJAFGkGNVKMvuQF4R79qPX4pszZqbXrO7OP+ze7MbBFbpDkxZH2MOgRPTTsP25sJX+uL4IgIlYXS9Zo2OwlyNOSNk4IqdRBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GsV4M4XcdoJcuv+O/5uSUDl1XTIWmykR7U/AwoYE5IU=;
 b=rO/wCNXx6XPhwDB2/p97oUN8HruWe3Xaz1NB/LHuF4EDpLsIaNWYGrj4GF1Kq/f2A7Tllzi7e3P2g6sF09484S6lzNrS/88ckym9sXC2Kb4AbY1ebKeUV2DjLxTXOIf1hf/ce2v2qJT/uvM+xr+btpoOItPIxLatndKbFGS2vOPa65HBnYYZZtaiJKx7d+QIi4FI1WLNOgPHBODKZIwNd8bTLMjCap7oMPweGkUqoGb+j/KgNQrRkvS3FUkp02WrzLY7xh/wEj0VFGPfomoYVA6W15pWPTloxWiEjx1XCwdCvl7XzhT1R/u80bwaoH5r596pEATbKf7yMkaBRHQP2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GsV4M4XcdoJcuv+O/5uSUDl1XTIWmykR7U/AwoYE5IU=;
 b=THU1+gBpAU+JPO6CbuZjlX7ayzILnF+IziUIBoSbSqpdIp8jvPFrHJARfpZyKeRZTsSBrPMhUGmav7okycjArGf4AQkSaF4EomRp2uuPwnzKngYUjRdivH8wI6LUgkqksB7apEVLdE9+kxIe+3qafnPXqWRS3Oh6cTwPyaue6mU=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA3PR10MB8137.namprd10.prod.outlook.com (2603:10b6:208:513::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 17:42:28 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 17:42:28 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Allow duplicate lines for rawfbt synthetic tests
Date: Wed, 19 Mar 2025 13:42:25 -0400
Message-Id: <20250319174225.2203-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0367.namprd03.prod.outlook.com
 (2603:10b6:408:f7::12) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA3PR10MB8137:EE_
X-MS-Office365-Filtering-Correlation-Id: ef53ea32-993d-4359-a0a0-08dd670d6ab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7GSySO+tfa3nbFivVs6pzUtOrFE199l5ErODRnQnNrn1wsUvzEKbdxBZQzv3?=
 =?us-ascii?Q?//jkYCO8gFgAvmKaRw3phSpv2PdTW32M4w+WeRCYlf8LiPF5HK7hcfFca/DW?=
 =?us-ascii?Q?+vqZn6aTuXg86NCcNCEaz9bDC7d1CvHMZZ4j5C2qyW3OFFRHv69PlizvNq4g?=
 =?us-ascii?Q?SjcxYOZmwF6625OLujaA5G1c3UmlnyMrminFOc/glDNUia49rvQlGuot+La/?=
 =?us-ascii?Q?K2Q69LD4klW8QL9RLFFFETwz+EITF8E6609UeN6PUsDnSkCi5RwdMxxBOr9/?=
 =?us-ascii?Q?e09F08KTOiSlV/H9vTqwW0N6N6pIFcvTPEptAPphi+STPbflvF6tfxob3zsc?=
 =?us-ascii?Q?+r2fmEfEl2yv7yTliQpOxPG/7DZl9BwPFRSLpJmsl+Vknhiq5Ye9p7ARjRjS?=
 =?us-ascii?Q?Vx3MjAoaaxwTe4EnTYq7VlW+IOVLO7RDJRc0KC1kyKgftwlsYKxJsSk0M9TQ?=
 =?us-ascii?Q?gd5eL8V1C3XCufu+NIdI3y0BEhwU3wHt9AxFeOyMoFEJkAUWLM53VSz3Ny3V?=
 =?us-ascii?Q?FxgWrVwm1OzaOi+r9sZqDtZA+hiCEZ2DHNbqNggIsTK0vti8TomhEBPerxQ7?=
 =?us-ascii?Q?BFkMUHVdCPo5VXTIrYtxmkYo7tDTzVc056GSvFZNlPFk9qw+vxySVhtlDg+i?=
 =?us-ascii?Q?LkczqpYC+RYQdV8lXgOkR5VrXW3avryNRP3qe1z3/nlbzUnJ1XQ9vISZyk0H?=
 =?us-ascii?Q?Yj9jfeaMCtOrz1F3Z2j+kdT4wdtmK+KBU3tJAG4YzRejd2WyKQTu6pQ0oOBi?=
 =?us-ascii?Q?2GBiR0NmczylliWUXtZAOtLw1zkA35DoabQzvjbOxUWbGsorAWGDVQLSC4qu?=
 =?us-ascii?Q?MCtb3IaBWlLUPHu4Pb5mBY1s3cKRh1OMifXwwLGyeW6MZ/gyRRKzYxbpKR6k?=
 =?us-ascii?Q?+Uu5WBIYoWiXORG/JW9ZIRZzIuSHLjf9vLXkANNBGySapeHIOwz2GWbJGGnU?=
 =?us-ascii?Q?w/yy1hY/tmT8ui8aG98T4IXDfhwEUMkS9mmO9IXnU6mRNy1JFnwwhvj0PjvQ?=
 =?us-ascii?Q?AlitipwlvN3/0I5UH7My014i32fXXOyoBwb778rsRzRw5hdRFp7Phm17dAKL?=
 =?us-ascii?Q?hI8BlaxlEph4a5cpD3ldQKcc4L3Akz7DnJDfOUVhy3/YAs+pGy7BeyWKvhG0?=
 =?us-ascii?Q?wILTB+85RfVVlKd8CZLaj6a543G8XxYaqqu3VLuil1GCqXL+1WWHqB8eR8Uf?=
 =?us-ascii?Q?Sra4phebLOIlnDHHjKETE/LHB/HSTwxiQWoZUw8NnMc2UPM8gKLmw4KLOXP+?=
 =?us-ascii?Q?4FXI+uA6FL6avQ0/kbxNsFVj+UwCjKxvZ3HP3Jt4jiOcMwlz19odcn97yOyp?=
 =?us-ascii?Q?Q8KsQQYJmMNNkKmHNmUbqrzZUXlSA3Mh93QA38nSuNPJeEWal7/l77XheByg?=
 =?us-ascii?Q?FX5OZzMPsDvKQxi5EMjJGnCeY/IC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XcpNYiTqhGlXON7uVP/kHmia+5WxN/BxTyqr23FyUZjdSG2l2BU7Y4lLAwXG?=
 =?us-ascii?Q?7nlmR1m+6YiQrKXQTI3cyiizZnmKCxJ3bKgJSyvm2RCBuSqL66M7eO7wZt+G?=
 =?us-ascii?Q?3miOW67MZQX9vTWOAEFTD3lNz6Es6FgMzGIlXdII1wYPqfLJulL/A8Vij8L5?=
 =?us-ascii?Q?9857eMOL/RuJyDnEO6lAfPXtS13TKBZ+GdHgR0lBk7uJ9VlYDbyxGa1f4Rsr?=
 =?us-ascii?Q?j2sYfm6Bcz3V3NwsztfSH5GtBZSpSYxxX5IgA7cbbt4/UrGqp+DqFU4Aqrkc?=
 =?us-ascii?Q?tH2rqVG76DxwSk3n4RS/0E8I5OyWgxCLR36gDGeCRf4vUNYtnVEE+2PasI+4?=
 =?us-ascii?Q?ENKYNn8I4VXmbOkJmBXbWJpcjdrXdDOWA/uYmSeOxPq6Z9L8vaeOsht1w0H9?=
 =?us-ascii?Q?OSBEIcJDFd/ENtG0mzEGqpIWdgWVStc5NlOIzNzTIRfhuAiI70h8WH+q/5Sr?=
 =?us-ascii?Q?i0mOnURSGhjc9c3SAAREghgBly92rY/vnNop9oQ2vTKQK3bPKDODjULv2wFv?=
 =?us-ascii?Q?lDfB4teMZjhw7JrJjLY5F1NvSfs+kALTmTRcAdwp71s3kkhzc3TyQnJKRMCj?=
 =?us-ascii?Q?l7Wvw1SGzxebz4WlILFauRMXaWevopt0YrZx9DL51pw7K6O/hJel0brsdNvN?=
 =?us-ascii?Q?L/ImE11LIJGnYhwNZ69MGcfo2iAhtQn+9vqhMHhC7J53bCMbZ6BTwB4louee?=
 =?us-ascii?Q?w+87efRyWfdVtj0S3l006vkuq4p22/hJimobOffju7YDDnqXJTJgXjQ/2vt1?=
 =?us-ascii?Q?irE8345Xp9Y5prK25pNYpFYLgGCdNdwh6BkotpSn6lwauBRXEIyRRXXyRgG8?=
 =?us-ascii?Q?9uQbpccImfl6LVHMlzuijblelXz4SwjxpNlJKIDMJNejVVsxxdqqCARww4pQ?=
 =?us-ascii?Q?l9gKIGWHyzw92zHKl/hVarqLI2qZnp7sitWd+6Db37+pcTG/5USj3I5nIvw7?=
 =?us-ascii?Q?ywSUZgv+p+OashlrtkfVcj2D9VIuN03RkyB3Uyg/qqH73uQ2vM+4VWZJ8GaD?=
 =?us-ascii?Q?pg0qPLnYH5OpH995bAGacx0tJ27A9UDhNF5L/5jR4UCydIBCNF4nVZ0yFIhw?=
 =?us-ascii?Q?5WijTF7ruGoKlGZKztCo1GlffNMeSWL/MmrfclmNEz0Q7Hb5lFLRkWiaBIT4?=
 =?us-ascii?Q?hdqhdd0D/cgenypwIoVE3x0H1m+HAqcAYLBA5nkQTgYEhJSS+MQaoR3tl+3i?=
 =?us-ascii?Q?eG2u3w14xsjYvneGAc5NiGcAPV/LveqK6jn56CXqVtwqosShmQLA4f+i7zs/?=
 =?us-ascii?Q?LACOAt77lkOwd5YgIdNYwT7xPc668OniEWUzxx4D5RoUneV5CnHqU0xRBC9F?=
 =?us-ascii?Q?cZ39MoZ22rk4gZPbb/afIeXmQeEy4xErTcWV56C75lgDqcMmz+rvyp0KAQXR?=
 =?us-ascii?Q?2FCeWLSejRG9TRFlQPYn4vNFCSECo1XFag+Uw2FgxlRS2iyF+urIajZ8RHfH?=
 =?us-ascii?Q?/i0jhQPVAdUiwUJy1ABgRUJJQ7BePEBnYYVoRM5D/sEu7FZ2EDLVcN8PSi9j?=
 =?us-ascii?Q?7sADWdTBjsTly7Cid8y+opj6T9qBos9F4rjUb6A/7PQIGak0r0thnC14NaNM?=
 =?us-ascii?Q?3BNrzAmn4k+T2N1NSmpcZBiyT5UtgbWOk7ou5JX6?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Z81PvsVzPYvptNpGyvmduCe1ZmH/CkbhjR2i9mYq1dwgD6KocrGNqfk89EN/m69wiM1hGjcDIKQUxvBcFoFdPqzBO1jBTSf8WAAaCoJ6tPu3+oyAoQME0TzAmv4HrOkBUUxWtRm9Kx7MpHseulIHAos8l8XhPLRkIXM0ML5nGTIR5XHNg+wNYAMr1hWqsEDB55o5VbF2tfgIF0CqArntCHQ1rcbrO5Dlle9o3XFA0CyTo5ZU8Ha4brGqr4xQ84lqFGI1hM1uBkquEJM5JTFdsifploq4mwxoZqcfhihCFZ40IYAhNIdbZ6fODrxeX8eo1uXP+rNCkbVex0gkasDhlLFtJ+eGj9niiFSNw2bK0MBBmQiQ6dBT0LWyIhp7g43SDiHpLbNmQnBLaF6oyyO6LO5tuaxqhIo2CZd05Za1bCDGzI9Fgx0Ri5WvV18c1KxiRt7wND5ICDqrnmVVb4m4xkmH015lia90jcLKNw72r+uq/Veae7FtMltRXURH5g52iqX3/mRX1W2TC1DYLnRinih9YbgKJFcIzQUYqiyt9qOQsWXT/uz0Y+st9O/6l53OAp0kuCTLg1V9PhVIIq8wcP64FxBmectY20ZRHkZPM6o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef53ea32-993d-4359-a0a0-08dd670d6ab7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 17:42:28.0377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QIN47izCARHCZLry5HL9EuUjm87MdqNcHBdDNUyOy04oQUFGPpv5mQT+3KUK4znq+STWS4197LkQSt5CUlp7Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8137
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_06,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503190119
X-Proofpoint-GUID: rY0IbyY1iwTxwLYk1DzoMABzOmhbfQXt
X-Proofpoint-ORIG-GUID: rY0IbyY1iwTxwLYk1DzoMABzOmhbfQXt

From: Eugene Loh <eugene.loh@oracle.com>

It is possible for the probe in these tests to fire "concurrently"
on multiple CPUs, leading to duplicate lines of output.  Add
post processing to reduce multiple lines of duplicate output.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/providers/rawfbt/tst.synthetic-entry.r.p  | 3 +++
 test/unittest/providers/rawfbt/tst.synthetic-return.r.p | 3 +++
 2 files changed, 6 insertions(+)
 create mode 100755 test/unittest/providers/rawfbt/tst.synthetic-entry.r.p
 create mode 100755 test/unittest/providers/rawfbt/tst.synthetic-return.r.p

diff --git a/test/unittest/providers/rawfbt/tst.synthetic-entry.r.p b/test/unittest/providers/rawfbt/tst.synthetic-entry.r.p
new file mode 100755
index 000000000..18171f044
--- /dev/null
+++ b/test/unittest/providers/rawfbt/tst.synthetic-entry.r.p
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+uniq
diff --git a/test/unittest/providers/rawfbt/tst.synthetic-return.r.p b/test/unittest/providers/rawfbt/tst.synthetic-return.r.p
new file mode 100755
index 000000000..18171f044
--- /dev/null
+++ b/test/unittest/providers/rawfbt/tst.synthetic-return.r.p
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+uniq
-- 
2.43.5

