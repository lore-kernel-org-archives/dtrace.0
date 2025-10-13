Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717F6224F3
	for <dtrace@lists.linux.dev>; Mon, 13 Oct 2025 19:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760382930; cv=fail; b=LJtGgMDomAPAHBdulnMKGqqK/qsflz0g5Mb0xFjVB0rqVqn5BjoyYpz3ZrbX/AYWueT8N3c7gIAhSWs52i3+FvIfvE8FQ2rUYTbVM6z0ZNc6hqPYlOb3BL5XD/+VJkO/DpYjT4XK5pZmB/wI+z4MRJHl9UTNfnhlzBJ1LGOjyhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760382930; c=relaxed/simple;
	bh=Z0BXcK+y7dtnUEALW1L38GjGwqEByqm3xc3hM+q/BO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FAhLnWcBBvf4wPpK6iPk2Yn2R1E0igIGTEcjQlRqDVAQh3011DyVUFILvVxutMLwxxtUpkoFDgyMEUkltFczN99SEcpMBicP4VTOvZl8WAmN7/CRJXHaCfWJOF0UtRFXE3UtU/0TaFmQMU/FEsh82zZRTOZhMMXNA8SE++9pS2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ArjeSWjw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=EKPdnLEV; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ArjeSWjw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EKPdnLEV"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DFu39s013351
	for <dtrace@lists.linux.dev>; Mon, 13 Oct 2025 19:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=j/sS7fsH9AAQcinPjn
	xu+EnmrDRScAtV60lA7UHLMhg=; b=ArjeSWjw3FOwpAQn/quOZXqo2wCaiIA9ai
	W8GAYGGGcG6mzqKC5p4A03CZplY5x6ERpYPxcFzWdX6TkMP5Ije1W2FgOu+MKvnI
	O54bfyjlcJUqfyFCuQx3eqV9slOmtl/oF0ycc2nCYCRx3cjE74zmBZU7PNtWlqIo
	Utproas9cGLV20K6P6DGcsQm8dko1RSOg+Twkp5q8yXvXbovUWFMKWjOwaljD9mU
	FRMQob1Cnx9XttFdna29DunvxQDEcQ0R3n9WY15Glymsb1b3alPRLPNANeLpdaUz
	5DgBoJlaikWUMgdL35bQZCU04nIPciU4K0CnnVJzqjBjWu8BY9XA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qfsrtw75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 13 Oct 2025 19:15:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59DJ26Ha026402
	for <dtrace@lists.linux.dev>; Mon, 13 Oct 2025 19:15:26 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013024.outbound.protection.outlook.com [40.93.201.24])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49qdp7q1as-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 13 Oct 2025 19:15:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a7BubASPx9kLfZEspjmDpZElYEi3xwRPp5OjJRpnjmXk3qPG4T5GqgqmFWyO5Wopi5dGnMZT+LPfTwGd8/Ti3uMBHQwP7y1oB1wq+CoAyxG3ceSf/Tc0kjzSXx1ullGstJBuneGQDdoeXGWTXFHs+pTiTNDWZH2fHB1XFG72Pi6wgrQxQGyHErqBlgaFgzYGcT0bmBmaifDpRk8ilx5H+cImxlIbwyq35VkeKXx74s09G67rfyNlxeW/FCv10HJ8zjPPzaHBrHLFq98AXUoYXmXaOTr5/mbkwjT8bIsLkyAvN+6h0GUqdElhS1ol+E8MheSnguXprQsodSS87q3k8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/sS7fsH9AAQcinPjnxu+EnmrDRScAtV60lA7UHLMhg=;
 b=vKLfJOFoJznU9H6vyWfLEPTJ3TYLyrYTCUYyiG48GjHsl9CFqk89woV1EyktYVX3b4ljPHb7B0WNj3NafseYzacHwozAn/rOx7G4el1uFE6eqREnKRg6Zg08iQAYRnvIt8IN+QVvxRwn2/CwGy7EmNprgqSD5K7b8/ZmKvFLSIqRYcrojPEjQiYil82wCFSUIBqfcSSC1gH7adVScvpcnn7/yL0DCtRrIA08MGSmiozC8UB5YJDhn7NVc/+VNGcrZ1E0Wk+dH0ClhPN7pwnWQ3GSFAlsM5HkgQs9h+ec1GBPB+4cecbNZueZbEZL6sefxFP7adFXabb3Ag11dIgNjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/sS7fsH9AAQcinPjnxu+EnmrDRScAtV60lA7UHLMhg=;
 b=EKPdnLEVfQ6+2KU8Ck3D+0ailQAM8Lrz5jURuoRUw0LKTiiXhKI26oSdkfse5qJBDwMH+V7QVFpAzwIhqUNFOf2Xh1iYgryXnl0kusyVvce9qu3tdx6Gmwwrx4PFqkiRYf/6yS2gfj9Kz0s2PXTTa7Ztrvv3Yc8h7Q0R6OYvRIw=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by BLAPR10MB5028.namprd10.prod.outlook.com (2603:10b6:208:307::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 19:15:21 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9203.007; Mon, 13 Oct 2025
 19:15:20 +0000
Date: Mon, 13 Oct 2025 15:15:18 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2] test: Account for large stack-limit kernel parameter
Message-ID: <aO1PxpMjm7ng0KUe@oracle.com>
References: <20251009213342.31010-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009213342.31010-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:36e::11) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|BLAPR10MB5028:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a92d440-35da-40c0-55db-08de0a8cda55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/ZPDAz+WwL9fB8kYeEp+Ix1M8azcnMi1vYS5C7Vw2xBT1DrdFeyo3Q+fJ+R1?=
 =?us-ascii?Q?RfQqncwLbsnzrV9sSAGPizTbB2sO7UyiOxg7JokNdtoCLFioqiJ5HPm6E7eN?=
 =?us-ascii?Q?tcJaJqBbGBW/C4jchwrrI/fOIdxCHVdiA2gLgi0wiJEXXpHzt8HWrusQL8q/?=
 =?us-ascii?Q?5Su/NDN6ghjde+JxMlRu5dtXIf2sAovjTjjHtWh6A8MpoZc6igDn1Qw0pVQE?=
 =?us-ascii?Q?rlT3INV7Fy+UXD0IyKRDuANx76xoJ+fG59Uyv/saOR5YD5c6E24Yas4SkQxj?=
 =?us-ascii?Q?pg6kH9NecDJNwaMtXgBeMc2OYKgcyCZMR53Qgee+qDU/9JmxlEY2vo3d+dPr?=
 =?us-ascii?Q?qAVt7t2e6AZ+V+oJwsPIURJgTC9Y5ce7YKWkJp04s677j1Nvfh80M869S2Mb?=
 =?us-ascii?Q?+ztiEUDo7lpcMn9zkgI30rS/BL2qvu3l7lju27hW77jp8irBFnMqH3EO4+An?=
 =?us-ascii?Q?eBrUPW/3Bs79BxPdjCenfSuboWu04KBu+fAe6JlezCFVjVNgz5WG+MdpekOn?=
 =?us-ascii?Q?7YZrecSeNSsbaurPZKL9aMGVjQ+jqdzDIXdpaKFLVFiZ2IzEfPkI+2hpDYd1?=
 =?us-ascii?Q?ONtSwddZop7PXcAp4UE41sWRZ9BLbTVF8bvP4ZNAEqDUifZH1AAL8JYBHcm1?=
 =?us-ascii?Q?7PSDr8iGlSCi9g6ERM6wQgKtsgUFov+EIarwxdzGOMikV8g2rsnDpLoWDvWc?=
 =?us-ascii?Q?1Vws+cNpA+ZY8WW7/p1U/QF4PP/NnDEJC00OZqJeHkJQ6bYP9ylKr2GvBwOs?=
 =?us-ascii?Q?eq5ZGgNib5jejVezhR9ZnuDlkA9LE7Q2kbgwCqmrRhTFsB82Fr5mAz4a8/P+?=
 =?us-ascii?Q?5HlrIGvOvgs1P6mkpFiist4WqwsXjQ2GimRIfafViWRoyvoQS3X5lhEceXF1?=
 =?us-ascii?Q?VbyOnI8Jf+upgQu4zXsmCXUHpmIBH/H2yNgFJQoUTeNLGQXyITKyVBmwfaEZ?=
 =?us-ascii?Q?tMr5rHDwBf/5ckkrOf7mYWZ5fboz6tYu7pU/s8/nGv5korYyyl7PueefL/cV?=
 =?us-ascii?Q?tLWi6qHxzXeg4ne5l7ZQO5fsEknlhbaRuZ15pgiEUWdjqInSc5tQ7y2CePv9?=
 =?us-ascii?Q?s07hj9P15W83GZWcl6ryTt+lmjCKlc9Makuu2NzASVmIvFismWp782aRkyrr?=
 =?us-ascii?Q?Ivr4QICUtw3yP/0QvHasBWIu6yi3Kg8OZ3FighOTUd8z+9TqjhnfpSVu1LYj?=
 =?us-ascii?Q?bpZnk+oErbmX1gCaa0hTa9Tcj5v64CDeDxR99tx1kLeDk+CC9rpLWzG9iE3M?=
 =?us-ascii?Q?Gnw//xul/lpcoA2ZinTgJrmkwYTU6SMahINh0thPObgGCat+Rh+2hF8diAbw?=
 =?us-ascii?Q?hjlLCugT4lIJuQ/XbK9rFJInItCSwCyJVJq1OEFqNiS0T2S4SzUhDF5Mtyn6?=
 =?us-ascii?Q?LwkUGpR3lCxpP0NK4ppXN0V2C1HJfyARFvsvHvzLhP9sj6a5FXpKNCquC3Yt?=
 =?us-ascii?Q?lr9HkBQ2QhkMsO88XoTTBwyeFbjH69kI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LfG3Iuj5imGG4qDX+K5IGT6TJnz25ASO3lVhEycGZR2OndXvtsjt2fDm1+c+?=
 =?us-ascii?Q?kE8Zi4h7dmZmEZ1JT3mjZLEqs8fNgsTGFVKwcRvISOalDlM5DHMu7E+rnS9b?=
 =?us-ascii?Q?WsqAJfdBDhrFi0QfEy1McDsgdbLuaeLV3t4omepRkfrDqJHM7WqV0t86ZGvy?=
 =?us-ascii?Q?ptbAEIUjHzhpDsL55XwMPkYyauCg9OR7TKqbFDRD4kkXL3QCei14PPYaDx0x?=
 =?us-ascii?Q?jNkn0c0woNYy/FXs6yrqy6jjpXItoV3RTKNn8abzuwQJCppGpYzR1BB9WY3u?=
 =?us-ascii?Q?OJkvuNDcwU5XUifC10fIrZndmSjGXSd73LTDFq9ClnM0cWNyx/qmUBvyfeV7?=
 =?us-ascii?Q?WbNeQz9nhtbniPxam03p+r7l1t3Oukl5Y91doVHZ+6dzxAwqGb2plHjFS7yy?=
 =?us-ascii?Q?VoddrTbZAoO4KDVBAT//CjnCTB53X6dlB6AcTpDWlq2FMSL44cOWGZUxWlGJ?=
 =?us-ascii?Q?wQ7Gp2PAHliW+9ua4u2nBWdHweu4r/N/dDo9vt8p12Fxjptu8aY7xKvCNDrk?=
 =?us-ascii?Q?9LYkunI7wcdCvujN86BIXt1/HgZp+CqoiKFt/OfQbgYx8nkPgUWj+m+3sl1Q?=
 =?us-ascii?Q?dCCM94tGOOkkNXrhC522VmQ+pUvqaM0U7nzi81GJL5ofiFHwGNUdyWSq3lha?=
 =?us-ascii?Q?5oc8RR9FAl7Y5P6DlgfxxNcUA38aRlGr0AyPjCcg4id+iOEXixNWuSMqcQfZ?=
 =?us-ascii?Q?YBteMZSYaBIUb19k6DgjOKaFyb2Rq62lPsi5n+j0VaAr/OuvCaPnaggwP4ye?=
 =?us-ascii?Q?ey815va8s9EWwnqHV0vljXVz4wJr8bj9YHnxfRVMaBI+0Fa8DxrythEhthZ1?=
 =?us-ascii?Q?Yji+Fv11ICc+g72kxukALSLe1fbRSp1I2pTznk89UgxZURrmrxAHQQM/Iyts?=
 =?us-ascii?Q?9WDms5SilsPlbKK0wUE7wv9xsrS7EIlGt1lcSWpowueOR2Lg74qkPfwzfX+h?=
 =?us-ascii?Q?U0i1CjBoM1FwI5+Vd5TkbxR+cdhg/RHXR8/0E+Azx5RJreOEtz9OjC7iLXYy?=
 =?us-ascii?Q?JNPqKEygY5m3jUjOrYlDyuGQILrXAx14D646naDMR3OsuIHGcdWgRf8674sC?=
 =?us-ascii?Q?vIsSqZ49PRSvUCOVakKcGc9nGzw7lLiU/Q7Jjcwj6c0IpMpmJdzSRvRImGVc?=
 =?us-ascii?Q?e6SdMe2/YVDh5JedzZ9BQSk0ab6R8jraIoP5sDptesnrJe95CH8zkNAx3Ox7?=
 =?us-ascii?Q?CkODbnTokIL/S9L2Pj8sXplWVhE4gscPOmd9ma6PIXr6yd+ourjYfnu4bqlU?=
 =?us-ascii?Q?fMpra6Ok3JsvxV+giut8+SZrjtR8OPVANjvFm7KE8MkvlWInKppjvW7K0JTi?=
 =?us-ascii?Q?S0jhNWykYVhUbrkewDVeBL2EYcZ4if8dUUrTrFpazIEG+QKyjp9NUU46KZOK?=
 =?us-ascii?Q?q6V0+MZIZrXi7EXegFfsD8zbeFdzJlv/yhd7uVxXhgS5WCEWZzBxdyTEH10N?=
 =?us-ascii?Q?Y7UTJLWB+1JA2PHmFSHiJqIiyQGNS9uQWUns/bCufKsHxRmZpqAKrrAcxxpy?=
 =?us-ascii?Q?UTNAlB1q+BlJd5V/wRwqkXf3KCfnf90SXgmsx3jk+4R3vm4gIH21bpLUrlNH?=
 =?us-ascii?Q?uEC+LF+BQYTnPqbgaCXg6nFFyKNu/Dfj1qMhSvT79K9u+9IjCCbksBr1YTha?=
 =?us-ascii?Q?Ag=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kn2dFnCMqOUBim60jh3JRfcBjW+OOmc4q1E9zgFWbFGf0qbEUrkLWXArRTFbX+y68eLhwu38TbwtpL7cOOUzrtWzuYRWtkL85+mV0/B471/a/FO3rtZ0mCysA50eiUvMb3Py/s4Qxg3Ez+VHj/bQfLK33QZAg5V34CN5ht9Kb+QZxhBt/sttSfGpjTAjtBlqW4fylzcDKNRCw1CmYCNmD2DfaOMBS/VB4NPvK7G1vj/zGCdtT70fWsNz4M2/UsvIwlDX442hKZ9j/vFHzNdCpAkYsnx268uPzxGpy9ZlBu68/Nyd80tLyPgPs7F92S6mCmQ9tqxpvyORKy5zXNC/Zgcv6kOUpWGRa8lpLf1mMVezFBYLqyGpnQkTFhl0vjE3spKcNhpHASrFOp1tNo35DT8xBokpnbsl2CBcfU2FOKPDUsLonNDhG482SrYuxRt4tNxY8IJJeI1y2aeCZ5IwKJoVgRuzxDFvr1vbPXRwQpM4MKwInhboRSM/MFpgYxajr4Y3QZmhho/8eI4eBSVVCdm2iINX4U5zdCESP1vjJVFwL5AiRZACXExeTAXn4lafhCx0bmUL2ey0vVOoyp07q7TYpZhxDZNZEdjrdlPK/uY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a92d440-35da-40c0-55db-08de0a8cda55
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 19:15:20.9416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0NnB2U6AeDM5KsmPrdEjGxjCuSOicU7PRg/IoLwFWQ79HUfa0QZIOWgJHmE5XfWW25KzyTv1biSIe+JOBHAVe4X54N86GIB6994S8SSLy2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5028
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510130086
X-Proofpoint-GUID: q4-2aU_kUsv2CD55D97S9epkQvUZzVUg
X-Authority-Analysis: v=2.4 cv=APfYzRIR c=1 sm=1 tr=0 ts=68ed4fcf b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=nWJjgDo5iDFeyNp9DRYA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13624
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMSBTYWx0ZWRfX8R+2oXWVUfoQ
 pdw/zFx+FgWhxL3+CjnLCIo9vAkve9UCVMc+DjTgEuzt3DVZaH6lIoZHpQWfryWXrQ8NHGcIkhV
 Y3aHyJmS3rNW76MYjOIRH7EFNf4a0RMjtHan98hKslAtyk5j7TD2MZYUDsYCB76O0wSMoFUHNMM
 gXeR+pBrIeBYTtRJfnjTH+HEQIfR4/jn0RqmJVW2fm5PMjTNzylm7QKvO8Th+y40MraUWV+BFUl
 swqjZDckhnSc/IBrRt6RXDHTxtASpjFfjBap86VbHVFyCloo4tEEYvMEkyWes1dHZQgDAI5GeHR
 eFpYu1HiV+i5SOe+bH7yaAK0Gt5qNrtSaaIRPVt7v+n29B8J3/pzCq1c15Ha5zBvc69uRORKG6V
 CKxTn9IZpgsuxZhB7n+6mP53GiA8y+MWaq2408hFKQortl5CrYk=
X-Proofpoint-ORIG-GUID: q4-2aU_kUsv2CD55D97S9epkQvUZzVUg

On Thu, Oct 09, 2025 at 05:33:42PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> In commit d0fdeec50 ("test: Fix some ustackdepth tests"), the test was
> tweaked to check that the full stack would be recovered if the kernel
> stack-limit parameter were increased from a default 127 to greater than
> about 190 frames.  But this does not work if the system already has
> reset the kernel parameter to a high value.
> 
> Change the test to deliberately try a "too small" and a "big enough"
> value -- again, ultimately restoring the original value.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  .../variables/bvar/tst.ustackdepth_big.sh     | 106 +++++++++++-------
>  1 file changed, 68 insertions(+), 38 deletions(-)
> 
> diff --git a/test/unittest/variables/bvar/tst.ustackdepth_big.sh b/test/unittest/variables/bvar/tst.ustackdepth_big.sh
> index 4ce53d929..aeef9982c 100755
> --- a/test/unittest/variables/bvar/tst.ustackdepth_big.sh
> +++ b/test/unittest/variables/bvar/tst.ustackdepth_big.sh
> @@ -23,52 +23,82 @@ cd $DIRNAME
>  
>  orig_maxstack=`sysctl -n kernel.perf_event_max_stack`
>  echo kernel.perf_event_max_stack was $orig_maxstack
> -trap "sysctl kernel.perf_event_max_stack=$orig_maxstack" QUIT EXIT
> -sysctl kernel.perf_event_max_stack=200
> +trap "sleep 2; sysctl kernel.perf_event_max_stack=$orig_maxstack" QUIT EXIT
>  
> -$dtrace $dt_flags -c $TRIGGER -qn '
> -profile-1
> -/pid == $target/
> -{
> -    printf("DEPTH %d\n", ustackdepth);
> -    printf("TRACE BEGIN\n");
> -    ustack(200);
> -    printf("TRACE END\n");
> -    exit(0);
> -}
> -ERROR
> -{
> -    exit(1);
> -}
> -' > D.out
> -if [ $? -ne 0 ]; then
> -    echo DTrace failure
> -    exit 1
> -fi
> +# set bounds on the full stack depth (which is ambiguous)
> +lo=188
> +hi=192
>  
> -sleep 2
> -sysctl kernel.perf_event_max_stack=$orig_maxstack
> +function do_dtrace() {
> +    # set the kernel parameter
> +    sysctl kernel.perf_event_max_stack=$stack_limit
>  
> -$POSTPROC D.out > awk.out
> -if [ $? -ne 0 ]; then
> -    echo post processing failure
> -    exit 1
> -fi
> +    # run dtrace
> +    $dtrace $dt_flags -c $TRIGGER -qn '
> +    profile-1
> +    /pid == $target/
> +    {
> +        printf("DEPTH %d\n", ustackdepth);
> +        printf("TRACE BEGIN\n");
> +        ustack(200);
> +        printf("TRACE END\n");
> +        exit(0);
> +    }
> +    ERROR
> +    {
> +        exit(1);
> +    }
> +    ' > D.out.$stack_limit
> +    if [ $? -ne 0 ]; then
> +        echo ERROR: DTrace failure with $stack_limit
> +        exit 1
> +    fi
>  
> -if echo "Stack depth OK" | diff -q - awk.out; then
> -    mydepth=`gawk '/DEPTH/ { print $2 }' D.out`
> -    if [ $mydepth -gt $orig_maxstack ]; then
> -        echo success depth $mydepth exceeded original limit $orig_maxstack
> -        exit 0
> -    else
> -        echo ERROR: $mydepth does not exceed original limit $orig_maxstack
> +    # check stackdepth consistency
> +    $POSTPROC D.out.$stack_limit > awk.out.$stack_limit
> +    if [ $? -ne 0 ]; then
> +        echo ERROR: post processing failure
> +        exit 1
> +    fi
> +    if ! grep -q "Stack depth OK" awk.out.$stack_limit; then
> +        echo ERROR: stack depth does not match stack
>          cat D.out
>          exit 1
>      fi
> -else
> -    echo "ERROR: stack depth does not match stack"
> -    cat D.out
> +
> +    # get actual stack depth
> +    mydepth=`gawk '/DEPTH/ { print $2 }' D.out.$stack_limit`
> +    echo with limit $stack_limit got stack depth $mydepth
> +
> +    # provide breathing room between dtrace and resetting kernel parameter
> +    sleep 2
> +}
> +
> +# try a stack limit that is too small
> +stack_limit=$(($lo / 2))
> +do_dtrace
> +echo "   " stack limit $stack_limit is too small for the entire stack
> +if [ $mydepth -ne $stack_limit ]; then
> +    echo ERROR: $mydepth does not match $stack_limit
>      exit 1
>  fi
> +echo "   " success:  actual depth matches limit
> +
> +# try a stack limit that is large enough
> +stack_limit=$(($hi + 20))
> +do_dtrace
> +echo "   " stack limit $stack_limit is large enough
> +if [ $mydepth -lt $lo ]; then
> +    echo ERROR: $mydepth is lower than low bound $lo
> +    exit 1
> +fi
> +if [ $mydepth -gt $hi ]; then
> +    echo ERROR: $mydepth is greater than high bound $hi
> +    exit 1
> +fi
> +echo "   " success:  actual depth captures full stack
> +
> +# restore the kernel parameter
> +sysctl kernel.perf_event_max_stack=$orig_maxstack
>  
>  exit 0
> -- 
> 2.47.3
> 
