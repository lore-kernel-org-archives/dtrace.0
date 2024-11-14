Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA07116ABC6
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 22:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731621694; cv=fail; b=l2BiqZOkf508gyUPcS26DZPz9CkygRAYyanyhjx+vFoxatahYLhlrgTk1zU3igKHjgkJ2PnGUN7GSic5OIgH4umtAo4s+jWKd7/+XuTgoL3Q8b0KZHCVOc/5roHwsxGRI9DId3wMPj9MzX3lUez4FXIxfp+vCPtMXrJY8AiY3TY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731621694; c=relaxed/simple;
	bh=jJrKuyE/vO+98WZ5F4MjO2cvCHD8fYiRP31wJsjjfiY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=id+6Cropz1xs2h93/CCMpbQYB48MvSSLz78Y68WTL0YxqSGSpQnHCBJLDJoDBsTDH01RRszlj1A6S9Vt9GEBaGCoxmDyLVf1HjZcpGzLQi4TSJs5+g80bHS0ahJJq52IbuzruDBbjUkJ9K1MY4cHXcI7KYKn5t73xcLZfNJtxVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=f5ghioj5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Cbo/cCjX; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="f5ghioj5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Cbo/cCjX"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AELfcPi008006
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 22:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=TMXgZvaG6NgHAM8s
	uIi40iXNro5PC0ZWA2oGXrIubyk=; b=f5ghioj5GmXHtgBCMfi/DAFA9tJxblih
	BL/WQiAWQi4ipLVTfCEKkoWl1Nvy00jyjkP56Z3MbzLLF20ERrIW4bCopNi3adFK
	NDhRPQ38XI/UrxP5dbM8t6Z7D2SKMKXFysKS+BVwyMRxxlqx+puUcEnWMLlgplob
	Dln1kt1zFboepfEQmMwNQ3llm6P5v/Apupqmehjqqe/M2aGKW3yNdHflTZOxKQNb
	pv6COd+Y/5P65zgLXb50EU3s7pIcc9yvgXrpjpBPVKLVchlfhBLWPrhpsjbcMVL/
	6gZEkGl9hxbatUCvQNavpd/0vPCYHeNfeRBg7ZEackJmtFA1tExOog==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0mbjcw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 22:01:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AELVFSs036004
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 22:01:17 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42sx6bec15-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 22:01:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hvl4hs3CxuAbPJ3xLNnKHMAWU7823JHzw2O1VM+ISp1uw5TgHBE2Z+G+bwox+EdXPP2ccGsSRpvy1/A411Th77mCg/bbAHrzRkS9nk6PzuFDRhlEid4zAtoOkmJzZa28cOzNFnQetRB0/k2TkaVefbfBcbA/oMID4luVeTyuleS1NyWA4CdGBUb2LJD3j+sAAboCtQzdAeV+U2uN1pVPgxyB8gNLAg7tr4TO27+Gc8RF8hJchHIgSxNT3UtKWCjrSbChNNmkd+aAo1f22266QLhcukng0cII0AOOGH8y4m7ryS5mssDx5MmkxRFjfHLpAw10Z5kdY7w6NBcTm915uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMXgZvaG6NgHAM8suIi40iXNro5PC0ZWA2oGXrIubyk=;
 b=XIxy/BYsYalKuWgEriN9OBIhweZbqviVjjIIzKmOfyjS9m7zIa/hkY34FYXBHdOheMKfR87G41qB6/Lnp8XDcnhOjbFWFjlVPxKD7iXEN1StZ6CdSMgnVaJ+kh8GQUnfmnWcFyPvxwrOZRX2Xaa6k5c4y9QOX/hh+1cXxWX1wQjkGWoRbATF5EMoXBt/zVugXIGNDU/hwFcMcqj9jzSIbaZ+jeBaDnTXgX0PSoluwgrX/AYCOj4cddCHxvmozW4CKIwJM4jsFv0V9jrECqM/RO2yF4ywNwg9Q0zubh+L+qOOj0j+2LGrE5s9WREyFppb9dvdRj+L8XRhUcblYEdx0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMXgZvaG6NgHAM8suIi40iXNro5PC0ZWA2oGXrIubyk=;
 b=Cbo/cCjXCOdjA3uBxMrYHnNHgLGMJv7fFORTfl4snsd1zGXiPFBqU/5G8H5VGFBShHW9Yb/cAzWRNDvEej+++Ds1XC2vYyk7Zoqxn0LjQCxjmgG4AvBmIwov4Z0vbfXafUgnCdC+vViKXf53/exlb78WG2/gHxV4bplZMdIurJo=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by MW5PR10MB5873.namprd10.prod.outlook.com (2603:10b6:303:19b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Thu, 14 Nov
 2024 22:01:13 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8158.017; Thu, 14 Nov 2024
 22:01:13 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: eugene.loh@oracle.com
Subject: [PATCH v2 1/4] dtprobed: handle multiple providers in a single piece of DOF
Date: Thu, 14 Nov 2024 22:01:05 +0000
Message-ID: <20241114220108.95647-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0443.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::23) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|MW5PR10MB5873:EE_
X-MS-Office365-Filtering-Correlation-Id: c07d8887-efcf-4bc5-ee98-08dd04f7dad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xZYqWOOezr84AwZBq7OnuQEvNLRwRLfJVIHfUPJPTDYOBOwdXY8i8TChqOvd?=
 =?us-ascii?Q?gUQ+VmtlZw7pvWP0IDTPz/e0bPiIdWU1T8k2EIDskaAeINObR6yhz5lIUGmH?=
 =?us-ascii?Q?PYLBcq8iD6ppblBuy0UzKrvZ87xiOOfb5Zkvnw1UUbyxHqufQoVTxwGylYZT?=
 =?us-ascii?Q?3/xYSjjeYSC8ZZ+0RJimHyRqbVxYIf83lJedUYoSOh4jT2rqQnFMV78L7D0n?=
 =?us-ascii?Q?fH+WUX9ktcxQDtIQAm7bQbuiHmKZUjZ/Ibgvcbvh1zDeX5YANruEKP9MH25h?=
 =?us-ascii?Q?7Ks7Ov9v/zVSGxWC0dsmkqGLqCYApxuJgt+ES9VuZr3CRF27UdzTWXYQajvG?=
 =?us-ascii?Q?IgNiGIEjnYkXtN828mpPaCOcrYfNilwzHNuN+L/URJHlzUuIklvPsaxIFQRc?=
 =?us-ascii?Q?A84QhM1W7YuB6FZj/DGD86wTR/7eAYWYzNEh/MfKYhvepZ2Oe2OkxpMR6V9Y?=
 =?us-ascii?Q?jrJZA/ZHKuHAoAfTWP2c/Gv0mOzKlQJliLNECSKmtmHQNrZLrXBuXGKnGi2v?=
 =?us-ascii?Q?FW5jzQ2ZVqIVsQVGZxuF+2BVfgr+VYPPlp5Fof6TfFwxdpG1eLGWySC5cZGk?=
 =?us-ascii?Q?KqYlHntuGCcnNeH02nfk5KpVI52zF90tmwM+DEdrrzEeILwzyE7TVS4sSuKn?=
 =?us-ascii?Q?zmdMeE+rDlPUpKIFXQLPzyW9A4nz7e2Gk60FaZB+lpzDnPbC5xS+rIH7S6lF?=
 =?us-ascii?Q?rZ9bkDu98QoaEKbttqVxp3CVXRJd4JueeicROd8Utp4Tojlsms21DTDwkNbQ?=
 =?us-ascii?Q?TCtHH4yGCVgmPxCClYXKhgr+VZEZ47189m7rD8ltq5qCtbaF+R27AVyHedAA?=
 =?us-ascii?Q?KuJUu916vQqBK1dLV40DazON/P/YYlFs1Ylk1cOo3iW9psgyeGMc2Hjub6gV?=
 =?us-ascii?Q?NbrVX2zfndZWXRnhu3DgXJUXs57GhGlrkPt8H9F66iwcak1cdyO21dO7x1h5?=
 =?us-ascii?Q?IuvX+PAAh2OVT+h6ltNxDVp5bus4VA3yJlP9+q+y86Yn5PYDRrlnriRnWt6b?=
 =?us-ascii?Q?OwpRyR/TimK5TJK0mBpEEzP1816vPOVKuw9iPQwkPGcvfZjzoXfV8g9THgTB?=
 =?us-ascii?Q?JxYTRNZ5f4PIaDLZEblSA1EP8OpxaIxlqKViLDtJjg+sdSTKnVCr0/xvI8hl?=
 =?us-ascii?Q?ouhpSZfftS6DNJIZ+/oINOYH/rCzpUndJqVnk8WbC1BL6dEEmeLU93p9gZ3F?=
 =?us-ascii?Q?LnHyf0RcK53PAsnq/JT1w+ekh+i8oCUDXAp0X+t0kZ3kRe2AIKE1tz5EaY7G?=
 =?us-ascii?Q?EaAWZXIREGYZGhH/+5ipYsGOg/iDAj20NahD3ygZyL4nfXEgpqRMDTa8SW++?=
 =?us-ascii?Q?nxYljJ42CPUYuZXaE6n9U6AL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nn8jLaDemS9h4PEzZtoZH+H5KVfw8NB7ogHt1BM25djvXSzDa0xd/RXEfC2o?=
 =?us-ascii?Q?d2HYvW1LKgvzDOe0MhGgP7+lAxn7ZkxBFRNjWyVjpWH7ooCyS1aktt8Njxqr?=
 =?us-ascii?Q?he5JYbouo3tT4Yy7VZCc/xljlBvxP2oGc3bBdXpNvZSHB9fRoXdgOjj+IfKJ?=
 =?us-ascii?Q?gPmzzufd0HpixDAOdzxs8gVpa1atstNyGh605WURZJlEESKuEc4kKs9mZeKw?=
 =?us-ascii?Q?987IJ/cBaB/1Gu5+32wPphDTeFaUvnL8klZlSUzLEfgnI2B8+MVuBsmacckv?=
 =?us-ascii?Q?5ngmts+lzquTKpoyYRdpM6vT46mCLxQViRAlyfXXwVF5N/T2NTsWdJmuk1GH?=
 =?us-ascii?Q?XXf+4nY+ucNnJkOmYdhteB1aXfH8DhRl1jbvmjx5yqOoFe/+TBswlsoPvHiQ?=
 =?us-ascii?Q?pVl1EnpoXOSWncY6qeaGCy9hniV/UYJ9Cwia6Xx4UflkGDKjELoWl2xIcmKu?=
 =?us-ascii?Q?YPeCMsrd839Lb7OO2sS+Z6mxJLH68cu0rJmyBX+D0TtZLu6qwSWIXDOQGEgm?=
 =?us-ascii?Q?V/Uq/QYLtthrKv3wn6hrkKQXHubEkz7LMY1U9c90F3041+AMsrk0WtwEZHi3?=
 =?us-ascii?Q?L7RBkDhhzF28CKbxEDxRIyQKTb6kechAxg3agMIJ3OPSuW2oGqDBUt19GEvP?=
 =?us-ascii?Q?wb4OVDLpIblJyv3hEOTWX3u/HgSxNXwKK5rMUVzNers2+z7roJ1cNUl5SxAH?=
 =?us-ascii?Q?qh/2aGS+nP1QiiGFYXAXcUrgbwbjUY40YuwxXJTwIgNTUFdew86uDYEHbDqr?=
 =?us-ascii?Q?3r12ShHWXNTROedP3AGO0nb8L5c2SFnzKpt3KBstt6w3fULE2JB/T/nu897D?=
 =?us-ascii?Q?GX5DmMp7hHDC3hDJ5q4PPOy7bY3TLxeV5/JXYXdXYp7itzjZxUYsnNzXmMEW?=
 =?us-ascii?Q?/n3nh8+Z5ZEo4gmcZhAbVAYxif1j8N3icZzbbmT+sJCQfqxkjnqXtDhCrCEk?=
 =?us-ascii?Q?FerePgVeC1dBkH5DmMTft0V7gbDxeUMafVbWeaRXIn0Ka2KxKDXciAaIxZL4?=
 =?us-ascii?Q?W6EiTTY2Qab8i+C+4tMCApVjVuQexMFAAYYViY19uQN7ovDf1ZGpoeP/9oQ0?=
 =?us-ascii?Q?kG7Q8MGa0cAhaAiyG8ywp/UdGSBBGTmnHFfhT/208S+kLcrlIeUuT3P1Hn2Z?=
 =?us-ascii?Q?8N3iuyquoCFHcEeL75KkePKDoyztSqJTAXyx94c+ywsm6HgFLVFBh+OPz8jD?=
 =?us-ascii?Q?l/8UI6E1qEdQUL3+LFV1NDfEMcDK9do58Uzsi/fZV3HI6T1J6B23z+u9/wmh?=
 =?us-ascii?Q?ifLmk8GjM4NB9OxVWFWCrPhRZfC0Jaulktljl0do1ByGZAGCDQvJejWSBab6?=
 =?us-ascii?Q?YYuFnI+u3We2m6nJPOZLzTF2/7b3Rr0uUmfezE0Qd/VAvktn5MR/MZrMPo6z?=
 =?us-ascii?Q?sXPK0zhi1w9K04F3tScL9PVbA3RhVaRgFOGrkZrkY7exYuWoi76Mk89gzSzM?=
 =?us-ascii?Q?UgLLVxFeOOV203PosYwKoB0wcCDbNg7S5RuRZhBDTMV6AK4iA7jRfcF3ASMP?=
 =?us-ascii?Q?0um2v71F+ItZhuNrT3v+y8PNT7zQPy/otCPfdz6Kjr38C4tXrHZKmT0kSMlV?=
 =?us-ascii?Q?24HZk3PtV4wMbsgyGPP9gDFCAdfk8oxUypvzDYpoD78PvEoqIMiVSn2ZyRmO?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	d49bameh8G7F50Wtf3OI6Xr3e8roQq3KyNDp5Rx5MAo2+HJ3YanoBxQzlTdAR2KHbAGyDX34GUZkuWqo1N+WUWiU9wWmPfhclYvALy7QmrRbFWu4gml2cH7YGwPKBXw6EHu1zvJwp6QFxGxz9e7Q7CCM72szEEqcHH5e6iwGlbDFGlWmMNI1woyEjKLJA/YFST9whmi5fH+Qrf1yuirsZfmJ6o8A6ZR1fhWYrSLCZYsUxnKPOiH9ii7m7S5hq2z8K2yCMNBIBMTU4Zlv6fdwEX3FVr7lVkxQ5ro5RzmhZ58WeC6N13Ax1srTUZQp3t+e56JrcRkuuF4j9gEyB5ct58f9XW40+J645vmgUSOAgOEmchID3T4MtUeosj5Us0YYCpOFSqdaClujRF63AuskcpbbIWDltmh+964DH10hXN2imkvD4Uf1mKEhkXRPugeuimU3kVT53r/NymOTYxChfLCnwR80LYeqGkOcjCuEiXvenuCI5U3Rr/Ji1r/fr83OFZfWlGnTpHCDR9FYtQer9SSzmN4MsIfKdU8rDdG56xCFBf1hy4wn9V6tNZ3N1x5iAI7MGA0sJaspiCl2H1pAhreridDJ3E9InOrJlPxM7EU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c07d8887-efcf-4bc5-ee98-08dd04f7dad1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 22:01:13.3881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X4y+poIH7m32IXNq+XOtqe5DHfZ6tE+0WJVYRNSPbnu+Ska+JvQo2PyI9xSycj5Y9jqU/fa18ydGrmy1aJfThg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5873
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_05,2024-11-13_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411140173
X-Proofpoint-GUID: a9PgPAUqkCzjVW06H3lEVktv5xLi9HIt
X-Proofpoint-ORIG-GUID: a9PgPAUqkCzjVW06H3lEVktv5xLi9HIt

A given ELF object can of course contain as many providers as you like.  The
DOF stash format, DOF stash management code and DTrace itself are all set up
fine to handle DOF with multiple providers in: but, alas, the code that
reads the DOF from the parser child in response to an ioctl() assumes that
one provider is all it will ever see.

This is not ideal, but rejigging it introduces an interesting problem: when
do you *stop* reading providers from the parser stream?  Right now,
dof_parser.c loops over all of its providers and emits them until all are
done, then just stops: there is no indication of how many providers there
are or that this is the last provider or anything (though if there are none,
it does try to send an empty provider to avoid the caller blocking waiting
for a reply that will never come).

It's a bit annoying to try to figure out how many providers there are in
advance, so instead of that, take a route that's easier both to emit and
parse, drop the empty provider stuff, and simply add a DIT_EOF record which
indicates "no more providers expected", which is always sent last.  (We
stuff this in before DIT_ARGS_* in the enum because it makes more conceptual
sense right after DIT_ERR, and DIT_ARGS_* hasn't released anywhere yet.)

With that in place it's a simple matter to loop adding parsed DOF to the
stash's accumulator until we hit an EOF record.  Memory management is
complicated a little, because a single parsed buffer (reply from dof_parser)
is now owned by multiple accumulator records in the stash: but every one of
those is terminated by a DIT_EOF, which appears nowhere else, so we can just
not free a parsed buffer unless it's of type DIT_EOF.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 dtprobed/dof_stash.c                        | 12 +++-
 dtprobed/dtprobed.c                         | 63 ++++++++++++++-------
 libcommon/dof_parser.c                      | 23 +++-----
 libcommon/dof_parser.h                      |  8 ++-
 test/triggers/Build                         |  6 +-
 test/triggers/usdt-tst-multiprovider-prov.d | 12 ++++
 test/triggers/usdt-tst-multiprovider.c      | 23 ++++++++
 test/unittest/usdt/tst.multiprovider.r      |  4 ++
 test/unittest/usdt/tst.multiprovider.r.p    |  2 +
 test/unittest/usdt/tst.multiprovider.sh     | 15 +++++
 10 files changed, 126 insertions(+), 42 deletions(-)
 create mode 100644 test/triggers/usdt-tst-multiprovider-prov.d
 create mode 100644 test/triggers/usdt-tst-multiprovider.c
 create mode 100644 test/unittest/usdt/tst.multiprovider.r
 create mode 100755 test/unittest/usdt/tst.multiprovider.r.p
 create mode 100755 test/unittest/usdt/tst.multiprovider.sh

Changes since v1: test multiple probes.

This had fallout -- see later commits in this series!

diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
index 82fdd3174759d..296987ad41e93 100644
--- a/dtprobed/dof_stash.c
+++ b/dtprobed/dof_stash.c
@@ -360,7 +360,13 @@ dof_stash_free(dt_list_t *accum)
 	for (accump = dt_list_next(accum); accump != NULL;
 	     accump = dt_list_next(accump)) {
 		dt_list_delete(accum, accump);
-		free(accump->parsed);
+
+		/*
+		 * All parsed memory regions are terminated by an EOF, so once
+		 * we encounter the EOF, this region can safely be freed.
+		 */
+		if (accump->parsed->type == DIT_EOF)
+			free(accump->parsed);
 		free(last_accump);
 		last_accump = accump;
 	}
@@ -656,6 +662,10 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
 			fuse_log(FUSE_LOG_ERR, "dtprobed: parser error: %s\n",
 				 accump->parsed->err.err);
 			goto err_provider_close;
+		/* EOF: nothing to do.  No need to record this parser-stream
+		 * implementation detail into the parsed representation.  */
+		case DIT_EOF:
+			break;
 
 		default:
 			/*
diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
index 2ca39b26f88a9..86865eb467b67 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -772,41 +772,60 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
 			dof_parser_tidy(1);
 			continue;
 		}
-		if (provider->type != DIT_PROVIDER)
+		if (provider->type != DIT_PROVIDER && provider->type != DIT_EOF)
 			goto err;
 		break;
 	} while (!provider);
 
-	if (dof_stash_push_parsed(&accum, provider) < 0)
-		goto oom;
-
-	for (i = 0; i < provider->provider.nprobes; i++) {
-		dof_parsed_t *probe = dof_read(pid, in);
-		size_t j;
-
-		errmsg = "no probes in this provider, or parse state corrupt";
-		if (!probe || probe->type != DIT_PROBE)
-			goto err;
-
-		if (dof_stash_push_parsed(&accum, probe) < 0)
+	while (provider->type != DIT_EOF) {
+		if (dof_stash_push_parsed(&accum, provider) < 0)
 			goto oom;
 
-		j = 0;
-		do {
-			dof_parsed_t *tp = dof_read(pid, in);
+		fuse_log(FUSE_LOG_DEBUG, "Parser read: provider %s, %i probes\n",
+			 provider->provider.name, provider->provider.nprobes);
 
-			errmsg = "no tracepoints in a probe, or parse state corrupt";
-			if (!tp || tp->type == DIT_PROVIDER || tp->type == DIT_PROBE)
+		for (i = 0; i < provider->provider.nprobes; i++) {
+			dof_parsed_t *probe = dof_read(pid, in);
+			size_t j;
+
+			errmsg = "no probes in this provider, or parse state corrupt";
+			if (!probe || probe->type != DIT_PROBE)
 				goto err;
 
-			if (dof_stash_push_parsed(&accum, tp) < 0)
+			if (dof_stash_push_parsed(&accum, probe) < 0)
 				goto oom;
 
-			if (tp->type == DIT_TRACEPOINT)
-				j++;
-		} while (j < probe->probe.ntp);
+			j = 0;
+			do {
+				dof_parsed_t *tp = dof_read(pid, in);
+
+				errmsg = "no tracepoints in a probe, or parse state corrupt";
+				if (!tp || tp->type == DIT_PROVIDER ||
+				    tp->type == DIT_PROBE || tp->type == DIT_EOF)
+					goto err;
+
+				fuse_log(FUSE_LOG_DEBUG, "Parser read: adding %s:%s to stash\n",
+					 provider->provider.name, probe->probe.name);
+
+				if (dof_stash_push_parsed(&accum, tp) < 0)
+					goto oom;
+
+				if (tp->type == DIT_TRACEPOINT)
+					j++;
+			} while (j < probe->probe.ntp);
+		}
+
+		errmsg = "subsequent provider read failed, or stream not properly terminated";
+		provider = dof_read(pid, in);
+		if (!provider)
+			goto err;
 	}
 
+	/* Push the EOF on.  */
+
+	if (dof_stash_push_parsed(&accum, provider) < 0)
+		goto oom;
+
 	if (!reparsing)
 		if ((gen = dof_stash_add(pid, dev, inum, exec_dev, exec_inum, dh,
 					 in_buf, in_bufsz)) < 0)
diff --git a/libcommon/dof_parser.c b/libcommon/dof_parser.c
index 1792a8bfcc849..ae5abe5220929 100644
--- a/libcommon/dof_parser.c
+++ b/libcommon/dof_parser.c
@@ -1145,7 +1145,7 @@ dof_parse(int out, dof_helper_t *dhp, dof_hdr_t *dof)
 {
 	int			i, rv;
 	uintptr_t		daddr = (uintptr_t)dof;
-	int			count = 0;
+	dof_parsed_t		eof;
 
 	dt_dbg_dof("DOF 0x%p from helper {'%s', %p, %p}...\n",
 		   dof, dhp ? dhp->dofhp_mod : "<none>", dhp, dof);
@@ -1157,8 +1157,7 @@ dof_parse(int out, dof_helper_t *dhp, dof_hdr_t *dof)
 	}
 
 	/*
-	 * Look for helper providers, validate their descriptions, and
-	 * parse them.
+	 * Look for providers, validate their descriptions, and parse them.
 	 */
 	if (dhp != NULL) {
 		dt_dbg_dof("  DOF 0x%p Validating and parsing providers...\n", dof);
@@ -1177,25 +1176,19 @@ dof_parse(int out, dof_helper_t *dhp, dof_hdr_t *dof)
 				dof_destroy(dhp, dof);
 				return;
 			}
-			count++;
 			emit_provider(out, dhp, dof, sec);
 		}
 	}
 
 	/*
-	 * If nothing was written, emit an empty result to wake up
-	 * the caller.
+	 * Always emit an EOF, to wake up the caller if nothing else, but also
+	 * to notify the caller that there are no more providers to read.
 	 */
-	if (count == 0) {
-		dof_parsed_t empty;
+	memset(&eof, 0, sizeof(dof_parsed_t));
 
-		memset(&empty, 0, sizeof(dof_parsed_t));
-
-		empty.size = offsetof(dof_parsed_t, provider.name);
-		empty.type = DIT_PROVIDER;
-		empty.provider.nprobes = 0;
-		dof_parser_write_one(out, &empty, empty.size);
-	}
+	eof.size = offsetof(dof_parsed_t, provider.nprobes);
+	eof.type = DIT_EOF;
+	dof_parser_write_one(out, &eof, eof.size);
 
 	dof_destroy(dhp, dof);
 }
diff --git a/libcommon/dof_parser.h b/libcommon/dof_parser.h
index 8f42d00551e3f..75aa3082161b7 100644
--- a/libcommon/dof_parser.h
+++ b/libcommon/dof_parser.h
@@ -24,6 +24,7 @@
  *     DIT_ARGS_XLAT (1, optional)
  *     DIT_ARGS_MAP (1, optional)
  *     DIT_TRACEPOINT (any number >= 1)
+ * DIT_EOF (no more providers, last record)
  *
  * The dof_parsed.provider.flags word indicates the presence of the
  * various optional args records in the following stream (you can rely on
@@ -37,9 +38,10 @@ typedef enum dof_parsed_info {
 	DIT_PROBE = 1,
 	DIT_TRACEPOINT = 2,
 	DIT_ERR = 3,
-	DIT_ARGS_NATIVE = 4,
-	DIT_ARGS_XLAT = 5,
-	DIT_ARGS_MAP = 6,
+	DIT_EOF = 4,
+	DIT_ARGS_NATIVE = 5,
+	DIT_ARGS_XLAT = 6,
+	DIT_ARGS_MAP = 7,
 } dof_parsed_info_t;
 
 /*
diff --git a/test/triggers/Build b/test/triggers/Build
index 107b3b4d1f2e8..c50c265ccec7d 100644
--- a/test/triggers/Build
+++ b/test/triggers/Build
@@ -13,7 +13,8 @@ EXTERNAL_64BIT_TRIGGERS = testprobe readwholedir mmap bogus-ioctl open delaydie
     ustack-tst-spin ustack-tst-mtspin \
     visible-constructor visible-constructor-static visible-constructor-static-unstripped
 
-EXTERNAL_64BIT_SDT_TRIGGERS = usdt-tst-argmap usdt-tst-args usdt-tst-forker usdt-tst-defer usdt-tst-special
+EXTERNAL_64BIT_SDT_TRIGGERS = usdt-tst-argmap usdt-tst-args usdt-tst-forker usdt-tst-defer \
+    usdt-tst-multiprovider usdt-tst-special
 EXTERNAL_64BIT_TRIGGERS += $(EXTERNAL_64BIT_SDT_TRIGGERS)
 
 EXTERNAL_32BIT_TRIGGERS := visible-constructor-32
@@ -206,6 +207,9 @@ usdt-tst-forker_PROV := usdt-tst-forker-prov.d
 # usdt-tst-defer calls USDT probes based on dtrace -h
 usdt-tst-defer_PROV := usdt-tst-defer-prov.d
 
+# usdt-tst-multiprovider calls USDT probes based on dtrace -h
+usdt-tst-multiprovider_PROV := usdt-tst-multiprovider-prov.d
+
 # usdt-tst-special calls USDT probes based on dtrace -h
 usdt-tst-special_CFLAGS := -fno-inline -O2
 usdt-tst-special_PROV := usdt-tst-special-prov.d
diff --git a/test/triggers/usdt-tst-multiprovider-prov.d b/test/triggers/usdt-tst-multiprovider-prov.d
new file mode 100644
index 0000000000000..530693ea71fe7
--- /dev/null
+++ b/test/triggers/usdt-tst-multiprovider-prov.d
@@ -0,0 +1,12 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@skip: provider declaration - not a test */
+
+provider prova { probe entrya(); };
+provider provb { probe entryb(); probe entryc(int a, char *b) : (char * b, int a); };
+provider provc { probe entryd(); };
diff --git a/test/triggers/usdt-tst-multiprovider.c b/test/triggers/usdt-tst-multiprovider.c
new file mode 100644
index 0000000000000..a954111379d9f
--- /dev/null
+++ b/test/triggers/usdt-tst-multiprovider.c
@@ -0,0 +1,23 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * A trigger with multiple providers in it.
+ */
+#include <stdio.h>
+#include <unistd.h>
+#include "usdt-tst-multiprovider-prov.h"
+
+int main(int argc, char **argv)
+{
+	PROVA_ENTRYA();
+	PROVB_ENTRYB();
+	PROVB_ENTRYC(666, "foo");
+	PROVC_ENTRYD();
+	usleep(5 * 1000 * 1000);
+	return 0;
+}
diff --git a/test/unittest/usdt/tst.multiprovider.r b/test/unittest/usdt/tst.multiprovider.r
new file mode 100644
index 0000000000000..60a15c01eeee3
--- /dev/null
+++ b/test/unittest/usdt/tst.multiprovider.r
@@ -0,0 +1,4 @@
+ID provaPID usdt-tst-multiprovider main entrya
+ID provbPID usdt-tst-multiprovider main entryb
+ID provbPID usdt-tst-multiprovider main entryc
+ID provcPID usdt-tst-multiprovider main entryd
diff --git a/test/unittest/usdt/tst.multiprovider.r.p b/test/unittest/usdt/tst.multiprovider.r.p
new file mode 100755
index 0000000000000..ae8493e3d5be4
--- /dev/null
+++ b/test/unittest/usdt/tst.multiprovider.r.p
@@ -0,0 +1,2 @@
+#!/bin/sh
+grep -v '^ *ID' | sed 's,^[0-9]*,ID,; s,prov\(.\)[0-9]*,prov\1PID,; s,  *, ,g'
diff --git a/test/unittest/usdt/tst.multiprovider.sh b/test/unittest/usdt/tst.multiprovider.sh
new file mode 100755
index 0000000000000..d5b72c2be77ec
--- /dev/null
+++ b/test/unittest/usdt/tst.multiprovider.sh
@@ -0,0 +1,15 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+
+exec $dtrace $dt_flags -l -P 'prov*' -c `pwd`/test/triggers/usdt-tst-multiprovider

base-commit: 68d14f30b5ffaaea405354a2edf44279127d209a
-- 
2.46.0.278.g36e3a12567

