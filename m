Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF561C696
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466534; cv=fail; b=c3mvDwQS6T9bdIqxcRTmdYdGSsItGRGat6iGMxb0zxwKhl6T9E67n1l5lJfKXlR7oXC3VX1+ZJxFxA+HtyVjo+qs+wmsZfUIfKL0mmLbM/lQ7lQh/8PJjlSqzkPgTNs6IfvsmOoimo2PBLdT5luaBVIB5CKjUsxpVN//X6j8d2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466534; c=relaxed/simple;
	bh=gGsdixy2tQrlyvWFUFjhs9FPsXyfZxL3bQndM8wTLH8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G2stWv6suv2MPs9uZN8BEKcT1J1fsFLkG1EWNGsJJFTlPc/3JcjLjQBA5bx92iZB92lTZnpqLQZkRjOjAsZnPRB4pw29hpHGix0cHhGqjsmmxC/RazYfPy5aVYxXe7wrdFBm3kej+AJmQvdGCEfWgcN2d9HgiFfaryHYqntlhH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=l01SEX/G; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DccDu2cq; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="l01SEX/G";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DccDu2cq"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMTJm006658
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=Fcv/DmRgTRQuFq
	5WFhgaTpDN62pznVYBe/W7VL0t7L8=; b=l01SEX/G3/ifB+iwqn1NtaWW06TSHj
	GHWBqdP0jtyRy+bdL+fD8Np90nJOoNGFT7KMiZK7gD4CzT1xd8KZ0w1SnjVtiJyq
	rvJ3HmexrzE0V1zB7sL3eEjpd+NHL70USWNghCaDCmGfIiB7B7lYF3G16lk7chWo
	aeIBYShi4YhjJ0wcCNSRXDvrZEQKHqcZxuNf0sdEcV8BxMQj/XSZTI+hTqC8TTEm
	z6PyPPEg0TFoLvT9iBZbtYSPPT0KKVHW9QkMAw5gXb62PRaSvYToNZMXGIqIKBJe
	wr7dVcLI3P1/P/0K3wd7st5Nk1OFKArFQ+En2FrTjYQlon5HFVq4S+xw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 400ttn8hyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R40JZd023305
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:31 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2gev1y-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oB9nFxEKNfNggk3RDsX0J67CPdSTTtmraI/zhuLOSmYlrXXkUrZ9sWyejxCpR3O9fM3jcJ/4KFa10EIZvBP6BMO5CuY9UhhXO6tWSLTLb9JDtEvUBM7fvgKdNmXBxK7qiFRTalvI/zkZWJ4YtB4N1AeS2W7Y1DzjcfESJytR6xHZaFYxedVtPt17Q4Qr4n7uz0zpKtcX8FZZyPUyc+W8RidLKNY9Sh0wfNhqy+btO1QuNhL9enSxzC5MY/b1ppixY+XMUbk+7xd2wHhyKWbqWD7NHCAzwC5SpTIvoNxwFXhvnnbmeUYbLdbMdU4F1O+DWx6Oq0igYQVBlfAdDwk0uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fcv/DmRgTRQuFq5WFhgaTpDN62pznVYBe/W7VL0t7L8=;
 b=k57sH+avOymwPjdet9XDLzg4llSlsAVZ7YPG9BN7nnwmY+9VtnooYzbSBjYzXi8UkaIKhoWNeCs9Ixr1dT/fuiQp6KWI/WppDX8GGselqr1PZhNVrNfO/NMtfdU81bBcd2w4OQaRokgNzmHeRLzR88+8fnY0pP2sXulDraC3EtyPlPS+b8FEU/fA/0f3Zfsorb+kdgcMsAUeWODSwhzO/zG3ho/nQJBMWKWQ5qeyDWJVXLsngKNo05mp0Yv3Lltp9q5nV7aZwOgV/uBL+E4hznanwP0KlbAHoq81CDPQIg72aLdateDpt2AtIFt1cPNyH3WdpOqo5udM72SKyswCfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fcv/DmRgTRQuFq5WFhgaTpDN62pznVYBe/W7VL0t7L8=;
 b=DccDu2cqRFtbaBJuDLRF26ehJTqBJT8ZK0/v1kXgLN7u1wEsAH+WrsVfDdVNMpQ6DkbtDOBTH+x3b5egHQA2HJU9TFA71Fcg0ObYyhhSMcvfiKzJGF66nJbVhXmE8ff+KYrvwdqWsOl0O8uPveaa8eW3WhZz6pTiWzF0wfnM1Ps=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7400.namprd10.prod.outlook.com (2603:10b6:8:138::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 05:35:27 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:35:27 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 11/38] USDT module names may contain dots; but forbid "." and ".." names
Date: Thu, 27 Jun 2024 01:34:28 -0400
Message-Id: <20240627053455.21567-12-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053455.21567-1-eugene.loh@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::40) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7400:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e96ac26-dcbd-4560-c0b5-08dc966af376
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Fiymv6cHdHCDHRaC77wTMToxk4lrfcuRFfYfUaoS8xc0u6wxhXUWq6V4gQGD?=
 =?us-ascii?Q?OW8tbO/ZwyvgHnnGBjQAccwaIr94bcROLZiWx0VqE+NZZN6mDvPh5pGyYjPr?=
 =?us-ascii?Q?00XOEw/cSxS54um6cNMvsOjS6DYmRvg9rnV3bgFcqbDIPuOAF2jU/CIlIQqi?=
 =?us-ascii?Q?wkhLIWMumIv9yhkV6Fd+Z6GeqsypdpX58c/O8gChLkT0dMk9VnO2Wz20F6p7?=
 =?us-ascii?Q?f+p7D8DEkbUsJ7zJD+ZeM7TP/dXcZ4xIlYBowtn1b7BG0uKr8fZ+LYOvGoTa?=
 =?us-ascii?Q?qADBnwwqJrcwMdc7kYvLKn8Mg4IFh46BwErcjwDSEvXxV1JZolN/uEJ7Bh/j?=
 =?us-ascii?Q?myqCHHsQI2Fni0obnec3oNqDqHbNbNP5Zj+q6fNJrJZAEp8dptfYKHQtpRUs?=
 =?us-ascii?Q?61TuPWCychkEREowjcHzfhuUrmpKppvZRUIYvi55MZ5vejfKic7ud0YTpSQn?=
 =?us-ascii?Q?jj1qZjMTjPUxAyPjFNvYa1kwuZQSPk8uZtoX/QlnlmYNAzXkyYcmeuUWdPj1?=
 =?us-ascii?Q?FD5QwLEuiDaoMz0UU8/H20WrwyJpDl5MPCUMXX5S1Rv2+wdrk4Nb6L07mPm+?=
 =?us-ascii?Q?4heFLivErToQmfjlpK5A7K+rh1Kh/0fnM8v+CfjY/k4ykXuL07L4/r8zDM9/?=
 =?us-ascii?Q?/LCyBmcHert2IN9s3ADc275ZBHNZpxZUF64g974Ifdd4pcLWkTiu6QhweCtd?=
 =?us-ascii?Q?XHbsI79QQ2OFqToxsnyH9d9R5odenQOc7id0Yt2L/h9EndchWloVCPR4MIth?=
 =?us-ascii?Q?mSTpwh3KhTtFUd03rn5g62LhDYmdSEqyKhgqhgrEgw/Rj8jhkkU+/nrCADyb?=
 =?us-ascii?Q?djJLz+OWKQf6ZxVzA9Krw3wDsps9mGayv8M746rLERgIlhOqy9/p4p4QnPEL?=
 =?us-ascii?Q?R28ufr/V7WfL6ev36mA1UHSHdhz3GncGC9Q1ETc3+wDFON8zI6ZsbViGSs/J?=
 =?us-ascii?Q?A1WT29BUdzU+7jjG8Cy8RjqV5slXIrTwcU8+9BKDNyEyIS5BSJ+llAK5j7bE?=
 =?us-ascii?Q?uhqT5WvqNE65xQUSUZ9Hu8APw/QScWI3FT/x7yw+Sw1ZgZ0le+s9UUncDpE3?=
 =?us-ascii?Q?46zACyZXsK8JVsr2AUD6hDg+X07VuNmgrsmKMbWghTcu01mJTvi1rhj1sPy4?=
 =?us-ascii?Q?cLjbjg4mqdekTYuUAb0/Fm0uRLYd1KHXtauRxRFKw9bA83uPbBrqq2ceIlDP?=
 =?us-ascii?Q?VAWBB4pQ0/39QX6OZbHm3J2cQxEAEb0OzF3jDk1lbL8gEEm3DL+ndAJtNjgI?=
 =?us-ascii?Q?0sARiygBDsxF/hs7gpuaX3SlY6qvg1zoE7NpR0O6W9WMJ5NTuOSVX9EVNiRf?=
 =?us-ascii?Q?Ldp124LIBq2xarNGf9F1Ev7HmZKIbR7DClR/2jtQCF5Vhg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LZg6hESTwXBH5rG8eaL7ODYMZs8OAMdvBpsV5Umy73EDXI8WaithLsQv5NZx?=
 =?us-ascii?Q?1Gbe4uGTnJ5Z1Q9qY/VvwgEo3/Q0N5Eg7DzOKqCCIKk61OMDZK6Pfw4r4UPt?=
 =?us-ascii?Q?8Zu9sRvrQFbZRBZAAjIQ98teJVv/1dF8EQLBzxM4vc/mIUEKcDA8fEB3nK7c?=
 =?us-ascii?Q?Y5qY20wGWbb3rZqDjztIJh6MNB9eqgp0I3g/E9MS24SQ0Cp8kgnlYQ+a3dMY?=
 =?us-ascii?Q?9Q7MW7OqLVRAGc05+Ei/rpWHv51ShqKWoP6sp5itLKvoFtphBSvhFqm5JpUn?=
 =?us-ascii?Q?PsUblt3GG/RS4i7Y460cQMpVPkEd8+6dbJJLOsTX2+zQVZWw8hrJXK42kj9m?=
 =?us-ascii?Q?Q6IPjKOTiIqzmL3Gxjk13BywuHSvYNYVRBlK9pF3lJ4wk/Mk+8cEfDjtI2Zu?=
 =?us-ascii?Q?oZXFPBSaQoFdkOOJBP5Wrvy+yGIDjv5BcjSBVIHhg6Q67loAmGa0/fl5LYtY?=
 =?us-ascii?Q?gQahPYNU6cbqLDGRESvc3Fqm6ykGJLwmQsgjUucyBw03ka3GRrw+O+rz1ofN?=
 =?us-ascii?Q?LNXl7aSUEYA9yIJ8iBhw90K5hjjX+BsBn7cxc6oXalNbP6vYRLcfqwfDhYZp?=
 =?us-ascii?Q?gvbIznMVoC54U8EtJ6R22vb7LiLlhAQWHwoMW+Bo9jGXmnU3h08QKEZ1UY9K?=
 =?us-ascii?Q?V0V8r1xSa2gqLyHMMpKWQqfOnPYdbrxvLkoGPYWe2y/x81b3PoPr80Cq9bus?=
 =?us-ascii?Q?AoKBgcAyEgOtDfX5Q4ZLbkMvjcW1b4U7i11rEpekpLs11vNZ41uRH/JHWj5R?=
 =?us-ascii?Q?jN7F/ox2SFGeBEaQbQ146BjlbgqkpgFWnpQ3GqsW3Uu8ngXGg0wF5LWdnK9v?=
 =?us-ascii?Q?AKqR1CaaufkruR6a8As97ku3TQUYHYqZnbV84hnw+/DgKj/KaakumLyjW/TG?=
 =?us-ascii?Q?8BFeyCq8KxgaemU50QmOEO0D6S9PS5ItKScR5erz/lavWRhCa5YAEXVptdoi?=
 =?us-ascii?Q?abXo81Qe9xcwWXIDPX0nl0MDHda7tFmNhZhviptX0iwbArWWRfnCCXCRZ5ee?=
 =?us-ascii?Q?VvbGbpXQWUlWs16zRa5n4AfVA8W8R2BZHzQInU5YTp8P+GVQJQLkM1eDNjJt?=
 =?us-ascii?Q?3KpWNECDnDbeBiQ8i8/QG2qdAPkrlY96ClCJNWAYC0syEgWcqcsLKEx23Onj?=
 =?us-ascii?Q?+JSXzVMPtyp5/HWSTjoT+IYlX0wO2bNeDxMj4JM2JNQVyCshHuoookgHQPG7?=
 =?us-ascii?Q?8V7TkVoLC3VZtgEeLuZe+gaEbXMtfmO7mdjEeg5YoB5CjAOPjCQ4yacbjyQY?=
 =?us-ascii?Q?nCZrTki2qqQAl4IF2WrbHwRvGeTlPoetOiueJ1gLLNmi3iSqjosnRfKbEOoa?=
 =?us-ascii?Q?9eZu1E1LRL96MubMVoMpQQUVEl1UhESIbeXt13tV1kirY+Bwh+zYvAZ89Tew?=
 =?us-ascii?Q?ccWqkSsa4kJMcf+Ztd/skSMPxWxG+bdDOU/Cppq21LutGYK5rvTX4C8pHQQe?=
 =?us-ascii?Q?D4crVgdSePmPiUpShFDLSA+pd/jyIcgf+CQCflPblolvKjkTxeF0gY1CPpbv?=
 =?us-ascii?Q?bpxp434Om+99/fXrTkCy9eMfA41iVUyGIdOB397NVZsjFBqAm2idSTYwTgOz?=
 =?us-ascii?Q?tOoCdepfBo0UIfhBnNGvk7OvUV4kiTj7HnQCuVlp?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	sR04/VA6yyUrxWG84uyDGpdOIPZHdfunAaxyLOgAEYk4Wl2N5mhS6PeZuegOaAABYW7YQTE7KxJkEosE6CWdFeAR8iGt+b/dj6XAlPX0HkgPOFSK3NIhzYg5rz4cMSB6jKJvNYqJ8vaWYzfzy5xUNkmOtgCwita7+lbBTgP72srIvYCe1uhsvdzlFp6jpfK07B//2460CRAF7l0OUEzXtqXQmhzJ060BtqTdWSa0X/2ix9MrjRUp7xZ8GZzbCsrY60+CxJp6UpdLn9oWYaMqhaczyykO5smehqg9EXipEQ+sbpJJQLbIPxYbsS2dkk2rNVsC6a8cjqvDURm7fsS7CxXwwBH5FZ+kGtYYtfAp/5k6DyecWaaQ4HAIMiQ/H2ubVFlJEp7BoMhX3tIqv2difJlo0ekH/KClPn73iTjaxJcTMoI4RoXDIiDX1WXjz7Ahv4bKvf/mpGVqEHEyKuXgb87KS9UmoxP08LCaJcLTwOfQgdZLG5WxxtTA5ETWB18xmn9RGOA58bJuL43bSgXgglKLxJmSVxFpQrN6qC/Wl7BANpbB3kEJnYUcyP7lT2lRODjCSP/8hhfK7XvVvfKY7fWBPfQ7EVB6EHMmz0zyBXw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e96ac26-dcbd-4560-c0b5-08dc966af376
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:35:27.5764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ANRlbmxIXdd7h/9t1E8C7xLt6jIqZjPBVh6Jf9BBnaSrrb11aqlTGUvedR9zYi0Z185r1cqGlLD8lrAOO1rtQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7400
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406270040
X-Proofpoint-GUID: trTTsXPguEY_G_uT5BCOIqwzcuZEPwrV
X-Proofpoint-ORIG-GUID: trTTsXPguEY_G_uT5BCOIqwzcuZEPwrV

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 dtprobed/dof_stash.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
index 62418b66..625572d5 100644
--- a/dtprobed/dof_stash.c
+++ b/dtprobed/dof_stash.c
@@ -231,6 +231,20 @@ make_probespec_name(const char *prov, const char *mod, const char *fn,
 {
 	char *ret;
 
+	/*
+	 * Ban "." and ".." as name components.  Obviously names
+	 * containing dots are commonplace (shared libraries,
+	 * for instance), but allowing straight . and .. would
+	 * have obviously horrible consequences.  They can't be
+	 * filenames anyway, and you can't create them with
+	 * dtrace -h because they aren't valid C identifier names.
+	 */
+	if (strcmp(prov, ".") == 0 || strcmp(prov, "..") == 0 ||
+	    strcmp(mod, ".") == 0 || strcmp(mod, "..") == 0 ||
+	    strcmp(fn, ".") == 0 || strcmp(fn, "..") == 0 ||
+	    strcmp(prb, ".") == 0 || strcmp(prb, "..") == 0)
+		return NULL;
+
 	if (asprintf(&ret, "%s:%s:%s:%s", prov, mod, fn, prb) < 0) {
 		fuse_log(FUSE_LOG_ERR, "dtprobed: out of memory making probespec\n");
 		return NULL;
@@ -589,22 +603,6 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
 							    mod, fun, prb)) == NULL)
 				goto err_provider;
 
-			/*
-			 * Ban "." and ".." as name components.  Obviously names
-			 * containing dots are commonplace (shared libraries,
-			 * for instance), but allowing straight . and .. would
-			 * have obviously horrible consequences.  They can't be
-			 * filenames anyway, and you can't create them with
-			 * dtrace -h because they aren't valid C identifier
-			 * names.
-			 */
-			op = "probe name validation";
-			probe_err = parsedfn;
-
-			if (strcmp(parsedfn, ".") == 0 ||
-			    strcmp(parsedfn, "..") == 0)
-				goto err_provider;
-
 			op = "probe module";
 
 			if ((mod_dir = make_state_dirat(prov_dir, mod, op, 0)) < 0)
-- 
2.18.4

