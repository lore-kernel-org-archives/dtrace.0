Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2773B1D6188
	for <dtrace@lists.linux.dev>; Sat,  7 Jun 2025 06:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749276910; cv=fail; b=HNXPcVRNGcUP/agZzF+kT0tBTeXCLChmvgJIUMKll0495hVim08tjevMYG1FQGaiiLLA2mjBsEKDwT47IUhXpcNIW2KybKegDVTLw1VAVx/qXL2v7+WXPdcdXc69dybLPEA2r5wzLtXZaR8ZlfgL64Y6yv7o/lQ+bs5cAYyp4DI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749276910; c=relaxed/simple;
	bh=5CfPJ1fJzgulb6zHd9rSVirY1Uij8+VDNUCFGm2VF+M=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=DNDUCtUgGyumJvqj5MBnuaeiAPCnqc3xUj8ljj2g1+wdgW4LHCUBfoFAXbOtZBxHKZSSQMqeBlaPEiWEua6yNFcrD6235rgBXij+ozkn3k5cIlpQEnAOC/he7IL0qm1n1evHCA2yUGvXD12ktuxRHFJrgw3SwLjoBNbMRFRO+as=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ck99Rx2f; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=scr1FUgf; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ck99Rx2f";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="scr1FUgf"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55740vm3005181
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=w6/DyX2yGCw7Dtbc2SmspvkpwisEWnEnVs/TAxmfyzw=; b=
	ck99Rx2fSEUPjk9LJdPF81Xlm7MuucizMIOPhn8E7BveXJlL7W8lP741eCvlZDDW
	xZWOakam+RFaBfOqRQPfwg3sVyHUxFMPOtQWYYJloviwVRv9Yc+k6WoxkQbyWWkA
	8ZXi5+XLaUG8O4RWpr0uLhkHwr3qrA0kxPsVdwv96f7yRczyynnR/9oJqq3SkyXo
	4EvTt2+v96ICt2eAp7kfmqiEvLgCq7/EEmT/W4ltEXA8KGxDgZCrm+r3+371G8ws
	w45BOmGJCNHWrhz9uCD3A/VKCM+L7SBm+5QdzCU3DUYluOFKtYsJK5G588eprxOL
	InzmeRZKrPNIvVvFtJc0zg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c14838p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:15:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5571XOpf003302
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:03 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010070.outbound.protection.outlook.com [52.101.56.70])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv5uypn-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:15:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTB3T2GsmsHi84RyfqttDXu8icV+UQBIAPyRitNOMzZvauKTrWHUx/TUJGhdMbNuOVxt255bNC8R21w/oGCY5xXfPe0FC5iOlOLHzeVTFfXF+l7inl6D0B/OchyOGLhVWCSn8vyD+p645naWxo6UOUJM0w6PvbJUzv+0l9kxkBViZt0w0urPswoeagBKmSIGPAj0wk15iTs1omrZmcfBbtvpzMa31uTGFl6okc89/qLK+cBwEOf+WY90/v/i8FzkPorduKSdkKefk8Let/Ou4mqz1Pp+9/MstmVtUWcmxA5Hl93uC7YATasCmzoy43+mQid4FR3x30ldegOdf1hOTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6/DyX2yGCw7Dtbc2SmspvkpwisEWnEnVs/TAxmfyzw=;
 b=WX6dpp3y3nKR7cMvNQiZxpWOQodRsRuxwuVJs9xKUlqdKAmo0biL7btCDIEzsgzM/Nvuk1LMKAJZLKnW9PRMTWLw6URdNG4AfN8hHI2PHgPZiMApa4CqW4i5DF2vTFvx6fIY/EhyilY9m+GDswNgzPJK4OcB/Ti75y/D17LvoUs7Iq01/T4UZylV6CTXTxayDx51D5ELkoaSwn5Kg2TcT5+gjlmGmAjAdkYOP/8q+Jzp0Sdw3cciGdG2TSNd6ZjHZ5Pcy3AI5b+f5EN13ievAKUvM22XOBekfEGzAYgk+QNSPNjWKAtTaL3rW0WeFLhWbV4/JLewFSLcAWDmlyguyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6/DyX2yGCw7Dtbc2SmspvkpwisEWnEnVs/TAxmfyzw=;
 b=scr1FUgf+vTcv64qJQyEpTBAa6CkJXwUSwClBvGwwnh7PIcFxm30WMc+9GO9juAnOJWGQhqSlVW6/sYIdwFZGYL50TL65+VFxfwYtDRA/4ZEzrAlR11CZhrcICxq6jdQqsqN3wqDiq584uKSMQfK1Nr0owOT1ftr7Oj74Z8Z6iM=
Received: from IA4PR10MB8374.namprd10.prod.outlook.com (2603:10b6:208:55c::22)
 by IA4PR10MB8636.namprd10.prod.outlook.com (2603:10b6:208:568::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Sat, 7 Jun
 2025 06:15:01 +0000
Received: from IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab]) by IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab%5]) with mapi id 15.20.8813.020; Sat, 7 Jun 2025
 06:15:01 +0000
Date: Sat, 07 Jun 2025 02:15:00 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 07/17] dof_parser: generic parser framework to support
 multiple parsers
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:208:36e::28) To IA4PR10MB8374.namprd10.prod.outlook.com
 (2603:10b6:208:55c::22)
Message-ID:
 <IA4PR10MB8374288FBACC590A55C11A88C269A@IA4PR10MB8374.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR10MB8374:EE_|IA4PR10MB8636:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c4944b0-432c-451b-0cb0-08dda58aa2af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SWco5wao6lEZiP+ap/inMT4W6zngO0wcJdm6RnzfzogWxIPrpre5otYS6+mp?=
 =?us-ascii?Q?Wt/E/xWQ1tH5950eSTt4vN5F6ZIJsROF8/rWOJXvtMf/naSbtVDF14HJn9FR?=
 =?us-ascii?Q?uX6f0ftg/vdMC588f8ASuKswLgkX7lX+HxHcD7zlsiHrCXYEiWP48hULA1qU?=
 =?us-ascii?Q?s3tZaNO1dmbue7JkucvWblEm4uu0Q3PLTrT3GKa4+sRARBQIlq298xnX6iyF?=
 =?us-ascii?Q?2EibNZ1YBbHNXDsolhWP1j+8vPg+M1UHrO4WtaHrI0U2wP9E/hE5keYFAM7k?=
 =?us-ascii?Q?yF7SqdBjjqVN+Jsl8mTXNckAQEcTNugZ5dbngCUmBaDNCLTMLtuJFyjrioq/?=
 =?us-ascii?Q?Wy8ikCUd6GJkaMEVqc4WbU1SR7hiaTWHLPhaX/DFO/gLR265bOVLIp7lkkUq?=
 =?us-ascii?Q?eoNBfZBswPqnhy4y6J9kCsIi80RcU7EP02Wb6c+fHplh8XzOx+Ery/arZIFr?=
 =?us-ascii?Q?KXhLkzbmxCEjUt3bdLnvL1lfh7r44SXaS+5mhxbnpyDSOKr9Ehr6JooB9FSk?=
 =?us-ascii?Q?8b4LR+nFvrpVWDLVp4WgL879QP0dI+CTGN3nacpo1bbT1CaEBBiqN+40NcLb?=
 =?us-ascii?Q?UfIkHfZLbyFjdmrXUsKgSNcx8d8uAdzqddXLPPx5IO+7qiCcp7N804Jyy7Aj?=
 =?us-ascii?Q?0heO9k7Kz30qzh7m2TjPIVl+akAadrNieNdezV7TYgn7qHGQL4+dAA53oZjG?=
 =?us-ascii?Q?1hQtAFBXsFNyd2Rwrq8cETwuBX2I9I48GEm2LXAW5c3ERbtQOQA5aOyFadML?=
 =?us-ascii?Q?ada6G3jGF5rMFm9ZmWOhf0aLvqtTw295qlyXh9wq9ZgSXyax4L/DwUjsc2YV?=
 =?us-ascii?Q?0lIPGxT80QzDP6iS/i8ksADYPv18m8oda3fz95DoieU+GOZi9VhPVfUQbl+5?=
 =?us-ascii?Q?GmubpVYOL7sI4MgTDWB7unlOo9+RiR67jm4DRa1kkNd5Z/fZk9LpXMQ6l5tg?=
 =?us-ascii?Q?tng7Yl8EjJR3MAM6p2YalEtWknVp34IK8pOx7fS8VCeJ+d7Lp5xWfaxNw0uy?=
 =?us-ascii?Q?P40PND4uhM/ZzwA+4vYsJ2mFMthapmqwqp3PZVsy9DzaXKshdwYq5DvapC5c?=
 =?us-ascii?Q?obrczVDnHKrYkPRbgH1mlm+u+4q0vyF4z+ALfREPm6cpCS/SEO/E35umI3UL?=
 =?us-ascii?Q?S5xZhfHGQRuKBJqZvZZ6t9RRKbRgNf7zLWTq72v5IUArq4V3OlKDB9471la1?=
 =?us-ascii?Q?g/iMBoYWZZ1sFOqf86gp7pP9wgEXIcCoFFkntZ5Ubbj1sppWGRJqT4zZUcdv?=
 =?us-ascii?Q?CDsaqQx/YENtSvrk7YgT0Rw5vwbf5UGM5dQwhovJHuvVQ0JpPxs3a5ymzWM0?=
 =?us-ascii?Q?0IZvvBBG89atZ3d6xns9J1XYXP9992K6FUHZue65mOiHbIB9oDcsfbLMJrZI?=
 =?us-ascii?Q?hiBFYPOg8pd1RVEfNqC+IBzTowcN2nmIoVR0KtOlDp24LDb4zmTqTIXbNVZb?=
 =?us-ascii?Q?A0Do4BDpZyk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR10MB8374.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tx3kWBs9ugsWkRuMFwwX7hU5PwToi3QEYNpBjtzCvbWxxYwj1aJpxkdoahrY?=
 =?us-ascii?Q?JSYTxN4bOCS98DB+9c/IWvWKf0us87tdot8Ff8rjPMaMdhFvv3yHMXsr0N0r?=
 =?us-ascii?Q?twuFwKoBsmaDbImi/tjB+oAuzwsKjK400iS58Cshe7WoZ40IkefEiNxCKjj0?=
 =?us-ascii?Q?+QAyf+LBzHM0NIUd2P3H5SeF8SJAo9uAjuwxkFjiD5QCzNAUVpZlR/wFc7pp?=
 =?us-ascii?Q?MGzUF9Iv9OEEhbJjnQVDsrZrGXkfRuA6ETNU4HWL6ZSvuLZV/ETXpaA0uRUW?=
 =?us-ascii?Q?mHbjLsIz/kJ8Gyda0JkoRjV9ClLpYNjMFpAFh6nml9/PvOGlUE3VfPBgtIp9?=
 =?us-ascii?Q?iEmVoH62Xvf5QAhwySH6NtoNiBkZIsO+KIaZW3ZiEqs+n7N2E5l6yTZSF8lH?=
 =?us-ascii?Q?ldF3KpwbYdASGT/T14RiL9uwP9mpKwvOBN77ET9skyMPpB+32JUrf0TWLHA/?=
 =?us-ascii?Q?bwVBX2eO3QyD2URJggh2xp892VHfWyZTjoiT00QvxsLOr+RLbEH5X66O5FT9?=
 =?us-ascii?Q?Efo1ZkFO2ehUfwWixEP0YCeEkg/kP7X5yfd5QhPg+s0uAaoPIAF8ZemUFFTF?=
 =?us-ascii?Q?4aMPw625PVa5+1byjJ+ImT8JLSdDGq5t0GbfBW1D4gTKZVbI4eRp4ExHYLic?=
 =?us-ascii?Q?IdXGwAHTYV0NjGs7luUTR1QDNgPZqSLAkxR+7FoTZixULnLBWQXtGB273Lt6?=
 =?us-ascii?Q?Sj0V3FuXs1tyjLzgkKo7uDQAapB3/dYvQWCf8BGEMYW/6bTp5phnZdcS+pJY?=
 =?us-ascii?Q?UVcnnD4QeDYn+KOAFD5KGzin9lHZFC1z/pimRsKib5t7EEzXmaD/3lyOLel7?=
 =?us-ascii?Q?ceX+lnsnzJyZTP3jZiLcvlaKfiNYPNUIHfeOPajcwDNNSKp/7N5YxHslk9zb?=
 =?us-ascii?Q?k+XOR+/P9xArZFrPwRIZ89msc69OWQxp5UGe6oLs3iVGp5f03t7TL4hI5b2f?=
 =?us-ascii?Q?6vMY66gH8n50MwxX5iayRIaLaPqb6S5byNWGM/galtdpXsrutLsnUjonplfw?=
 =?us-ascii?Q?vFnshF7MCRBNK9UJzqkKZOwKoqIe5c6dM+Pfg97QPYTP0pVNY5LWxLFYoy0+?=
 =?us-ascii?Q?HHYpR3eYFfjILMTYDw/fKPSgGIHBeVls0CTi2Jf4MCAcC9eL7HX/hpaql5sz?=
 =?us-ascii?Q?xWN8NAjwtLI3CwrUIJzMbwqbi9CJm2qTSiKWTkNz65VTNHZGHZiaM86udEQ6?=
 =?us-ascii?Q?uiZCsYWklwSYmGr610p63Q4giR4/0R4Ny4BIyfdaLo2jnX3meZBJoJVXGt4V?=
 =?us-ascii?Q?++cpOJBA0D9lLHnodgqk9CdjaxXgo1Rx9XuXyQz1wBIMZ1CaJ21jP7aEq+oa?=
 =?us-ascii?Q?ME9n79sPk+UZOZcEZ/sWePMl+yTzhdF6NtlaR9s0QpmrJuVmLAzGmJubMZl5?=
 =?us-ascii?Q?wH7M112+NVMiX1qjL3qiIdzoHED7zVCRQJ6SdSvh14ZaPbZXzc6/AInteNVc?=
 =?us-ascii?Q?j3wFTQRC9PgMMDxA7vgNW2CJhGNFNOYKesc8vTSRM0JFJGvUg+KUU3a7Pk28?=
 =?us-ascii?Q?ownWTr/UkSOyflGUaYpzBI+69P3+5h+H+kz9mqL38xk1h77JLeDmTzAqw2Nz?=
 =?us-ascii?Q?rHv3Wo8FcXgGl2bdFhRV0MM79kA7269i94CiRyrmGL0XpCVcBmLnFbKMrIy8?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jtSoV66h/n4oyUfYt1XNwnxrfPVCTPaXgKk6vReIPlGt7+JIj6K7TYy+3zCguyzY0MFFWM/q0NR8zTo0h4b23YMP6EF2DGvL5h1hm0aEwC9B7ofw1ORvv0rSws6HP9DrdIcwYB1dN2pBXmVxmlAV67t5FGJK9ytHaYI554il/r0ymuKKOI9O65HSBGmCNSejhx+lNph3C6FS6BwCYPLqSooKh6I9Bbeb+Z5ISwu5bWEuWVPhxsszbe/e1+c6cap9QJyThwp9uNwlnfy8IPD7OJ0xBsWphmdECw15rGz7+ri0k+x5hcRerSMGS6qcojQPdiK+WUYOFKxbTEily5/YSAjO0+BFjkMqNuNu/wTp80OU+zv4nCe2CdkgmVDCNDMfVp5EH6QHMH5GbGDUume5AHkc4Ob99V4fIQQc6bYwQd881qn3ezlT5xLIBLqEHyzlGOhg+b0H3gCJqC+FwJjiZYuyenDsWXvNx1KmSsIk9UqOaOx8ytwuIeELMPQuVd/2iAAipGHG9za1aQrXFTe9YJ96JBPO21yDFUiazi9XvfVKXml5y3oPM3T9tK2tMXzdRWnr6pz9eFe05S7S2g2VsTJf7D3DcznHOUILCbjlY5A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c4944b0-432c-451b-0cb0-08dda58aa2af
X-MS-Exchange-CrossTenant-AuthSource: IA4PR10MB8374.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 06:15:01.1106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ehka7YbShYId3NvSvwT3CJb7p/rAJOtmMvw5DUYd/F7UdIODWOHp+gby3XatoJ7O7soTBj3jtSFUsh0SlQPwpiwBlUGnZ4l5VZ8c+xgGbmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8636
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070044
X-Proofpoint-GUID: Sdso9wpNooiLvVLBFUOnRWUxCScIYK4t
X-Authority-Analysis: v=2.4 cv=GcEXnRXL c=1 sm=1 tr=0 ts=6843d8e9 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=i1RnaPK3qI9C015Un20A:9 cc=ntf awl=host:14714
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA0NCBTYWx0ZWRfX43RES2wMZkxb diTRYPnfNhVZMqQJYxZrsfHoK+pYhdn9THJaqbrSTgbswymWNc1eZanQG9meSe+6OYWKRpvf8RU 3aH1vnZhISrK/kR3c3bYH0O3ds47qO41lseGF1eTHb5zkUazADOpV18I0RVF8Ih6X4ohfMRJklA
 7Da/llgOWlahdiBx84/1KRCoGm1n4+R5Cye+jlFj7MkgUdV9+BZNwgk6MefPL+MEnD4Jf7HZRfh 5A8TofjIs9KpHOXYY0StffJw8Uwisliv6Era3+HeV9mOq9rZ09vwJgpBPWT2JMozIfct06c/GUP L8qpdkgyNUYY+GPudBp58qLdZKun/fqb2MjsgErydZISvLSoA9B203z8N4qwQC1Y7BZuhgBnqrk
 yhlP890aYR8kmmhfRoufZv4m9yPeOfdCVY6J7qQRU5M6ridruaqZkdXV3BYThKvaRIbEgFFw
X-Proofpoint-ORIG-GUID: Sdso9wpNooiLvVLBFUOnRWUxCScIYK4t

To prepare for non-DOF section based USDT probe definitions, the data
passed from dtprobed to the USDT data parser is more generic.  The
dof_helper_t structure is passed first, followed by a block count, and
that number of data blocks, passed as a size followed by the content.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
---
 dtprobed/dof_stash.c                          |  11 +-
 dtprobed/dof_stash.h                          |   7 +-
 dtprobed/dtprobed.c                           |  62 +--
 libcommon/Build                               |   2 +-
 libcommon/usdt_parser.c                       | 227 +++++++++
 libcommon/{dof_parser.h => usdt_parser.h}     |  70 ++-
 libcommon/{dof_parser.c => usdt_parser_dof.c} | 462 ++++++------------
 .../{dof_parser_host.c => usdt_parser_host.c} |  46 +-
 libdtrace/dt_pid.c                            |   2 +-
 9 files changed, 513 insertions(+), 376 deletions(-)
 create mode 100644 libcommon/usdt_parser.c
 rename libcommon/{dof_parser.h => usdt_parser.h} (66%)
 rename libcommon/{dof_parser.c => usdt_parser_dof.c} (68%)
 rename libcommon/{dof_parser_host.c => usdt_parser_host.c} (71%)

diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
index 296987ad..6a4ecb86 100644
--- a/dtprobed/dof_stash.c
+++ b/dtprobed/dof_stash.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace; DOF state storage management.
- * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2024, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  *
@@ -1568,7 +1568,7 @@ int
 reparse_dof(int out, int in,
 	    int (*reparse)(int pid, int out, int in, dev_t dev, ino_t ino,
 			   dev_t unused1, ino_t unused2, dof_helper_t *dh,
-			   const void *in_buf, size_t in_bufsz, int reparsing),
+			   const usdt_data_t *data, int reparsing),
 	    int force)
 {
 	DIR *all_pids_dir;
@@ -1642,6 +1642,7 @@ reparse_dof(int out, int in,
 			size_t dof_size, dh_size;
 			void *dof = NULL;
 			void *dh = NULL;
+			usdt_data_t data;
 
 			if (errno != 0) {
 				fuse_log(FUSE_LOG_ERR, "reparsing DOF: cannot read per-PID DOF mappings for pid %s: %s\n",
@@ -1742,7 +1743,11 @@ reparse_dof(int out, int in,
 
 			fuse_log(FUSE_LOG_DEBUG, "Reparsing DOF for PID %s, mapping %s\n",
 				 pid_ent->d_name, mapping_ent->d_name);
-			if (reparse(pid, out, in, dev, ino, 0, 0, dh, dof, dof_size, 1) < 0)
+
+			data.buf = dof;
+			data.size = dof_size;
+			data.next = NULL;
+			if (reparse(pid, out, in, dev, ino, 0, 0, dh, &data, 1) < 0)
 				fuse_log(FUSE_LOG_ERR, "when reparsing DOF, cannot parse DOF for PID %s, mapping %s: ignored\n",
 					    pid_ent->d_name, mapping_ent->d_name);
 			free(dof);
diff --git a/dtprobed/dof_stash.h b/dtprobed/dof_stash.h
index d44a2bda..1017d2d2 100644
--- a/dtprobed/dof_stash.h
+++ b/dtprobed/dof_stash.h
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace; DOF storage for later probe removal.
- * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2024, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -12,7 +12,7 @@
 #include <stdint.h>
 
 #include <dt_list.h>
-#include "dof_parser.h"
+#include "usdt_parser.h"
 
 typedef struct dof_parsed_list {
 	dt_list_t list;
@@ -35,8 +35,7 @@ void dof_stash_prune_dead(void);
 int reparse_dof(int out, int in,
 		int (*reparse)(int pid, int out, int in, dev_t dev, ino_t ino,
 			       dev_t unused1, ino_t unused2, dof_helper_t *dh,
-			       const void *in_buf, size_t in_bufsz,
-			       int reparsing),
+			       const usdt_data_t *data, int reparsing),
 		int force);
 
 #endif
diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
index a9944894..dfdce02c 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -33,6 +33,7 @@
 #include <time.h>
 #include <unistd.h>
 #include <config.h>
+#include <libelf.h>
 
 #include <linux/seccomp.h>
 #include <sys/syscall.h>
@@ -62,7 +63,7 @@
 #include <dtrace/ioctl.h>
 
 #include <dt_list.h>
-#include "dof_parser.h"
+#include "usdt_parser.h"
 #include "dof_stash.h"
 #include "libproc.h"
 
@@ -96,8 +97,8 @@ static const struct cuse_lowlevel_ops dtprobed_clop = {
 
 static int
 process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
-	    dev_t exec_inum, dof_helper_t *dh, const void *in_buf,
-	    size_t in_bufsz, int reparsing);
+	    dev_t exec_inum, dof_helper_t *dh, const usdt_data_t *data,
+	    int reparsing);
 
 static void
 log_msg(enum fuse_log_level level, const char *fmt, va_list ap)
@@ -310,29 +311,29 @@ parse_dof(int in, int out)
 {
 	int ok;
 	dof_helper_t *dh;
-	dof_hdr_t *dof;
+	usdt_data_t *data;
 
-	dh = dof_copyin_helper(in);
+	dh = usdt_copyin_helper(in);
 	if (!dh)
 		return 0;
 
-	dof = dof_copyin_dof(in, out, &ok);
-	if (!dof) {
+	data = usdt_copyin_data(in, out, &ok);
+	if (!data) {
 		free(dh);
 		return ok;
 	}
 
-	dof_parse(out, dh, dof);
+	usdt_parse(out, dh, data);
 
 	return ok;
 }
 
 /*
- * Kick off the sandboxed DOF parser.  This is run in a seccomp()ed subprocess,
+ * Kick off the sandboxed USDT parser.  This is run in a seccomp()ed subprocess,
  * and sends a stream of dof_parsed_t back to this process.
  */
 static void
-dof_parser_start(void)
+usdt_parser_start(void)
 {
 	int parser_in[2], parser_out[2];
 	if ((pipe(parser_in) < 0) ||
@@ -395,10 +396,10 @@ dof_parser_start(void)
 }
 
 /*
- * Clean up wreckage if the DOF parser dies: optionally restart it.
+ * Clean up wreckage if the USDT parser dies: optionally restart it.
  */
 static void
-dof_parser_tidy(int restart)
+usdt_parser_tidy(int restart)
 {
 	int status = 0;
 
@@ -413,13 +414,13 @@ dof_parser_tidy(int restart)
 	close(parser_out_pipe);
 
 	if (restart)
-		dof_parser_start();
+		usdt_parser_start();
 }
 
 static dof_parsed_t *
-dof_read(pid_t pid, int in)
+usdt_read(pid_t pid, int in)
 {
-	dof_parsed_t *reply = dof_parser_host_read(in, timeout);
+	dof_parsed_t *reply = usdt_parser_host_read(in, timeout);
 
 	if (!reply)
 		return NULL;
@@ -497,6 +498,7 @@ helper_ioctl(fuse_req_t req, int cmd, void *arg,
 	dev_t dev = 0, exec_dev = 0;
 	ino_t inum = 0, exec_inum = 0;
 	int gen;
+	usdt_data_t data;
 
 	/*
 	 * We can just ignore FUSE_IOCTL_COMPAT: the 32-bit and 64-bit versions
@@ -687,9 +689,12 @@ chunks_done:
 		     &exec_dev, &exec_inum)) < 0)
 		goto process_err;
 
+	data.buf = (void *)buf;
+	data.size = userdata->dof_hdr.dofh_loadsz;
+	data.next = NULL;
 	if ((gen = process_dof(pid, parser_out_pipe, parser_in_pipe,
 			       dev, inum, exec_dev, exec_inum, &userdata->dh,
-			       buf, userdata->dof_hdr.dofh_loadsz, 0)) < 0)
+			       &data, 0)) < 0)
 		goto process_err;
 
 	if (fuse_reply_ioctl(req, gen, NULL, 0) < 0)
@@ -741,8 +746,8 @@ process_err:
  */
 static int
 process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
-	    dev_t exec_inum, dof_helper_t *dh, const void *in_buf,
-	    size_t in_bufsz, int reparsing)
+	    dev_t exec_inum, dof_helper_t *dh, const usdt_data_t *data,
+	    int reparsing)
 {
 	dof_parsed_t *provider;
 	size_t i;
@@ -753,8 +758,7 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
 
 	do {
 		errmsg = "DOF parser write failed";
-		while ((errno = dof_parser_host_write(out, dh,
-						      (dof_hdr_t *) in_buf)) == EAGAIN);
+		while ((errno = usdt_parser_host_write(out, dh, data)) == EAGAIN);
 		if (errno != 0)
 			goto err;
 
@@ -765,7 +769,7 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
 		 */
 
 		errmsg = "parsed DOF read failed";
-		provider = dof_read(pid, in);
+		provider = usdt_read(pid, in);
 		if (!provider) {
 			if (tries++ > 1)
 				goto err;
@@ -773,7 +777,7 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
 			 * Tidying reopens the parser in and out pipes: catch
 			 * up with this.
 			 */
-			dof_parser_tidy(1);
+			usdt_parser_tidy(1);
 			out = parser_out_pipe;
 			in = parser_in_pipe;
 			continue;
@@ -791,7 +795,7 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
 			 provider->provider.name, provider->provider.nprobes);
 
 		for (i = 0; i < provider->provider.nprobes; i++) {
-			dof_parsed_t *probe = dof_read(pid, in);
+			dof_parsed_t *probe = usdt_read(pid, in);
 			size_t j;
 
 			errmsg = "no probes in this provider, or parse state corrupt";
@@ -803,7 +807,7 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
 
 			j = 0;
 			do {
-				dof_parsed_t *tp = dof_read(pid, in);
+				dof_parsed_t *tp = usdt_read(pid, in);
 
 				errmsg = "no tracepoints in a probe, or parse state corrupt";
 				if (!tp || tp->type == DIT_PROVIDER ||
@@ -822,7 +826,7 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
 		}
 
 		errmsg = "subsequent provider read failed, or stream not properly terminated";
-		provider = dof_read(pid, in);
+		provider = usdt_read(pid, in);
 		if (!provider)
 			goto err;
 	}
@@ -834,7 +838,7 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
 
 	if (!reparsing)
 		if ((gen = dof_stash_add(pid, dev, inum, exec_dev, exec_inum, dh,
-					 in_buf, in_bufsz)) < 0)
+					 data->buf, data->size)) < 0)
 			goto fileio;
 
 	if (dof_stash_write_parsed(pid, dev, inum, &accum) < 0) {
@@ -860,7 +864,7 @@ fileio:
 
 proc_err:
 	dof_stash_free(&accum);
-	dof_parser_tidy(1);
+	usdt_parser_tidy(1);
 	return -1;
 }
 
@@ -1071,7 +1075,7 @@ main(int argc, char *argv[])
 		testing = 1;
 	}
 
-	dof_parser_start();
+	usdt_parser_start();
 
 	if (dof_stash_init(statedir) < 0)
 		exit(1);
@@ -1102,7 +1106,7 @@ main(int argc, char *argv[])
 
 	ret = loop();
 
-	dof_parser_tidy(0);
+	usdt_parser_tidy(0);
 	teardown_device();
 
 	if (ret == 0)
diff --git a/libcommon/Build b/libcommon/Build
index e8908e7c..f64545ed 100644
--- a/libcommon/Build
+++ b/libcommon/Build
@@ -9,7 +9,7 @@ LIBS += libcommon
 libcommon_TARGET = libcommon
 libcommon_DIR := $(current-dir)
 libcommon_CPPFLAGS := -Ilibcommon -Ilibproc -U_FORTIFY_SOURCE
-libcommon_SOURCES = dof_parser.c dof_parser_host.c dt_list.c
+libcommon_SOURCES = usdt_parser.c usdt_parser_dof.c usdt_parser_host.c dt_list.c
 libcommon_NOCFLAGS := -D_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1 -D_FORTIFY_SOURCE=2 -D_FORTIFY_SOURCE=3 -Wp,-U_FORTIFY_SOURCE,-D_FORTIFY_SOURCE=1 -Wp,-U_FORTIFY_SOURCE,-D_FORTIFY_SOURCE=2 -Wp,-U_FORTIFY_SOURCE,-D_FORTIFY_SOURCE=3
 libcommon_NOCPPFLAGS := -D_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1 -D_FORTIFY_SOURCE=2 -D_FORTIFY_SOURCE=3 -Wp,-U_FORTIFY_SOURCE,-D_FORTIFY_SOURCE=1 -Wp,-U_FORTIFY_SOURCE,-D_FORTIFY_SOURCE=2 -Wp,-U_FORTIFY_SOURCE,-D_FORTIFY_SOURCE=3
 libcommon_LIBSOURCES = libcommon
diff --git a/libcommon/usdt_parser.c b/libcommon/usdt_parser.c
new file mode 100644
index 00000000..f301fd56
--- /dev/null
+++ b/libcommon/usdt_parser.c
@@ -0,0 +1,227 @@
+/*
+ * Oracle Linux DTrace; USDT definitions parser.
+ * Copyright (c) 2010, 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#include <sys/compiler.h>
+#include <assert.h>
+#include <errno.h>
+#include <inttypes.h>
+#include <stdarg.h>
+#include <stddef.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <libelf.h>
+#include "usdt_parser.h"
+
+size_t			usdt_maxcount = 2;
+size_t			usdt_maxsize = 256 * 1024 * 1024;
+
+_dt_printflike_(3, 4)
+void
+usdt_error(int out, int err_no, const char *fmt, ...)
+{
+	dof_parsed_t *parsed;
+	size_t sz;
+	char *msg;
+	va_list ap;
+
+	/*
+	 * Not much we can do on OOM of errors other than abort, forcing a
+	 * parser restart, which hopefully will have enough memory to report the
+	 * error properly.
+	 */
+	va_start(ap, fmt);
+	if (vasprintf(&msg, fmt, ap) < 0)
+		abort();
+	va_end(ap);
+
+	sz = offsetof(dof_parsed_t, err.err) + strlen(msg) + 1;
+	parsed = malloc(sz);
+
+	if (!parsed)
+		abort();
+
+	memset(parsed, 0, sz);
+	parsed->size = sz;
+	parsed->type = DIT_ERR;
+	parsed->err.err_no = err_no;
+	strcpy(parsed->err.err, msg);
+
+	usdt_parser_write_one(out, parsed, parsed->size);
+	free(parsed);
+	free(msg);
+}
+
+static char *
+usdt_copyin(int in, char *buf_, size_t sz)
+{
+	char *buf = buf_;
+	size_t i;
+
+	if (!buf) {
+		buf = malloc(sz);
+		if (!buf)
+			abort();
+	}
+
+	memset(buf, 0, sz);
+
+	for (i = 0; i < sz; ) {
+		size_t ret;
+
+		ret = read(in, buf + i, sz - i);
+
+		if (ret < 0) {
+			switch (errno) {
+			case EINTR:
+				continue;
+			default:
+				goto err;
+			}
+		}
+
+		/*
+		 * EOF: parsing done, process shutting down or message
+		 * truncated.  Fail, in any case.
+		 */
+		if (ret == 0)
+			goto err;
+
+		i += ret;
+	}
+
+	return buf;
+
+err:
+	if (!buf_)
+		free(buf);
+	return NULL;
+}
+
+dof_helper_t *
+usdt_copyin_helper(int in)
+{
+	return (dof_helper_t *)usdt_copyin(in, NULL, sizeof(dof_helper_t));
+}
+
+static usdt_data_t *
+usdt_copyin_block(int in, int out, int *ok)
+{
+	usdt_data_t *data;
+
+	*ok = 1;
+
+	data = malloc(sizeof(usdt_data_t));
+	if (!data)
+		abort();
+
+	memset(data, 0, sizeof(usdt_data_t));
+
+	/* Get the size of the data block. */
+	if (!usdt_copyin(in, (char *)&data->size, sizeof(data->size)))
+		abort();
+
+	/* Validate the data size. */
+	if (data->size >= usdt_maxsize) {
+		usdt_error(out, E2BIG, "data size %zi exceeds maximum %zi",
+			   data->size, usdt_maxsize);
+		return NULL;
+	}
+
+	/* Get the data. */
+	data->buf = (void *)usdt_copyin(in, NULL, data->size);
+	if (!data->buf) {
+		*ok = 0;
+		free(data);
+		return NULL;
+	}
+
+	return data;
+}
+
+static void
+usdt_destroy_data(usdt_data_t *data)
+{
+	while (data) {
+		usdt_data_t *next = data->next;
+
+		free(data->buf);
+		free(data);
+		data = next;
+	}
+}
+
+usdt_data_t *
+usdt_copyin_data(int in, int out, int *ok)
+{
+	usdt_data_t *first = NULL, *last;
+	size_t cnt;
+
+	*ok = 1;
+
+	/* Get the number of data blocks to follow. */
+	if (!usdt_copyin(in, (char *)&cnt, sizeof(cnt)))
+		abort();
+
+	if (cnt >= usdt_maxcount) {
+		usdt_error(out, E2BIG, "block count %zi exceeds maximum %zi",
+			   cnt, usdt_maxcount);
+		return NULL;
+	}
+
+	/* Get the data blocks (for each, size followed by content). */
+	while (cnt-- > 0) {
+		usdt_data_t *blk;
+
+		if ((blk = usdt_copyin_block(in, out, ok)) == NULL)
+			goto err;
+
+		if (first == NULL)
+			first = last = blk;
+		else {
+			last->next = blk;
+			last = blk;
+		}
+	}
+
+	return first;
+
+err:
+	usdt_destroy_data(first);
+
+	return NULL;
+}
+
+static void
+usdt_destroy(dof_helper_t *dhp, usdt_data_t *data)
+{
+	free(dhp);
+	usdt_destroy_data(data);
+}
+
+void
+usdt_parse(int out, dof_helper_t *dhp, usdt_data_t *data)
+{
+	dof_parsed_t		eof;
+
+	if (usdt_parse_dof(out, dhp, data->buf) != 0)
+		goto err;
+
+	/*
+	 * Always emit an EOF, to wake up the caller if nothing else, but also
+	 * to notify the caller that there are no more providers to read.
+	 */
+	memset(&eof, 0, sizeof(dof_parsed_t));
+
+	eof.size = offsetof(dof_parsed_t, provider.nprobes);
+	eof.type = DIT_EOF;
+	usdt_parser_write_one(out, &eof, eof.size);
+
+err:
+	usdt_destroy(dhp, data);
+}
diff --git a/libcommon/dof_parser.h b/libcommon/usdt_parser.h
similarity index 66%
rename from libcommon/dof_parser.h
rename to libcommon/usdt_parser.h
index de6cea4c..9dd97e28 100644
--- a/libcommon/dof_parser.h
+++ b/libcommon/usdt_parser.h
@@ -1,22 +1,33 @@
 /*
- * Oracle Linux DTrace; DOF parser interface with the outside world
- * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Oracle Linux DTrace; USDT definitions parser interface.
+ * Copyright (c) 2022, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
 
-#ifndef	_DOF_PARSER_H
-#define	_DOF_PARSER_H
+#ifndef	_USDT_PARSER_H
+#define	_USDT_PARSER_H
 
 #include <inttypes.h>
 #include <stddef.h>
+#include <libelf.h>
 
 #include <dtrace/dof.h>
 #include <dtrace/helpers.h>
 
 /*
- * Result of DOF probe parsing.  The order of elements in the parsed stream
- * is:
+ * Data transfer unit for the DOF parser.
+ */
+typedef struct usdt_data	usdt_data_t;
+struct usdt_data {
+	size_t		size;
+	void		*buf;
+	usdt_data_t	*next;
+};
+
+/*
+ * Result of USDT definitions parsing.  The order of elements in the parsed
+ * stream is:
  *
  * DIT_PROVIDER (at least 1, which contains...)
  *   DIT_PROBE (at least 1, each of which has...)
@@ -156,55 +167,70 @@ typedef struct dof_parsed {
 } dof_parsed_t;
 
 /*
- * Host-side: in dof_parser_host.c.  The host is the
- * non-jailed process that talks to the jailed parser.
+ * Host-side: in usdt_parser_host.c.
+ * The host is the non-jailed process that talks to the jailed parser.
  */
 
 /*
- * Write the DOF to the parser pipe OUT.
+ * Write the USDT definitions data to the parser pipe OUT.
  *
  * Returns 0 on success or a positive errno value on error.
  */
-int dof_parser_host_write(int out, const dof_helper_t *dh, dof_hdr_t *dof);
+int usdt_parser_host_write(int out, const dof_helper_t *dh,
+			   const usdt_data_t *data);
 
 /*
- * Read a single DOF structure from a parser pipe.  Wait at most TIMEOUT seconds
- * to do so.
+ * Read a single dof_parsed_t structure from a parser pipe.  Wait at most
+ * TIMEOUT seconds to do so.
  *
  * Returns NULL and sets errno on error.
  */
-dof_parsed_t *dof_parser_host_read(int in, int timeout);
+dof_parsed_t *usdt_parser_host_read(int in, int timeout);
 
-/* Parser-side: in dof_parser.c.  */
+/* Parser-side: in usdt_parser.c.  */
+
+/*
+ * Report a parser error.
+ */
+void usdt_error(int out, int err_no, const char *fmt, ...);
 
 /*
  * Get a dof_helper_t from the input fd.
  *
  * Returns NULL on failure - no further processing is possible in that case.
  */
-dof_helper_t *dof_copyin_helper(int in);
+dof_helper_t *usdt_copyin_helper(int in);
 
 /*
- * Get a buffer of DOF from the input fd and sanity-check it.
+ * Get a USDT data block from the input fd.
  *
  * Set OK to zero if no further parsing is possible.
  */
-dof_hdr_t *dof_copyin_dof(int in, int out, int *ok);
+usdt_data_t *usdt_copyin_data(int in, int out, int *ok);
 
 /*
- * Parse probe info out of the passed-in dof_helper_t and dof_hdr_t DOF buffer,
- * and pass it out of OUT in the form of a stream of dof_parser_info_t.
+ * Parse probe info out of the passed-in dof_helper_t and USDT definitions data
+ * block and emit it to OUT in the form of a stream of dof_parser_info_t.
  */
-void dof_parse(int out, dof_helper_t *dhp, dof_hdr_t *dof);
+void usdt_parse(int out, dof_helper_t *dhp, usdt_data_t *data);
+
+/*
+ * Parse probe info out of the passed-in dof_helper_t and DOF section data and
+ * emit it to OUT in the form of a stream of dof_parser_info_t.
+ *
+ * Returns 0 on success or a positive errno value on error.
+ */
+int usdt_parse_dof(int out, dof_helper_t *dhp, dof_hdr_t *dof);
 
 /*
  * Shared host and parser-side.
  */
+
 /*
  * Write something to the parser pipe OUT.
  *
  * Returns 0 on success or a positive errno value on error.
  */
-int dof_parser_write_one(int out, const void *buf, size_t size);
+int usdt_parser_write_one(int out, const void *buf, size_t size);
 
-#endif	/* _DOF_PARSER_H */
+#endif	/* _USDT_PARSER_H */
diff --git a/libcommon/dof_parser.c b/libcommon/usdt_parser_dof.c
similarity index 68%
rename from libcommon/dof_parser.c
rename to libcommon/usdt_parser_dof.c
index ec80cee8..6a7eb377 100644
--- a/libcommon/dof_parser.c
+++ b/libcommon/usdt_parser_dof.c
@@ -1,6 +1,6 @@
 /*
- * Oracle Linux DTrace; DOF parser.
- * Copyright (c) 2010, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Oracle Linux DTrace; USDT definitions parser - DOF.
+ * Copyright (c) 2010, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -15,12 +15,11 @@
 #include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
-#include "dof_parser.h"
+#include <libelf.h>
+#include "usdt_parser.h"
 
 #define IS_ALIGNED(x, a) (((x) & ((typeof(x))(a) - 1)) == 0)
 
-size_t			dof_maxsize = 256 * 1024 * 1024;
-
 typedef struct dtrace_helper_probedesc {
 	char *dthpb_prov;
 	char *dthpb_mod;
@@ -48,144 +47,9 @@ static void dt_dbg_dof(const char *fmt, ...)
 #endif
 }
 
-_dt_printflike_(3, 4)
-static void dof_error(int out, int err_no, const char *fmt, ...)
-{
-	dof_parsed_t *parsed;
-	size_t sz;
-	char *msg;
-	va_list ap;
-
-	/*
-	 * Not much we can do on OOM of errors other than abort, forcing a
-	 * parser restart, which hopefully will have enough memory to report the
-	 * error properly.
-	 */
-	va_start(ap, fmt);
-	if (vasprintf(&msg, fmt, ap) < 0)
-		abort();
-	va_end(ap);
-
-	sz = offsetof(dof_parsed_t, err.err) + strlen(msg) + 1;
-	parsed = malloc(sz);
-
-	if (!parsed)
-		abort();
-
-	memset(parsed, 0, sz);
-	parsed->size = sz;
-	parsed->type = DIT_ERR;
-	parsed->err.err_no = err_no;
-	strcpy(parsed->err.err, msg);
-
-	dof_parser_write_one(out, parsed, parsed->size);
-	free(parsed);
-	free(msg);
-}
-
-static char *
-dof_copyin(int in, char *buf_, size_t sz)
-{
-	char *buf = buf_;
-	size_t i;
-
-	if (!buf) {
-		buf = malloc(sz);
-		if (!buf)
-			abort();
-	}
-
-	memset(buf, 0, sz);
-
-	for (i = 0; i < sz; ) {
-		size_t ret;
-
-		ret = read(in, buf + i, sz - i);
-
-		if (ret < 0) {
-			switch (errno) {
-			case EINTR:
-				continue;
-			default:
-				goto err;
-			}
-		}
-
-		/*
-		 * EOF: parsing done, process shutting down or message
-		 * truncated.  Fail, in any case.
-		 */
-		if (ret == 0)
-			goto err;
-
-		i += ret;
-	}
-
-	return buf;
-
-err:
-	if (!buf_)
-		free(buf);
-	return NULL;
-}
-
-dof_helper_t *
-dof_copyin_helper(int in)
-{
-	return (dof_helper_t *)dof_copyin(in, NULL, sizeof(dof_helper_t));
-}
-
-dof_hdr_t *
-dof_copyin_dof(int in, int out, int *ok)
-{
-	dof_hdr_t *dof;
-
-	*ok = 1;
-
-	/* First get the header, which gives the size of everything else. */
-	dof = (dof_hdr_t *)dof_copyin(in, NULL, sizeof(dof_hdr_t));
-	if (!dof)
-		abort();
-
-	/* Validate the DOF load size. */
-	if (dof->dofh_loadsz >= dof_maxsize) {
-		dof_error(out, E2BIG, "load size %zi exceeds maximum %zi",
-			  dof->dofh_loadsz, dof_maxsize);
-		return NULL;
-	}
-
-	if (dof->dofh_loadsz < sizeof(dof_hdr_t)) {
-		dof_error(out, EINVAL, "invalid load size %zi, "
-			  "smaller than header size %zi", dof->dofh_loadsz,
-			  sizeof(dof_hdr_t));
-		return NULL;
-	}
-
-	/* Resize the allocated memory to fit the actual data as well. */
-	dof = realloc(dof, dof->dofh_loadsz);
-	if (!dof)
-		abort();
-
-	/* Read the actual data in the allocated buffer. */
-	if (!dof_copyin(in, ((char *)dof) + sizeof(dof_hdr_t),
-			dof->dofh_loadsz - sizeof(dof_hdr_t))) {
-		*ok = 0;
-		free(dof);
-		return NULL;
-	}
-
-	return dof;
-}
-
-static void dof_destroy(dof_helper_t *dhp, dof_hdr_t *dof)
-{
-	free(dhp);
-	free(dof);
-}
-
 /*
  * Return the dof_sec_t pointer corresponding to a given section index.  If the
- * index is not valid, dof_error() is called and NULL is returned.  If a type
+ * index is not valid, usdt_error() is called and NULL is returned.  If a type
  * other than DOF_SECT_NONE is specified, the header is checked against this
  * type and NULL is returned if the types do not match.
  */
@@ -199,19 +63,19 @@ static dof_sec_t *dof_sect(int out, dof_hdr_t *dof,
 					i * dof->dofh_secsize);
 
 	if (i >= dof->dofh_secnum) {
-		dof_error(out, EINVAL, "referenced section index %u is "
-			  "invalid, above %u", i, dof->dofh_secnum);
+		usdt_error(out, EINVAL, "referenced section index %u is "
+			   "invalid, above %u", i, dof->dofh_secnum);
 		return NULL;
 	}
 
 	if (!(sec->dofs_flags & DOF_SECF_LOAD)) {
-		dof_error(out, EINVAL, "referenced section %u is not loadable", i);
+		usdt_error(out, EINVAL, "referenced section %u is not loadable", i);
 		return NULL;
 	}
 
 	if (sectype != DOF_SECT_NONE && sectype != sec->dofs_type) {
-		dof_error(out, EINVAL, "referenced section %u is the wrong type, "
-			  "%u, not %u", i, sec->dofs_type, sectype);
+		usdt_error(out, EINVAL, "referenced section %u is the wrong type, "
+			   "%u, not %u", i, sec->dofs_type, sectype);
 		return NULL;
 	}
 
@@ -237,10 +101,10 @@ dof_relocate(int out, dof_hdr_t *dof, dof_sec_t *sec, uint64_t ubase)
 
 	if (sec->dofs_size < sizeof(dof_relohdr_t) ||
 	    sec->dofs_align != sizeof(dof_secidx_t)) {
-		dof_error(out, EINVAL, "invalid relocation header: "
-			  "size %zi (expected %zi); alignment %u (expected %zi)",
-			  sec->dofs_size, sizeof(dof_relohdr_t),
-			  sec->dofs_align, sizeof(dof_secidx_t));
+		usdt_error(out, EINVAL, "invalid relocation header: "
+			   "size %zi (expected %zi); alignment %u (expected %zi)",
+			   sec->dofs_size, sizeof(dof_relohdr_t),
+			   sec->dofs_align, sizeof(dof_secidx_t));
 		return -1;
 	}
 
@@ -249,14 +113,14 @@ dof_relocate(int out, dof_hdr_t *dof, dof_sec_t *sec, uint64_t ubase)
 	ts = dof_sect(out, dof, DOF_SECT_NONE, dofr->dofr_tgtsec);
 
 	if (ss == NULL || rs == NULL || ts == NULL)
-		return -1; /* dof_error() has been called already */
+		return -1; /* usdt_error() has been called already */
 
 	if (rs->dofs_entsize < sizeof(dof_relodesc_t) ||
 	    rs->dofs_align != sizeof(uint64_t)) {
-		dof_error(out, EINVAL, "invalid relocation section: entsize %i "
-			  "(expected %zi); alignment %u (expected %zi)",
-			  rs->dofs_entsize, sizeof(dof_relodesc_t),
-			  rs->dofs_align, sizeof(uint64_t));
+		usdt_error(out, EINVAL, "invalid relocation section: entsize %i "
+			   "(expected %zi); alignment %u (expected %zi)",
+			   rs->dofs_entsize, sizeof(dof_relodesc_t),
+			   rs->dofs_align, sizeof(uint64_t));
 		return -1;
 	}
 
@@ -273,14 +137,14 @@ dof_relocate(int out, dof_hdr_t *dof, dof_sec_t *sec, uint64_t ubase)
 			if (r->dofr_offset >= ts->dofs_size ||
 			    r->dofr_offset + sizeof(uint64_t) >
 				ts->dofs_size) {
-				dof_error(out, EINVAL, "bad relocation offset: "
-					  "offset %zi, section size %zi)",
-					  r->dofr_offset, ts->dofs_size);
+				usdt_error(out, EINVAL, "bad relocation offset: "
+					   "offset %zi, section size %zi)",
+					   r->dofr_offset, ts->dofs_size);
 				return -1;
 			}
 
 			if (!IS_ALIGNED(taddr, sizeof(uint64_t))) {
-				dof_error(out, EINVAL, "misaligned setx relo");
+				usdt_error(out, EINVAL, "misaligned setx relo");
 				return -1;
 			}
 
@@ -306,8 +170,8 @@ dof_relocate(int out, dof_hdr_t *dof, dof_sec_t *sec, uint64_t ubase)
 
 			break;
 		default:
-			dof_error(out, EINVAL, "invalid relocation type %i",
-				r->dofr_type);
+			usdt_error(out, EINVAL, "invalid relocation type %i",
+				   r->dofr_type);
 			return -1;
 		}
 
@@ -331,8 +195,8 @@ dof_slurp(int out, dof_hdr_t *dof, uint64_t ubase)
 	uint_t		i;
 
 	if (_dt_unlikely_(dof->dofh_loadsz < sizeof(dof_hdr_t))) {
-		dof_error(out, EINVAL, "load size %zi smaller than header %zi",
-			  dof->dofh_loadsz, sizeof(dof_hdr_t));
+		usdt_error(out, EINVAL, "load size %zi smaller than header %zi",
+			   dof->dofh_loadsz, sizeof(dof_hdr_t));
 		return -1;
 	}
 
@@ -347,72 +211,72 @@ dof_slurp(int out, dof_hdr_t *dof, uint64_t ubase)
 	 */
 	if (memcmp(&dof->dofh_ident[DOF_ID_MAG0], DOF_MAG_STRING,
 		   DOF_MAG_STRLEN) != 0) {
-		dof_error(out, EINVAL, "DOF magic string mismatch: %c%c%c%c "
-			  "versus %c%c%c%c\n", dof->dofh_ident[DOF_ID_MAG0],
-			  dof->dofh_ident[DOF_ID_MAG1],
-			  dof->dofh_ident[DOF_ID_MAG2],
-			  dof->dofh_ident[DOF_ID_MAG3],
-			  DOF_MAG_STRING[0],
-			  DOF_MAG_STRING[1],
-			  DOF_MAG_STRING[2],
-			  DOF_MAG_STRING[3]);
+		usdt_error(out, EINVAL, "DOF magic string mismatch: %c%c%c%c "
+			   "versus %c%c%c%c\n", dof->dofh_ident[DOF_ID_MAG0],
+			   dof->dofh_ident[DOF_ID_MAG1],
+			   dof->dofh_ident[DOF_ID_MAG2],
+			   dof->dofh_ident[DOF_ID_MAG3],
+			   DOF_MAG_STRING[0],
+			   DOF_MAG_STRING[1],
+			   DOF_MAG_STRING[2],
+			   DOF_MAG_STRING[3]);
 		return -1;
 	}
 
 	if (dof->dofh_ident[DOF_ID_MODEL] != DOF_MODEL_ILP32 &&
 	    dof->dofh_ident[DOF_ID_MODEL] != DOF_MODEL_LP64) {
-		dof_error(out, EINVAL, "DOF has invalid data model: %i",
-			  dof->dofh_ident[DOF_ID_MODEL]);
+		usdt_error(out, EINVAL, "DOF has invalid data model: %i",
+			   dof->dofh_ident[DOF_ID_MODEL]);
 		return -1;
 	}
 
 	if (dof->dofh_ident[DOF_ID_ENCODING] != DOF_ENCODE_NATIVE) {
-		dof_error(out, EINVAL, "DOF encoding mismatch: %i, expected %i",
-			  dof->dofh_ident[DOF_ID_ENCODING], DOF_ENCODE_NATIVE);
+		usdt_error(out, EINVAL, "DOF encoding mismatch: %i, expected %i",
+			   dof->dofh_ident[DOF_ID_ENCODING], DOF_ENCODE_NATIVE);
 		return -1;
 	}
 
 	if (dof->dofh_ident[DOF_ID_VERSION] != DOF_VERSION_1 &&
 	    dof->dofh_ident[DOF_ID_VERSION] != DOF_VERSION_2 &&
 	    dof->dofh_ident[DOF_ID_VERSION] != DOF_VERSION_3) {
-		dof_error(out, EINVAL, "DOF version mismatch: %i",
-			  dof->dofh_ident[DOF_ID_VERSION]);
+		usdt_error(out, EINVAL, "DOF version mismatch: %i",
+			   dof->dofh_ident[DOF_ID_VERSION]);
 		return -1;
 	}
 
 	if (dof->dofh_ident[DOF_ID_DIFVERS] != DIF_VERSION_2) {
-		dof_error(out, EINVAL, "DOF uses unsupported instruction set %i",
-			dof->dofh_ident[DOF_ID_DIFVERS]);
+		usdt_error(out, EINVAL, "DOF uses unsupported instruction set %i",
+			   dof->dofh_ident[DOF_ID_DIFVERS]);
 		return -1;
 	}
 
 	if (dof->dofh_ident[DOF_ID_DIFIREG] > DIF_DIR_NREGS) {
-		dof_error(out, EINVAL, "DOF uses too many integer registers: %i > %i",
-			  dof->dofh_ident[DOF_ID_DIFIREG], DIF_DIR_NREGS);
+		usdt_error(out, EINVAL, "DOF uses too many integer registers: %i > %i",
+			   dof->dofh_ident[DOF_ID_DIFIREG], DIF_DIR_NREGS);
 		return -1;
 	}
 
 	if (dof->dofh_ident[DOF_ID_DIFTREG] > DIF_DTR_NREGS) {
-		dof_error(out, EINVAL, "DOF uses too many tuple registers: %i > %i",
-			  dof->dofh_ident[DOF_ID_DIFTREG], DIF_DTR_NREGS);
+		usdt_error(out, EINVAL, "DOF uses too many tuple registers: %i > %i",
+			   dof->dofh_ident[DOF_ID_DIFTREG], DIF_DTR_NREGS);
 		return -1;
 	}
 
 	for (i = DOF_ID_PAD; i < DOF_ID_SIZE; i++) {
 		if (dof->dofh_ident[i] != 0) {
-			dof_error(out, EINVAL, "DOF has invalid ident byte set: %i = %i",
-				  i, dof->dofh_ident[i]);
+			usdt_error(out, EINVAL, "DOF has invalid ident byte set: %i = %i",
+				   i, dof->dofh_ident[i]);
 			return -1;
 		}
 	}
 
 	if (dof->dofh_flags & ~DOF_FL_VALID) {
-		dof_error(out, EINVAL, "DOF has invalid flag bits set: %xi", dof->dofh_flags);
+		usdt_error(out, EINVAL, "DOF has invalid flag bits set: %xi", dof->dofh_flags);
 		return -1;
 	}
 
 	if (dof->dofh_secsize == 0) {
-		dof_error(out, EINVAL, "zero section header size");
+		usdt_error(out, EINVAL, "zero section header size");
 		return -1;
 	}
 
@@ -425,18 +289,18 @@ dof_slurp(int out, dof_hdr_t *dof, uint64_t ubase)
 
 	if (dof->dofh_secoff > len || seclen > len ||
 	    dof->dofh_secoff + seclen > len) {
-		dof_error(out, EINVAL, "truncated section headers: %zi, %zi, %zi",
-			  dof->dofh_secoff, len, seclen);
+		usdt_error(out, EINVAL, "truncated section headers: %zi, %zi, %zi",
+			   dof->dofh_secoff, len, seclen);
 		return -1;
 	}
 
 	if (!IS_ALIGNED(dof->dofh_secoff, sizeof(uint64_t))) {
-		dof_error(out, EINVAL, "misaligned section headers");
+		usdt_error(out, EINVAL, "misaligned section headers");
 		return -1;
 	}
 
 	if (!IS_ALIGNED(dof->dofh_secsize, sizeof(uint64_t))) {
-		dof_error(out, EINVAL, "misaligned section size");
+		usdt_error(out, EINVAL, "misaligned section size");
 		return -1;
 	}
 
@@ -454,8 +318,8 @@ dof_slurp(int out, dof_hdr_t *dof, uint64_t ubase)
 
 		if (DOF_SEC_ISLOADABLE(sec->dofs_type) &&
 		    !(sec->dofs_flags & DOF_SECF_LOAD)) {
-			dof_error(out, EINVAL, "loadable section %i with load flag unset",
-				i);
+			usdt_error(out, EINVAL, "loadable section %i with load flag unset",
+				   i);
 			return -1;
 		}
 
@@ -466,30 +330,30 @@ dof_slurp(int out, dof_hdr_t *dof, uint64_t ubase)
 			continue;
 
 		if (sec->dofs_align & (sec->dofs_align - 1)) {
-			dof_error(out, EINVAL, "bad section %i alignment %x", i,
-				sec->dofs_align);
+			usdt_error(out, EINVAL, "bad section %i alignment %x",
+				   i, sec->dofs_align);
 			return -1;
 		}
 
 		if (sec->dofs_offset & (sec->dofs_align - 1)) {
-			dof_error(out, EINVAL, "misaligned section %i: %lx, "
-				  "stated alignment %xi", i, sec->dofs_offset,
-				  sec->dofs_align);
+			usdt_error(out, EINVAL, "misaligned section %i: %lx, "
+				   "stated alignment %xi", i, sec->dofs_offset,
+				   sec->dofs_align);
 			return -1;
 		}
 
 		if (sec->dofs_offset > len || sec->dofs_size > len ||
 		    sec->dofs_offset + sec->dofs_size > len) {
-			dof_error(out, EINVAL, "corrupt section %i header: "
-				  "offset %lx, size %lx, len %lx", i,
-				  sec->dofs_offset, sec->dofs_size, len);
+			usdt_error(out, EINVAL, "corrupt section %i header: "
+				   "offset %lx, size %lx, len %lx", i,
+				   sec->dofs_offset, sec->dofs_size, len);
 			return -1;
 		}
 
 		if (sec->dofs_type == DOF_SECT_STRTAB && *((char *)daddr +
 		    sec->dofs_offset + sec->dofs_size - 1) != '\0') {
-			dof_error(out, EINVAL, "section %i: non-0-terminated "
-				  "string table", i);
+			usdt_error(out, EINVAL, "section %i: non-0-terminated "
+				   "string table", i);
 			return -1;
 		}
 	}
@@ -540,13 +404,13 @@ validate_provider(int out, dof_hdr_t *dof, dof_sec_t *sec)
 	uint_t		nprobes, j, k;
 
 	if (_dt_unlikely_(sec->dofs_type != DOF_SECT_PROVIDER)) {
-		dof_error(out, EINVAL, "DOF is not provider DOF: %i", sec->dofs_type);
+		usdt_error(out, EINVAL, "DOF is not provider DOF: %i", sec->dofs_type);
 		return -1;
 	}
 
 	if (sec->dofs_offset & (sizeof(uint_t) - 1)) {
-		dof_error(out, EINVAL, "misaligned section offset: %lx",
-			sec->dofs_offset);
+		usdt_error(out, EINVAL, "misaligned section offset: %lx",
+			   sec->dofs_offset);
 		return -1;
 	}
 
@@ -558,8 +422,8 @@ validate_provider(int out, dof_hdr_t *dof, dof_sec_t *sec)
 	    ((dof->dofh_ident[DOF_ID_VERSION] == DOF_VERSION_1)
 			? offsetof(dof_provider_t, dofpv_prenoffs)
 			: sizeof(dof_provider_t))) {
-		dof_error(out, EINVAL, "provider section too small: %lx",
-			sec->dofs_size);
+		usdt_error(out, EINVAL, "provider section too small: %lx",
+			   sec->dofs_size);
 		return -1;
 	}
 
@@ -587,45 +451,45 @@ validate_provider(int out, dof_hdr_t *dof, dof_sec_t *sec)
 	strtab = (char *)(uintptr_t)(daddr + str_sec->dofs_offset);
 
 	if (prov->dofpv_name >= str_sec->dofs_size) {
-		dof_error(out, EINVAL, "invalid provider name offset: %u > %zi",
-			  prov->dofpv_name, str_sec->dofs_size);
+		usdt_error(out, EINVAL, "invalid provider name offset: %u > %zi",
+			   prov->dofpv_name, str_sec->dofs_size);
 		return -1;
 	}
 
 	if (strlen(strtab + prov->dofpv_name) >= DTRACE_PROVNAMELEN) {
-		dof_error(out, EINVAL, "provider name too long: %s",
-			  strtab + prov->dofpv_name);
+		usdt_error(out, EINVAL, "provider name too long: %s",
+			   strtab + prov->dofpv_name);
 		return -1;
 	}
 
 	if (prb_sec->dofs_entsize == 0 ||
 	    prb_sec->dofs_entsize > prb_sec->dofs_size) {
-		dof_error(out, EINVAL, "invalid entry size %x, max %lx",
-			  prb_sec->dofs_entsize, prb_sec->dofs_size);
+		usdt_error(out, EINVAL, "invalid entry size %x, max %lx",
+			   prb_sec->dofs_entsize, prb_sec->dofs_size);
 		return -1;
 	}
 
 	if (prb_sec->dofs_entsize & (sizeof(uintptr_t) - 1)) {
-		dof_error(out, EINVAL, "misaligned entry size %x",
-			  prb_sec->dofs_entsize);
+		usdt_error(out, EINVAL, "misaligned entry size %x",
+			   prb_sec->dofs_entsize);
 		return -1;
 	}
 
 	if (off_sec->dofs_entsize != sizeof(uint32_t)) {
-		dof_error(out, EINVAL, "invalid entry size %x",
-			  off_sec->dofs_entsize);
+		usdt_error(out, EINVAL, "invalid entry size %x",
+			   off_sec->dofs_entsize);
 		return -1;
 	}
 
 	if (off_sec->dofs_offset & (sizeof(uint32_t) - 1)) {
-		dof_error(out, EINVAL, "misaligned section offset %lx",
-			  off_sec->dofs_offset);
+		usdt_error(out, EINVAL, "misaligned section offset %lx",
+			   off_sec->dofs_offset);
 		return -1;
 	}
 
 	if (arg_sec->dofs_entsize != sizeof(uint8_t)) {
-		dof_error(out, EINVAL, "invalid entry size %x",
-			  arg_sec->dofs_entsize);
+		usdt_error(out, EINVAL, "invalid entry size %x",
+			   arg_sec->dofs_entsize);
 		return -1;
 	}
 
@@ -644,28 +508,28 @@ validate_provider(int out, dof_hdr_t *dof, dof_sec_t *sec)
 			 j * prb_sec->dofs_entsize);
 
 		if (prb->dofpr_func >= str_sec->dofs_size) {
-			dof_error(out, EINVAL, "invalid function name: "
-				  "strtab offset %x, max %lx", prb->dofpr_func,
-				  str_sec->dofs_size);
+			usdt_error(out, EINVAL, "invalid function name: "
+				   "strtab offset %x, max %lx", prb->dofpr_func,
+				   str_sec->dofs_size);
 			return -1;
 		}
 
 		if (strlen(strtab + prb->dofpr_func) >= DTRACE_FUNCNAMELEN) {
-			dof_error(out, EINVAL, "function name %s too long",
-				  strtab + prb->dofpr_func);
+			usdt_error(out, EINVAL, "function name %s too long",
+				   strtab + prb->dofpr_func);
 			return -1;
 		}
 
 		if (prb->dofpr_name >= str_sec->dofs_size) {
-			dof_error(out, EINVAL, "invalid probe name: "
-				  "strtab offset %x, max %lx", prb->dofpr_name,
-				str_sec->dofs_size);
+			usdt_error(out, EINVAL, "invalid probe name: "
+				   "strtab offset %x, max %lx", prb->dofpr_name,
+				   str_sec->dofs_size);
 			return -1;
 		}
 
 		if (strlen(strtab + prb->dofpr_name) >= DTRACE_NAMELEN) {
-			dof_error(out, EINVAL, "probe name %s too long",
-				strtab + prb->dofpr_name);
+			usdt_error(out, EINVAL, "probe name %s too long",
+				   strtab + prb->dofpr_name);
 			return -1;
 		}
 
@@ -676,10 +540,10 @@ validate_provider(int out, dof_hdr_t *dof, dof_sec_t *sec)
 		if (prb->dofpr_offidx + prb->dofpr_noffs < prb->dofpr_offidx ||
 		    (prb->dofpr_offidx + prb->dofpr_noffs) *
 		    off_sec->dofs_entsize > off_sec->dofs_size) {
-			dof_error(out, EINVAL, "invalid probe offset %x "
-				  "(offset count %x, section entsize %x, size %lx)",
-				  prb->dofpr_offidx, prb->dofpr_noffs,
-				  off_sec->dofs_entsize, off_sec->dofs_size);
+			usdt_error(out, EINVAL, "invalid probe offset %x "
+				   "(offset count %x, section entsize %x, size %lx)",
+				   prb->dofpr_offidx, prb->dofpr_noffs,
+				   off_sec->dofs_entsize, off_sec->dofs_size);
 			return -1;
 		}
 
@@ -693,8 +557,8 @@ validate_provider(int out, dof_hdr_t *dof, dof_sec_t *sec)
 			if (enoff_sec == NULL) {
 				if (prb->dofpr_enoffidx != 0 ||
 				    prb->dofpr_nenoffs != 0) {
-					dof_error(out, EINVAL,
-						  "is-enabled offsets with null section");
+					usdt_error(out, EINVAL,
+						   "is-enabled offsets with null section");
 					return -1;
 				}
 			} else if (prb->dofpr_enoffidx + prb->dofpr_nenoffs <
@@ -702,29 +566,29 @@ validate_provider(int out, dof_hdr_t *dof, dof_sec_t *sec)
 				   (prb->dofpr_enoffidx + prb->dofpr_nenoffs) *
 				   enoff_sec->dofs_entsize >
 				   enoff_sec->dofs_size) {
-				dof_error(out, EINVAL, "invalid is-enabled offset %x "
-					  "(offset count %x, section entsize %x, size %lx)",
-					  prb->dofpr_enoffidx, prb->dofpr_nenoffs,
-					  enoff_sec->dofs_entsize, enoff_sec->dofs_size);
+				usdt_error(out, EINVAL, "invalid is-enabled offset %x "
+					   "(offset count %x, section entsize %x, size %lx)",
+					   prb->dofpr_enoffidx, prb->dofpr_nenoffs,
+					   enoff_sec->dofs_entsize, enoff_sec->dofs_size);
 				return -1;
 			}
 
 			if (prb->dofpr_noffs + prb->dofpr_nenoffs == 0) {
-				dof_error(out, EINVAL, "zero probe and is-enabled offsets");
+				usdt_error(out, EINVAL, "zero probe and is-enabled offsets");
 				return -1;
 			}
 		} else if (prb->dofpr_noffs == 0) {
-			dof_error(out, EINVAL, "zero probe offsets");
+			usdt_error(out, EINVAL, "zero probe offsets");
 			return -1;
 		}
 
 		if (prb->dofpr_argidx + prb->dofpr_xargc < prb->dofpr_argidx ||
 		    (prb->dofpr_argidx + prb->dofpr_xargc) *
 		    arg_sec->dofs_entsize > arg_sec->dofs_size) {
-			dof_error(out, EINVAL, "invalid args, idx %x "
-				  "(offset count %x, section entsize %x, size %lx)",
-				  prb->dofpr_argidx, prb->dofpr_xargc,
-				  arg_sec->dofs_entsize, arg_sec->dofs_size);
+			usdt_error(out, EINVAL, "invalid args, idx %x "
+				   "(offset count %x, section entsize %x, size %lx)",
+				   prb->dofpr_argidx, prb->dofpr_xargc,
+				   arg_sec->dofs_entsize, arg_sec->dofs_size);
 			return -1;
 		}
 
@@ -732,15 +596,15 @@ validate_provider(int out, dof_hdr_t *dof, dof_sec_t *sec)
 		typestr = strtab + prb->dofpr_nargv;
 		for (k = 0; k < prb->dofpr_nargc; k++) {
 			if (typeidx >= str_sec->dofs_size) {
-				dof_error(out, EINVAL, "bad native argument type "
-					  "for arg %i: %x", k, typeidx);
+				usdt_error(out, EINVAL, "bad native argument type "
+					   "for arg %i: %x", k, typeidx);
 				return -1;
 			}
 
 			typesz = strlen(typestr) + 1;
 			if (typesz > DTRACE_ARGTYPELEN) {
-				dof_error(out, EINVAL, "native argument type for arg %i "
-					  "too long: %s", k, typestr);
+				usdt_error(out, EINVAL, "native argument type for arg %i "
+					   "too long: %s", k, typestr);
 				return -1;
 			}
 
@@ -752,23 +616,23 @@ validate_provider(int out, dof_hdr_t *dof, dof_sec_t *sec)
 		typestr = strtab + prb->dofpr_xargv;
 		for (k = 0; k < prb->dofpr_xargc; k++) {
 			if (arg[prb->dofpr_argidx + k] > prb->dofpr_nargc) {
-				dof_error(out, EINVAL, "bad native argument index "
-					  "for arg %i: %i (max %i)", k,
-					  arg[prb->dofpr_argidx + k],
-					  prb->dofpr_nargc);
+				usdt_error(out, EINVAL, "bad native argument index "
+					   "for arg %i: %i (max %i)", k,
+					   arg[prb->dofpr_argidx + k],
+					   prb->dofpr_nargc);
 				return -1;
 			}
 
 			if (typeidx >= str_sec->dofs_size) {
-				dof_error(out, EINVAL, "bad translated argument type "
-					  "for arg %i: %x", k, typeidx);
+				usdt_error(out, EINVAL, "bad translated argument type "
+					   "for arg %i: %x", k, typeidx);
 				return -1;
 			}
 
 			typesz = strlen(typestr) + 1;
 			if (typesz > DTRACE_ARGTYPELEN) {
-				dof_error(out, EINVAL, "translated argument type for arg %i "
-					  "too long: %s", k, typestr);
+				usdt_error(out, EINVAL, "translated argument type for arg %i "
+					   "too long: %s", k, typestr);
 				return -1;
 			}
 
@@ -798,7 +662,7 @@ emit_tp(int out, uint64_t base, uint64_t offs, int is_enabled)
 	tp.type = DIT_TRACEPOINT;
 	tp.tracepoint.addr = base + offs;
 	tp.tracepoint.is_enabled = is_enabled;
-	dof_parser_write_one(out, &tp, tp.size);
+	usdt_parser_write_one(out, &tp, tp.size);
 
 	dt_dbg_dof("        Tracepoint at 0x%lx (0x%llx + 0x%x)%s\n",
 		   base + offs, base, offs, is_enabled ? " (is_enabled)" : "");
@@ -823,9 +687,9 @@ validate_probe(int out, dtrace_helper_probedesc_t *dhpb)
 	for (i = 1; i < dhpb->dthpb_noffs; i++) {
 		if (dhpb->dthpb_base + dhpb->dthpb_offs[i] <=
 		    dhpb->dthpb_base + dhpb->dthpb_offs[i - 1]) {
-			dof_error(out, EINVAL, "non-unique USDT offsets at %i: %li <= %li",
-				  i, dhpb->dthpb_base + dhpb->dthpb_offs[i],
-				  dhpb->dthpb_base + dhpb->dthpb_offs[i - 1]);
+			usdt_error(out, EINVAL, "non-unique USDT offsets at %i: %li <= %li",
+				   i, dhpb->dthpb_base + dhpb->dthpb_offs[i],
+				   dhpb->dthpb_base + dhpb->dthpb_offs[i - 1]);
 			return -1;
 		}
 	}
@@ -835,16 +699,16 @@ validate_probe(int out, dtrace_helper_probedesc_t *dhpb)
 	for (i = 1; i < dhpb->dthpb_nenoffs; i++) {
 		if (dhpb->dthpb_base + dhpb->dthpb_enoffs[i] <=
 		    dhpb->dthpb_base + dhpb->dthpb_enoffs[i - 1]) {
-			dof_error(out, EINVAL, "non-unique is-enabled USDT offsets "
-				  "at %i: %li <= %li", i,
-				  dhpb->dthpb_base + dhpb->dthpb_enoffs[i],
-				  dhpb->dthpb_base + dhpb->dthpb_enoffs[i - 1]);
+			usdt_error(out, EINVAL, "non-unique is-enabled USDT offsets "
+				   "at %i: %li <= %li", i,
+				   dhpb->dthpb_base + dhpb->dthpb_enoffs[i],
+				   dhpb->dthpb_base + dhpb->dthpb_enoffs[i - 1]);
 			return -1;
 		}
 	}
 
 	if (dhpb->dthpb_noffs == 0 && dhpb->dthpb_nenoffs == 0) {
-		dof_error(out, EINVAL, "USDT probe with zero tracepoints");
+		usdt_error(out, EINVAL, "USDT probe with zero tracepoints");
 		return -1;
 	}
 	return 0;
@@ -905,7 +769,7 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
 	ptr = stpcpy(ptr, dhpb->dthpb_func);
 	ptr++;
 	strcpy(ptr, dhpb->dthpb_name);
-	dof_parser_write_one(out, msg, msg_size);
+	usdt_parser_write_one(out, msg, msg_size);
 
 	free(msg);
 
@@ -932,7 +796,7 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
 		msg->size = msg_size;
 		msg->type = DIT_ARGS_NATIVE;
 		memcpy(msg->nargs.args, dhpb->dthpb_ntypes, nargs_size);
-		dof_parser_write_one(out, msg, msg_size);
+		usdt_parser_write_one(out, msg, msg_size);
 
 		free(msg);
 
@@ -955,7 +819,7 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
 			msg->size = msg_size;
 			msg->type = DIT_ARGS_XLAT;
 			memcpy(msg->xargs.args, dhpb->dthpb_xtypes, xargs_size);
-			dof_parser_write_one(out, msg, msg_size);
+			usdt_parser_write_one(out, msg, msg_size);
 
 			free(msg);
 
@@ -974,7 +838,7 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
 			msg->size = msg_size;
 			msg->type = DIT_ARGS_MAP;
 			memcpy(msg->argmap.argmap, dhpb->dthpb_args, map_size);
-			dof_parser_write_one(out, msg, msg_size);
+			usdt_parser_write_one(out, msg, msg_size);
 			free(msg);
 		}
 	}
@@ -996,8 +860,8 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
 
 	return;
  oom:
-	dof_error(out, ENOMEM, "Out of memory allocating %zi bytes for probe",
-		  msg_size);
+	usdt_error(out, ENOMEM, "Out of memory allocating %zi bytes for probe",
+		   msg_size);
 }
 
 static void
@@ -1062,7 +926,7 @@ emit_provider(int out, dof_helper_t *dhp,
 
 	provider_msg = malloc(provider_msg_size);
 	if (!provider_msg) {
-		dof_error(out, ENOMEM, "Out of memory allocating probe");
+		usdt_error(out, ENOMEM, "Out of memory allocating probe");
 		return;
 	}
 	memset(provider_msg, 0, provider_msg_size);
@@ -1071,7 +935,7 @@ emit_provider(int out, dof_helper_t *dhp,
 	provider_msg->type = DIT_PROVIDER;
 	provider_msg->provider.nprobes = prb_sec->dofs_size / prb_sec->dofs_entsize;
 	strcpy(provider_msg->provider.name, dhpb.dthpb_prov);
-	dof_parser_write_one(out, provider_msg, provider_msg_size);
+	usdt_parser_write_one(out, provider_msg, provider_msg_size);
 
 	/*
 	 * Pass back info on the probes and their associated tracepoints.
@@ -1110,21 +974,24 @@ emit_provider(int out, dof_helper_t *dhp,
 	free(provider_msg);
 }
 
-void
-dof_parse(int out, dof_helper_t *dhp, dof_hdr_t *dof)
+int
+usdt_parse_dof(int out, dof_helper_t *dhp, dof_hdr_t *dof)
 {
-	int			i, rv;
-	uintptr_t		daddr = (uintptr_t)dof;
-	dof_parsed_t		eof;
+	int		i;
+	uintptr_t	daddr = (uintptr_t)dof;
+
+	if (dof->dofh_loadsz < sizeof(dof_hdr_t)) {
+		usdt_error(out, EINVAL, "invalid load size %zi, "
+			   "smaller than header size %zi",
+			   dof->dofh_loadsz, sizeof(dof_hdr_t));
+		return -1;
+	}
 
 	dt_dbg_dof("DOF 0x%p from helper {'%s', %p, %p}...\n",
 		   dof, dhp ? dhp->dofhp_mod : "<none>", dhp, dof);
 
-	rv = dof_slurp(out, dof, dhp->dofhp_addr);
-	if (rv != 0) {
-		dof_destroy(dhp, dof);
-		return;
-	}
+	if (dof_slurp(out, dof, dhp->dofhp_addr) != 0)
+		return -1;
 
 	/*
 	 * Look for providers, validate their descriptions, and parse them.
@@ -1142,23 +1009,12 @@ dof_parse(int out, dof_helper_t *dhp, dof_hdr_t *dof)
 			if (sec->dofs_type != DOF_SECT_PROVIDER)
 				continue;
 
-			if (validate_provider(out, dof, sec) != 0) {
-				dof_destroy(dhp, dof);
-				return;
-			}
+			if (validate_provider(out, dof, sec) != 0)
+				return -1;
+
 			emit_provider(out, dhp, dof, sec);
 		}
 	}
 
-	/*
-	 * Always emit an EOF, to wake up the caller if nothing else, but also
-	 * to notify the caller that there are no more providers to read.
-	 */
-	memset(&eof, 0, sizeof(dof_parsed_t));
-
-	eof.size = offsetof(dof_parsed_t, provider.nprobes);
-	eof.type = DIT_EOF;
-	dof_parser_write_one(out, &eof, eof.size);
-
-	dof_destroy(dhp, dof);
+	return 0;
 }
diff --git a/libcommon/dof_parser_host.c b/libcommon/usdt_parser_host.c
similarity index 71%
rename from libcommon/dof_parser_host.c
rename to libcommon/usdt_parser_host.c
index 5a7546af..2e824635 100644
--- a/libcommon/dof_parser_host.c
+++ b/libcommon/usdt_parser_host.c
@@ -1,6 +1,6 @@
 /*
- * Oracle Linux DTrace; DOF-consumption and USDT-probe-creation daemon.
- * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Oracle Linux DTrace; Host-parser communication implementation.
+ * Copyright (c) 2022, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -12,8 +12,8 @@
 #include <string.h>
 #include <time.h>
 #include <unistd.h>
-
-#include "dof_parser.h"
+#include <libelf.h>
+#include "usdt_parser.h"
 
 /*
  * Write BUF to the parser pipe OUT.
@@ -21,7 +21,7 @@
  * Returns 0 on success or a positive errno value on error.
  */
 int
-dof_parser_write_one(int out, const void *buf_, size_t size)
+usdt_parser_write_one(int out, const void *buf_, size_t size)
 {
 	size_t i;
 	char *buf = (char *) buf_;
@@ -51,26 +51,46 @@ dof_parser_write_one(int out, const void *buf_, size_t size)
  * Returns 0 on success or a positive errno value on error.
  */
 int
-dof_parser_host_write(int out, const dof_helper_t *dh, dof_hdr_t *dof)
+usdt_parser_host_write(int out, const dof_helper_t *dh, const usdt_data_t *data)
 {
 	int err;
+	size_t cnt = 0;
+	const usdt_data_t *blk;
+
+	/* Write dof_helper_t structure. */
+	if ((err = usdt_parser_write_one(out, (const char *)dh,
+					 sizeof(*dh))) < 0)
+		return err;
+
+	/* Count and write nunmber of blocks that follow. */
+	for (blk = data; blk != NULL; blk = blk->next)
+		cnt++;
 
-	if ((err = dof_parser_write_one(out, (const char *)dh,
-					sizeof(dof_helper_t))) < 0)
+	if ((err = usdt_parser_write_one(out, (const char *)&cnt,
+					 sizeof(cnt))) < 0)
 		return err;
 
-	return dof_parser_write_one(out, (const char *)dof,
-				    dof->dofh_loadsz);
+	/* Write the blocks (for each, size followed by data). */
+	for (blk = data; blk != NULL; blk = blk->next) {
+		if ((err = usdt_parser_write_one(out, (const char *)&blk->size,
+						 sizeof(blk->size))) < 0)
+			return err;
+		if ((err = usdt_parser_write_one(out, (const char *)blk->buf,
+						 blk->size)) < 0)
+			return err;
+	}
+
+	return 0;
 }
 
 /*
- * Read a single DOF structure from a parser pipe.  Wait at most TIMEOUT seconds
- * to do so.
+ * Read a single dof_parsed_t structure from a parser pipe.  Wait at most
+ * TIMEOUT seconds to do so.
  *
  * Returns NULL and sets errno on error.
  */
 dof_parsed_t *
-dof_parser_host_read(int in, int timeout)
+usdt_parser_host_read(int in, int timeout)
 {
 	size_t i, sz;
 	dof_parsed_t *reply;
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 4aa94d81..9b1a2278 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -30,7 +30,7 @@
 #endif
 
 #include <port.h>
-#include <dof_parser.h>
+#include <usdt_parser.h>
 
 #include <dt_impl.h>
 #include <dt_program.h>
-- 
2.45.2

