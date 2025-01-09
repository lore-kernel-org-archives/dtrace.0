Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492CC175D39
	for <dtrace@lists.linux.dev>; Thu,  9 Jan 2025 16:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736441242; cv=fail; b=J74WwbI2j5i1+riGkl8D7Yke5W7fU+NsCC67uy2i9BmJMXM/z8aRRQc0m3IHCrTMdbPpx2fccQWuLa/YHlASmhe4YFgCxsCEJaAIrxcER4/sQ5hnIo1UfT3db1mdu5pW4HL5JwN+V1iwtmGFmNTATl+REkPJzDTnqdoM6zkPJXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736441242; c=relaxed/simple;
	bh=8Us+N8nzcfkXc66lnmu2e0k11lZTKjtmkCMXIzBtrY8=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=WDzj1RoEBYKtWgqFG/NAFfXjC/uvxIDNpUrl0hNhw3mE1UFM+ll15Vlot3R0edWIL3VnTFDfRJeXN3p1/FnRazG7K5UtDY1OPol7TLbNwhkoshZs/fBXPlQhKUzp/+ZuWOInj38RjTAAnAgJk1ov2PvHPtSPUW4ARW2yNFquVAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eEJcwAKE; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jLh8w6zQ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eEJcwAKE";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jLh8w6zQ"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509GXu2w016275
	for <dtrace@lists.linux.dev>; Thu, 9 Jan 2025 16:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=LUTcHnLecNlgh/lf
	H3githD1H38RRFzzWSKiyrKm7xs=; b=eEJcwAKEeNH0V1z4Z239VnrETbHyngLo
	F4fXGT/3OOvWn6NiHNykPL13HsPXlF/T2glKnagKPAFCj4MbVGoGZ2gYW9ZOZfQm
	TexCS0WDxehVObZq8/4AKP7pJ/lJCYhvANlJ5/fdxJ+QdgOqysJv/sA8KUWNjwKA
	OhSLLFkCvlqzoUi/MVaXHVl1Vx/8fREZQxtDJ0xrd5/053sfUXU9WPOTMIWYoDqN
	ynbJjtKmps+jCJHyyPNBBh2vI8FSW7+XXUzBdSYzRZbXoheOZa6zZ3tRZjrEOUWK
	CteqFnp07K9lrZpWH/E4ZV1ausl9jtmZWqY6gCuiuzPZjd8K1XmPEw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 442b8uguat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Jan 2025 16:47:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 509FGui5022806
	for <dtrace@lists.linux.dev>; Thu, 9 Jan 2025 16:47:18 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43xueba9a2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Jan 2025 16:47:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NT7m6g6t9vYZB85vyJ1/9RHtpfpBt0aFnrwXKIEX4ilJD431btl/sIm20iC9m0KMgTM3ellOKRo7CqmsmbFzw3DA7u+pSdSZkLbDY/k8I2SwXeA2bMk1cQZ/zJY9zCsZX1B8uXmfPKrkLnCngfW03oSq6pusrcOFT5pDlpRexEPJt1FEc5NXpCiP6KB40JT/1nqZpyaMXkJvG7OEdtmmWyS1O/pCN/v+s7GS9kiH3i9Vrjg2AYCeL6BHxtUvbcwiiSM5/5Ymm+d58rZ938g/CZvN3wmRv9BDGd731ds9cNRsdGawGVzXOi6eODobgJbbNItwD1JqLTJ5O+P2eNEFmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LUTcHnLecNlgh/lfH3githD1H38RRFzzWSKiyrKm7xs=;
 b=hSf88gapfDreD3zw9P9ra2P8f2Ez9SE3vj44R87nHokRYDyDTvhhfvy2KaoHbemuBeO8//LriXgMVheq5fLr3bfLMOhO4nLCC4hr7Cp4RzNU4QFOkzJ+hIUu5oA0RK78VEyJRKgSGVvLCidwoH6doPMLfNRlmLHSe/1+RJGfIMo9DX57QSj255lVwqmwmAIq3vrBoRrU2ca25sVVnOI/Z3H1lTsQD84fJUUUcpY9fJ260GNrmEdJ/yoMfei//BP77WyBgkhFNDfMMCzlUtn8WjnG00h+Y21z8b1A/J9cs45acKDOyNaKIL6JIVVM9N2lffwriZ8BtDmRVnotPT5OOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LUTcHnLecNlgh/lfH3githD1H38RRFzzWSKiyrKm7xs=;
 b=jLh8w6zQMsvW9iYpAh02cwkXWImM9Pu8NF8nmVK0T1A6yosgwkRjM6rUJ6AKCtmT8uaBIEKItp7GVNJakH5gQe6kPyXi9RKnkp4w5Naz9sUcLmafcjNMZBk7M2Pv08KazEuAzj95Ikw1m+2z3eGh3PcX5AnGvJTqN8wj4VgQuNU=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by MW4PR10MB6486.namprd10.prod.outlook.com (2603:10b6:303:213::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 16:47:16 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 16:47:16 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] tests: add test for buggy deduplicator
Date: Thu,  9 Jan 2025 16:47:10 +0000
Message-ID: <20250109164711.232013-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.47.1.279.g84c5f4e78e
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0108.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::10) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|MW4PR10MB6486:EE_
X-MS-Office365-Filtering-Correlation-Id: 1656e3d3-15a4-4965-ef77-08dd30cd4619
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SO1wVrL9PWrOmnuolRkHwV2N3ICjrpPEaGcCrPwT8ipTsMQpYy5loTE42m3Q?=
 =?us-ascii?Q?nqLxldKZHEvQg7YEFCNu16mKsCtswTbtZGov+5QIs8LBprsHzNOLhgjj4jwW?=
 =?us-ascii?Q?h7+vpxa17KaoQx03hDxLqNLf5KCGozScip6H7+e17VDo9yzw7TP9/nPEpSzE?=
 =?us-ascii?Q?o01pZayQEPSkq3fa7KlHDR3NZHBSfcNLV9nOnPH8EmRKXLswk+RXGceetsQx?=
 =?us-ascii?Q?464x3dyG6EmB9D72SAnk0Mn32641vMQZHxnXPINjyOuCxSQ2zpRb6TyqU+vA?=
 =?us-ascii?Q?CjzFLD/oZpAWBGOfJGx+6pRcxFrVxBzJp68WM1mpLZgEsVzw6Hz/cd9EZKbC?=
 =?us-ascii?Q?43laTfs717CpnLhJ/jBDxUBLuZkCtX90IyGuo2IabbAyMFeu3jmT6wE008G6?=
 =?us-ascii?Q?T35+5SCkAooCaLLrZNYh5frBtKOjGFkvYyZDrbhv9X5atKtpUP8JCNnv9rYE?=
 =?us-ascii?Q?Op4QsnWpe0nPU5FyAiOIySW6a/aaYGcowBD44bY0SryEBPz/y8adkcdCUMi0?=
 =?us-ascii?Q?uAJlbAItl678nsKFDAtLswrYrwzW1xBZ46hruaCJraxIjV+LOGavbzK4ejPv?=
 =?us-ascii?Q?ZjYHGkRUbPCxItVjrQ/3n0lKYbiuHBzdz83SDVh747c5alvZvRrKcWbYTDCo?=
 =?us-ascii?Q?bVh2OoyEwJbXrl6JJAN4oqJ4ISDyw4q9XW1El0jhEg0NET4O15yqVh3SFjjA?=
 =?us-ascii?Q?f9DEUBjDkpkhSza+gtzBd+fHOwWCW/J4wtSoStx53wEE67nnc8g2mrlbtA+B?=
 =?us-ascii?Q?CqTkaY7+1clqp0c07U72vPpt6+/bsYqVJrPH6b/BtpYGJEOce3+nCv2qDRTf?=
 =?us-ascii?Q?Wmst6Krmg685ecfFN0b3jw+Il/2m/nCCPFIBHfjLFheBrZqPkvq7WKI+bsLA?=
 =?us-ascii?Q?zY+QUuzhcTc570DEHi/HUvCIeizeB3NSkiIQwL1hGaqB/ccFZkbhvJ3lT5U9?=
 =?us-ascii?Q?aQQuci0skMYlZBTunUqeXNEgSEnRwBngopEsmrhylILAk4IjLjfFkWI7dFcC?=
 =?us-ascii?Q?S+cZnS9Jvla0P00dFIzNmCxJAb/93B5qqWBfB3BhHYjWGqSfF6qjuN34v+VX?=
 =?us-ascii?Q?4PR3usmSR/l17I6jwNcS6Bf9NEzE4IDG+AjGSGR7Fu5MuWpGw0dPnUOHjSdz?=
 =?us-ascii?Q?gVXdhQiWxY15NHd1dYM4+712Ma4HB8ji1X9xlr087QY22chnBSDdJrNoSWlY?=
 =?us-ascii?Q?/c2kNYLHMLJVDgq5G44SJyE/2O4131vATd/DE5Tfq9q5x5zBGCmaDUJdYGmp?=
 =?us-ascii?Q?fS+ZodrFrRahk20yCqiU9vXMDryu0Y257tamtLe0c4+vZQY1669Fx/RnS3yX?=
 =?us-ascii?Q?EgjDa31A46AmFE7uL5WiD0DmzgUCFdm3EyaBePgLoXq9YA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lSU/Suov4dtnmFUzaCzSV/3iAu78eRx7NzEADsMbIgYWvWE8v8dCZycxza15?=
 =?us-ascii?Q?xhCcp8VNE86WF+YrPIVwc55kB/OtS3GAFamByfpp182LPk02WYZGYs2VBGx4?=
 =?us-ascii?Q?5Ew8krake9HPcJKNzEmp2QV945QYb2jKu14RDEmvwS/GJ0TYufOoeucjXIgB?=
 =?us-ascii?Q?jE/20FCYWZc4omCZsgylAjZAKtOvwTyj0rwyBVc84Fd1hqXXYIRg3eR3Sbow?=
 =?us-ascii?Q?fsnaumGc0Llzo7TxqydA/lG7yS4+Q9f4GEe58RDeuP5CTqtOMMJi3IA89XqI?=
 =?us-ascii?Q?Apdr+TYHs0VHnzbmxOsQAaAEzcWaItHxQgTdQG0QBwR1ypYRVE+3pCpbiVfY?=
 =?us-ascii?Q?04Uu9tN4E7+Q2EhIAXi4S/f0JUCVQCcVXRMtr2iIEqG3yc08bExQxalrVyL4?=
 =?us-ascii?Q?/bbWqTjLVSrt+UbR9qYC3h+eahEkEj2pxKRnnk3JylnHiCU6n/UdAxidLZIz?=
 =?us-ascii?Q?WbC/DRFpzRRdBwzwwX1vmHxzTYXe2rxHdp7invDu2FKnNJRZ8J5RJFxvC24h?=
 =?us-ascii?Q?rtAMkKnzDH/ZbvlOarqDyuCmwXdlNQarbOioN5sAx3KyxEKMmUJrUv+Z6v88?=
 =?us-ascii?Q?Jk0Z4vnCu6xlioiUphM4KrsdBAKuavU0YYSgBVRN2rsh9EEA8EUW5AWg1/vV?=
 =?us-ascii?Q?QCaHgCKect1nrzVM0DZo1ZxqKLwEAehuvfHwL2Kbde2tAEHbVUmX8lMokHLM?=
 =?us-ascii?Q?lRPLlfQ4zvT83MLOK4+NIm1g0PpFsDQzndnDL09gBQGh+P0jBIdtkrABhlkL?=
 =?us-ascii?Q?+SNQQYmILNceCJYVeGCSotJY72K0FcrXbfeouuCGapt8iI7U8C5wR9m0aP9o?=
 =?us-ascii?Q?FcL4+oJv8Ma5j/SVMoRrrTlCsV4bJn4yqm/OJMdCzrifxklHL69UwtB9/G1M?=
 =?us-ascii?Q?cr00PmyNQncHBmCFNDCJWyTqUYLdf6+/2JhBGumiQGxLFryR1mY/jOl6wKDw?=
 =?us-ascii?Q?hPkSxYehp1z8gwHtKcfPgGl5YiVUmMXV1wXt7TAPcSP2Fg4zoQEr8Qe5yFEz?=
 =?us-ascii?Q?SfV2FzOGl8r69qbFU7ckDeS3JPMAwPUy2gDNvq9rJfmQOn5GEtpAU+FHe979?=
 =?us-ascii?Q?hkvqbiWHL6J446bUYe4It2adwr7bWLBb0vuUkxqoAleQq7oItKWcks4TodtT?=
 =?us-ascii?Q?oqNvu3P0jY79SGNpkIl5U/sqbUl3hcQNN+1q5IHOdUhD8pXC60dC/HpgD/sX?=
 =?us-ascii?Q?8e7jUuiSv1/4vfyVtCweXvw4L2Y4llOjkqNYldNC6NngaNgg9nSiWzQKRMR9?=
 =?us-ascii?Q?7BZnXhsjxQhBekMRkPDNv/2DAWZ8lq3DJv/daavmiIlYsgjM9DvnZt1B3FSo?=
 =?us-ascii?Q?N/dGFDlrnR3eJ4VwUwG9hEYexepO+MbXpCgMITYZoZFdxfsQEO6J85qjTdUR?=
 =?us-ascii?Q?MiAJMn+uk0Gkq47Yxlro7/aA8tI21zuIdUEYD5aPrm20qdLgm+nIYOwgj74B?=
 =?us-ascii?Q?pOeqrp4JkWFAMHVKlaXX7oFeOPndJpiHnjtycO2QJhmDLEvLzE9GF+VaONdE?=
 =?us-ascii?Q?gmBoWWfFYbKeDtFXYpU1GWjf4SZ4XOte/Kj/M4F8alXYZAhh/GLJkD3Hh6Gp?=
 =?us-ascii?Q?495eqRveQIMKKF8syj50FitPp+sMkRElUJxo0v1XzuLxefdbM56hpEM4PsF4?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TBRuwsKbLStIAglOVgntRSCTUSpg7IEMovlR1P1a39Ym0aO7hCsuGjrxAVVJ3Z8qswGGO74lz4ffsU7ZFl9CD1kkmqTegRgSNZXW82ans59fphclHvD08urSmWUc6KBunzfNYWzLdX0a4KPaR8MUc/bNQ1uvgGCwGQebeYYsJdHN6BCqWz96jOYRDQ3TsW9P+VpL14vKzeTs0FUcuYY60796cjpVzkcJrLNFIrioc5DyTHRZ2P196MW9HYhww4IXJOHeDbMiJpCpKSdxVIrt5hpQL+YtSiY/9hDqsCmHxyfR88xHm7XFec9R/zLdam0wrh+G6XUodz8Hm3QcgQiT4UwC6BUJHkoo3XeGFEKae9ej8XfRPb1tCcHO/NTwBwK1Kx8SthcIriCA/8Jpx4WC9bX8Q3jTj/yq9XferFK4hADj6+o2xf1TxCrMe2DaNjMKHFRcV9kErgRHvAESpyB5bQ+O2L3G2X5Ync+vRBtawoCO11c/lQKuzKoMETcLnygoFYz9pjfvW/Vf0oy48dsVVHRDt0uMHHpDR9kgHEmlwfwatFG/BoBQCRJn6z3gwHnEiNs7gcdj8rBTRTIN1odSV4v50+v5W3Cb9Zbsl1wZr3g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1656e3d3-15a4-4965-ef77-08dd30cd4619
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 16:47:16.1038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NAP13VupgUjYbfBgbaBprC78CRYDR/MljZ/XjiZ+fcnxjz4YCt5RT0Doae8eSYl8Z71QCv270VupgLu+3OtxTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6486
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-09_08,2025-01-09_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501090134
X-Proofpoint-ORIG-GUID: pns8hvELjHwzYeTxmUVdiuA7R3RolcUT
X-Proofpoint-GUID: pns8hvELjHwzYeTxmUVdiuA7R3RolcUT

Some early prototype deduplicators dedupped types in one dict (more or less)
rather than putting conflicting types and module types into
sub-dictionaries.  Fail if the running kernel is such a kernel.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 dtrace.spec                  |  2 +-
 test/smoke/tst.ctf-intact.sh | 58 ++++++++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100755 test/smoke/tst.ctf-intact.sh

diff --git a/dtrace.spec b/dtrace.spec
index 902ad7d8bb980..cf960f14b55c7 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -151,7 +151,7 @@ Requires:     %{name}-devel = %{version}-%{release} perl gcc java
 Requires:     java-1.8.0-openjdk-devel perl-IO-Socket-IP xfsprogs
 Requires:     exportfs vim-minimal %{name}%{?_isa} = %{version}-%{release}
 Requires:     coreutils wireshark %{glibc32}
-Requires:     perf time bc nfs-utils
+Requires:     perf time bc nfs-utils binutils
 Autoreq:      0
 Group:	      Development/System
 
diff --git a/test/smoke/tst.ctf-intact.sh b/test/smoke/tst.ctf-intact.sh
new file mode 100755
index 0000000000000..d737a2b162fcb
--- /dev/null
+++ b/test/smoke/tst.ctf-intact.sh
@@ -0,0 +1,58 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+#
+# This script verifies that the CTF, if present, is non-corrupt: in
+# particular, that it has at least one child with 
+#
+
+ctf="/lib/modules/$(uname -r)/kernel/vmlinux.ctfa"
+
+if [[ ! -f "$ctf" ]]; then
+    echo "CTF not found in expected location of $ctf" >&2
+    exit 67
+fi
+
+# If this is not an ELF file, turn it into one so objdump works.
+if ! [[ "$(file "$ctf")" =~ ELF ]]; then
+    objcopy --add-section=.ctf="$ctf" /bin/true $tmpdir/ctf
+    ctf=$tmpdir/ctf
+fi
+
+# Dump the CTF
+objdump --ctf --ctf-parent=shared_ctf "$ctf" 2>/dev/null | \
+    awk '
+BEGIN {
+    intypes=0;
+}
+
+/^  Strings:|^CTF archive member:/ {
+    intypes = 0;
+}
+# Scan for each member, capture its name.
+/^CTF archive member: / {
+    member=gensub (/CTF archive member: (.*):/,"\\1", "g");
+    next;
+}
+# See if any non-shared dicts have any types in.
+/^  Types:/ {
+    if (member != "shared_ctf") {
+        intypes=1;
+    }
+}
+/^    0x/ {
+    if (intypes) {
+        exit (0);
+    }
+}
+END {
+    if (!intypes) {
+        printf ("No non-shared-dict types found: probably buggy deduplicator.\n");
+        exit (1);
+    }
+}'
-- 
2.47.1.279.g84c5f4e78e

