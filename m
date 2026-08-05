Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685534854FA
	for <dtrace@lists.linux.dev>; Wed,  5 Aug 2026 17:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785949975; cv=fail; b=iC2rp0l/v1+QuZRGSQjjLyNqOAcCpJ0rEaVP4a8/wvdgEqhiBz4jiLIYZr4vssD7KFw2p2V/PbXNQEmI6ARSE5HXxSYXronpYPnlqJBolw8iYphkXfc7ljdsZp3aJ5VZrzqqtKZQBd7d4mteOT/0OMeITgMhx3iJw7cy4aXaLug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785949975; c=relaxed/simple;
	bh=sgSmUdAvfFTHO+rt5Q+x7JU171yFk2T53cywumJ2cj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CHP39twnQbKlXmxktApV5bdeQ/BkWbUrfngUCGu6Uno6a5n8XViwrjEaQNV36DcH2pZN2st8FIj1GZ0sBjybzdlLZvaAtUhSkyEfYaqbLIgCiUJ0LiYHsvMY/ydBjgxy24cliazGubSxcyEunYt8OBLjqtdoH5k3ed8bvQh/ew8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=M3Jh/laI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=y6O9qAWj; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="M3Jh/laI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="y6O9qAWj"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675GDbBw1044628;
	Wed, 5 Aug 2026 17:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=jMbyschGo14X1B6bUK
	TiXGaQE+NaOp0om4Njzami7Y0=; b=M3Jh/laImMGc+MAMiNDR59LQiPU+2Q133H
	8Tj6W4cXd9GCLcUb2YDpeTmE85vqoFXxwQiTrXmXgV/aGXyefsKKcM37/suK8P99
	0qR6/wjZHNi1XdoqraUWx26EdkXnNpIVECHSTqivc9DCYWWO5ZY1CcS9tEYA1Agq
	UQjQar7eftTr+7uC1mBy+Z+hJK25zt/aq9krmRcLRAqb02yVSH+8SimYw4MiY3Jr
	QJ5Wl4klQFjFZL07NWTfH5O1DRE86u4+0t5PErCgdNSNP2fDSJMAKz+pFzYQZj17
	kO8nZdxktvDHawljmqxitKAAJGNWWiDdO2IRW7rqed3tA93oW6Ow==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4fs8ugh94e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Aug 2026 17:12:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 675HAf7H037204;
	Wed, 5 Aug 2026 17:12:48 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011008.outbound.protection.outlook.com [52.101.52.8])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4fs78urf0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 05 Aug 2026 17:12:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DwBkbnTWGPuFtTqKSBl9TPkao9v2ZJxxMTFuxU/0Rpl7mUuOeC/jPxTehNu0ip3kKnAPpLwxGuE5zDJLL9tu1kyVGl3Ceocc58AdNtlvjNf700tP+XT8lJAMRGU3lusAJ2NJLJxLdiEIEw9DvicCTyZm47Kn8fL39dNXYz/2RUmtH3xeWM/ce8XPaMriXusx9klOG8k+PmZdFN5in3CLysNpaGaQ9jCCPpgj1KvpAhy2oLIj5KrRYrnCS+eGaZfretC/kg1s/s0m1utxzsuddapA+oGP1/2FiYh/J7ScgZy/APqwYq/zWZHCCDxuvr8OSeN2qadwTNJd984Y2IUfEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMbyschGo14X1B6bUKTiXGaQE+NaOp0om4Njzami7Y0=;
 b=Vwmi8agLrEkM2X5YYAsqfx3RF2UnIFoRCdYmN9u0yaoQ8QrJvQdXyn4Caxn0q00IUZFmQ6ZlY2UpC8vWVhit1gDURRot5tpnGB5ORz9tzrq0gKttfTqQhU7N20O2B40NJhFXSyIQwerMMJD7EGBA2U6125IWp2/msIfSFmz8NzeOnmpo88luipjW6XDn4EbzWKYkeAFKQkEEcMZcJ54KlEEQLRvPPyRhH5IxtZnTcLYMb7RVg6K3usrpyE4wslYAdTTRMIT7uxd6gjoazwsBZgcH5GeqzQ0EnREBD0dB4XCy4VGz8686u5XUAV8Tt0KsfWEGynU5vwiN2Jx69vwZ3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jMbyschGo14X1B6bUKTiXGaQE+NaOp0om4Njzami7Y0=;
 b=y6O9qAWjSbvFyE0QkybkgduGpNH4ysrri1GFvchwhaL7D+aHfeQMB8wUfNPDqR2u7kI8NMd/4HNasTPDK0cRC+0PDceZ0+ZYe2K+5rUgQ3oQB07vl05Y+MT1r+ghJLL2UbRyw4YWkDqMJy94mQI8kbvMmxrgbBSI6ac1w5Oxjow=
Received: from PH0PR10MB5514.namprd10.prod.outlook.com (2603:10b6:510:106::17)
 by CHAPR10MB997745.namprd10.prod.outlook.com (2603:10b6:610:2f7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 17:12:46 +0000
Received: from PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61]) by PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61%4]) with mapi id 15.21.0270.017; Wed, 5 Aug 2026
 17:12:46 +0000
Date: Wed, 5 Aug 2026 13:12:43 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Jacob Carlborg <doob@me.com>
Cc: dtrace@lists.linux.dev
Subject: Re: [PATCH v2 3/3] libdtrace: match BEGIN/END PID in the tracer's
 own PID namespace
Message-ID: <anNvC9SSZEv6CiyQ@oracle.com>
References: <20260720133100.77573-1-doob@me.com>
 <20260725180409.95012-1-doob@me.com>
 <20260725180409.95012-4-doob@me.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260725180409.95012-4-doob@me.com>
X-ClientProxiedBy: BLAPR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:36e::13) To PH0PR10MB5514.namprd10.prod.outlook.com
 (2603:10b6:510:106::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5514:EE_|CHAPR10MB997745:EE_
X-MS-Office365-Filtering-Correlation-Id: 69928567-a6cc-44e1-b549-08def314c4ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|6133799003|3023799007|22082099003|18002099003|5023799004|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	KbQ+bqLm7rui/9v1sglV86E/HClxw+D3k68wV2u74q6hSBGET9ULm1CnRIKrS807UI8SqVzFgmtevH9Rnllv2eqsCspRb6M1NzCFoZIBBCGTikm0b3PGN7Qp0sUjDS1qYAg8RO2LUgXHRhpbVyaLriAJ+CSy5xtqg7SRVdKEPUbk1f87XQYCy9Vv81bG/A2QnBn53QtFJx6WDlHxhZ4BqAOVCcxTxHU0gD1x/6a3k19h0gmCKhv/2yYnjfSCz/gAJJl4DMs3ilWUQklqO6dXgeqhzWwrpq7gjg/wlafiivF9OKZ2PpNPVITq2so/NE54v/7aMJOFMl0XqJ1zmfA04UTOkeP7PkJZqd0nYEbwD0Qv8Dtm6n+zacqz8egDpOrLIuROrT8sFj5P+bKzxfvOAHRwf+EaUqJZnugNzbtT7B3CWKvJgm4YH3NPO0smDPseprgvZQYkKoUQsN7dJPc7bLy/ea5zOgTGN1crvqOZvGY/S1m4JW1pR9MCRaxtCLuz1K03s4xvxEYhdY55B1CbxUuUwxUe8ZZBVyEfU1IsEgURiIDo2Cpv8sMFranWFOGyye494meRFc6JhPnoptlE2As8z/EHh6hGxGaOGK8rB9PdZmMYB7lx5zKe1h2v1d+LG8QBVJInjAUUBfV9b+WyVjtX6sbkfyk/RPsvaxiS1vI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5514.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(3023799007)(22082099003)(18002099003)(5023799004)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W8G85mS8ixVJ/jCyEfb5ytlNk7JTQ1FPezlk88xn+peoFuWA5KV9KgCLodQ5?=
 =?us-ascii?Q?5S9zTuYQzfHw34WovKpAEm2HApKKZKuJOJupEN+F1V6BF/X+aDYIWcnzJikf?=
 =?us-ascii?Q?Z7QKruGuCWzKJL6rIQL2K566MRXeoRXwt0d+Y366Rol9TxMQHwYi2OF/4u5H?=
 =?us-ascii?Q?6FbOHV1twVxgVGRorgMi/a1vt4Ezkq0LxAtY8b+lJA/Wt+DFlpGKZlsffte5?=
 =?us-ascii?Q?uC4InJukf5ADsl4rzViytd8zGdaQYPxkNtxeMXumvfH5S3DJboRTJxKmo33f?=
 =?us-ascii?Q?mK0t5ayr82gQlTxCqpDW8M9B/CoaDzRAc4Zgy+EdSumHIdAVSt1Ll2NGRSaH?=
 =?us-ascii?Q?Qsb/G3Am0e//ht4ResligB5UqggYyPBc3pvEZRxQW+9VcOZnLTsteYbsQNdT?=
 =?us-ascii?Q?rkvQBhXO75SGyTL7iVSMly3EI083lMGXHnGk3LotDprabrOuRvPbno/dBHcw?=
 =?us-ascii?Q?Ft6PS6z4ByxlJyDcFh3cgDZ7dk5HkCmUT6e5n68xUFp+jjDmIqgF2UHs0rcp?=
 =?us-ascii?Q?djDUJmhMrXxywMFmx4OeQ5NYXCu4TahSUpuirXaeJkzPhO21YVLu/+8UYQpb?=
 =?us-ascii?Q?s4TuQHRHDkBzj5pwz3/50UZJabyrTcz4zWuqdv4LCf5H+xNpChU1F93pTXp9?=
 =?us-ascii?Q?XSAi7OTjryl/DfupqVNW3FYvTJlSVfqZ7hHw94YUxb3/F/1I2B33TtH6Q5T2?=
 =?us-ascii?Q?0fL6cF08LvecCOY1W1fbACpRvadzI0zr0/YYkVJPXmMfxkuvhvqcKa9+Ab+J?=
 =?us-ascii?Q?73+WHC0rdQFlQGJbYwEe898IPbxzFPanPxR9v8VIgxnPfW6xW6TQpwBOXfF+?=
 =?us-ascii?Q?1Gpiq2k5iRo9qNR8IjUPo0f+4dyZtfq4yBLEXxYiplYaDeKPsj872lvYnDNO?=
 =?us-ascii?Q?0y9D/Qa0eJKrtEo1y1WxL7aifSrZ6f8vLIrEa1cv6NFpcixtIgTOFNjDG3C3?=
 =?us-ascii?Q?/XMD3VME07buVMlJVhuMBgfIBMySSF8c06MWHz+wYTf3T2M7kGwVVEGeTvSc?=
 =?us-ascii?Q?pdpwNSormK6kumrIWElV+Q2wiPJxb/+YevsoYZhitkvXfsyqt8pdvtu43djU?=
 =?us-ascii?Q?6AmVJWyOX6LLATxbT+P9FsreAczRp4AymQgYyEKxM+ho/Sf+WnB1QuHptpCY?=
 =?us-ascii?Q?FDxt47MS/g72cIitRStCjLK5DauMUUb0l4DCZBQ7SMdypeGcQ7FQsCnIyqoO?=
 =?us-ascii?Q?V+WiXAou5zEM6r2pCBuYnMyZoaeveP90NpONIMi13o/V3mJWQ33uMNqvLQ4g?=
 =?us-ascii?Q?jUiTfE/r3aW9BwLJnVSACMmvCit8XIuZWJOWJa+ZDpSlrg4w8Qymisue4wgd?=
 =?us-ascii?Q?ORqzmWID28qxGNi4S9nByZGu5kUlTSlYSYCUC4dSERx9Ue15RSzdcrkcnoJC?=
 =?us-ascii?Q?INaOiIUUniatajfzZaqWaH1LeLsh7j0VK4w5vSloS34+zJ8hY088RqbQ2d1e?=
 =?us-ascii?Q?pvyrPXhaDUGopzTL2OS/m67RLq8K8cYtrhm8oSszdzE2X0GPSc+EoYjgDtfH?=
 =?us-ascii?Q?LOnnZgOj1Inf1bpTDxRb6QIXSlUzI79JWj2ySChpYsOKICblILA3GHilCqUy?=
 =?us-ascii?Q?3nsnxw2K/LJe/6aUQeRhmXdTzw8lmQAlfl7YxLqSTHVLfwWlFT+N+Mp95i+N?=
 =?us-ascii?Q?fZ84dwuEyXdNomxT2yg+wD6VP6/gr9Cj+p6YRqF1G57Ta8HG131c2MeTKqEm?=
 =?us-ascii?Q?awQMg8/gc7cfXVKYavh/5OFb0NSn6z8Y2U26na0Z4oOw23b08GG5pvfA+7yF?=
 =?us-ascii?Q?Gzsf4zqAfQ=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	loRa6LBi6Dtrw3bOO0RUQznj+7NhzGdKRIGKrVCNiZG4oQwmitRkchpMjNPEAyeyqLLU+rCBYQtpOzLYa64Kvbd7e6PMqzFW+yC2YawwREv0EPYYgKBlhS3sj+kUPU/ZZPfajpmFrG8q4TCLgi4SljptvAf4UWpPx8o3ZLhUWcTBuXAEjVkVGb4KZ2xHgDARTWqPPyFRBvzKVpE++eG3ynFwoDKeo6KeyGpI7fcNQyTXLqjJvCWo72n1Q48LcuO/QQZ+yty0jTRLPnthP/CKLiJT03jabIAv8nTfZqKUjgDY8r0sr/cCmz4zQxT1VskHpPuqh4iw9jwbjHsEGF17iA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6W9mYXJAXbKswu2lB5xrew7vkzsX3N9zYpDgljyBFrOewQG7oiNAVaL2/bIHgOEHkbCEHGSwDxPDW+NZmPtr7tDcVSwtvN6wGUamn6ZKHolsUormJSXlpeiHH1l9j9kBGkNxnAp5L9+1YvIGzjQlMrbJAmb8ROlUY6sejYwbbbde4KtyDbxiH3IXATLfgsL3nql/zSKqekDZzwhxBo2tUEGpuye6O0zsfMXFRAd7475X04ca9mz7BD3aRph/6wSBDaskzHX2SC4++cS4t4cyabJh0VHZ/NkjHOueewl7Z4eN8PBPzuvj03Ov5EDooaxx68Z89u/yJnRVL/V7Tf+VGnpRUyzZT/KJzadk5VSuHP7tjuJvfrwVOPrN1xrsN2wQ7XU7UL/7wutIoEdTZVfxCkYHrivXs3aIpaXY6wNum6WvRE56MKE2oVXCR2e17xEPiU+FLOUIUOs/h8DUDAMtCqeGqMcKuuQNyYjTvWrQ1Jh90IlymUKnHLxSvngIElqbdOSRUIdxq8nCrQSpKwT19eRG7QYCBWSmQhitu+26r/wrAlUBpjXztm1M65wbO8NIbkSk4c7UdyA+CFGgHMdnc+tZOlhT30TSkE4xuzyLkvI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69928567-a6cc-44e1-b549-08def314c4ef
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5514.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 17:12:46.4171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /rGolLwHALU4zVmjj82dCzkQaK6APJVzDGfC4/RgDQajZxeH4MscAEiZcf3skkqm3UzNjmp+j1Vr0QuJlHCEA4W7D9B5yUKStHnFbQapzbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR10MB997745
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606160000 definitions=main-2608050140
X-Proofpoint-ORIG-GUID: 6HvNoc1a9Xr0585rLKtyKJMYxDtquaI1
X-Authority-Analysis: v=2.4 cv=XqnK/1F9 c=1 sm=1 tr=0 ts=6a736f11 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=BqU2WV_vvsyTyxaotp0D:22 a=HHGDD-5mAAAA:8
 a=yKS3OY7a288Qbqs6mkIA:9 a=CjuIK1q_8ugA:10 a=5yU3S35YU4bGjq-dph-N:22
 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13510
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDE0MCBTYWx0ZWRfXxC7J96fnP81H
 jqxC9eisD0biZPsTDhFN/as/0eOxFgEuHioil0azrN/zZYxWxpG0Yg7eYhDqiR26Uq7wj+cNpJI
 es2FpJOLwW4KmHNn3mtg5PJQHUzgZO6yhAF1xzydV+AvWM3DBEZj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDE0MCBTYWx0ZWRfX41WYjfYuIqrJ
 KvF3fyI5qscUUJCtcFim66iqKK6nprJ7dSqrzVo2WBzDP3eCFlSxj6yIRP24NnJRYztoLOAtTsb
 FRLhUFdmCcyCj81Kj7z9VKN49abeeH0oQd93n0jfys0QzdTCY2eIMM+hZnDl1HdbVU34KOZD0RZ
 8md6UlQ86agnAkFVwJTY3nIjkDhdmeRw1jMZqMdXP4IB9QwyhHZ94gWx09OmmKC/Cn7BlzH5d58
 uD6IYdn+z/mQ2W+YQUD5TMaVPRNtFLQzrc0yXWFM9CVOXfAhuPnpjLbTmK5eTXAJcu4FBYhuU52
 2apvvxJSf/SWVej4LPD3Zu6AZawQnYofGWjdsreSNNSx6KVUnVtTvPbRZ+73YrUdFkfN3j/BV2S
 MazOyQMMc3aBbL025WYGgx9khH6FsESyxWZTIso27OM6bylNuz1Zq8PywIlYJnWgHowGWsmA8r/
 Z6qEyKjrrJA5StJxnAmKQJugk/NCcy1e8J8njTgA=
X-Proofpoint-GUID: 6HvNoc1a9Xr0585rLKtyKJMYxDtquaI1

Thank you for this patch.  I actually implemented the code to get the dev/ino
pair for the PID namespace in dt_vopen() so that we can store the values in
dtrace_hdl_t.  That way it is available to all places that need to retrieve
pidns-aware PID and TGID values.  I also added a function dt_cg_ns_pid_tgid()
to encapsulate the code to use the correct BPF helper based on whether we are
in the initial PID nameaspace or not, and I therefore modified your patch to
simply call that function rather than doing the work here.

I'm updating the other places in the code that need to be pidns-aware, and will
post the entire series once I am done with that.

I am also adding tests so that our testsuite going forward can ensure that
DTrace works in a PID namespace.

	Kris

On Sat, Jul 25, 2026 at 08:04:09PM +0200, Jacob Carlborg wrote:
> Without this fix, running any probe hangs with no output,
> like `dtrace -n 'BEGIN { trace("hi"); exit(0); }'`.
> 
> The issues is that the `BEGIN/END` probes are implemented as uprobes
> on DTrace's own `BEGIN_probe()/END_probe()` functions in `dt_work.c`.
> `bpf_get_current_pid_tgid()` reports the TGID in the initial PID
> namespace, which does not match `getpid()` when DTrace runs inside a
> PID namespace. Using the `--pid=host` flag when running OrbStack does
> not help, because it shares the daemon's namespace, not the kernel
> init namespace. OrbStack's own supervisor runs in a nested PID
> namespace. On bare metal `--pid=host` does reach the init namespaces
> and the bug wouldn't appear.
> 
> This fix is when DTrace is in a non-initial PID namespace and the
> kernel is at least 5.7, use `bpf_get_ns_current_pid_tgid` instead of
> `bpf_get_current_pid_tgid`. `bpf_get_ns_current_pid_tgid` is
> namespace aware.
> 
> Signed-off-by: Jacob Carlborg <doob@me.com>
> ---
>  libdtrace/dt_prov_dtrace.c | 58 ++++++++++++++++++++++++++++++++++----
>  1 file changed, 53 insertions(+), 5 deletions(-)
> 
> diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
> index 4b788507..179ee4d6 100644
> --- a/libdtrace/dt_prov_dtrace.c
> +++ b/libdtrace/dt_prov_dtrace.c
> @@ -9,6 +9,7 @@
>  #include <assert.h>
>  #include <errno.h>
>  #include <string.h>
> +#include <sys/stat.h>
> 
>  #include <bpf_asm.h>
> 
> @@ -129,12 +130,59 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>          * the trampoline to minimize the cost of pointless firings in other
>          * tracers, even though this means preserving the context in %r1 around
>          * the call.
> +        *
> +        * bpf_get_current_pid_tgid() reports the TGID in the initial PID
> +        * namespace, which does not match getpid() when DTrace runs inside a
> +        * PID namespace (e.g. in a container) -- so the BEGIN/END probes would
> +        * never recognise their own firing and tracing would never activate.
> +        * When we are in a non-initial PID namespace on a kernel that provides
> +        * it (5.7+), use bpf_get_ns_current_pid_tgid() with DTrace's own PID
> +        * namespace so the value is reported in the same namespace as getpid().
> +        * Otherwise fall back to bpf_get_current_pid_tgid(), leaving the
> +        * initial-namespace case (and kernels < 5.7) exactly as before.
>          */
> -       emit(dlp, BPF_MOV_REG(BPF_REG_6, BPF_REG_1));
> -       emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
> -       emit(dlp, BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
> -       emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, getpid(), pcb->pcb_fastlbl));
> -       emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_6));
> +       {
> +               struct stat     st;
> +               int             use_ns = 0;
> +               uint64_t        dev = 0, ino = 0;
> +
> +               /*
> +                * The initial PID namespace has a fixed inode number
> +                * (PROC_PID_INIT_INO, 0xEFFFFFFC).  If we are in it, getpid()
> +                * already agrees with bpf_get_current_pid_tgid() and no
> +                * namespace lookup is needed.
> +                */
> +               if (stat("/proc/self/ns/pid", &st) == 0 &&
> +                   st.st_ino != 0xEFFFFFFCULL &&
> +                   pcb->pcb_hdl->dt_kernver >= DT_VERSION_NUMBER(5, 7, 0)) {
> +                       use_ns = 1;
> +                       dev = st.st_dev;
> +                       ino = st.st_ino;
> +               }
> +
> +               emit(dlp, BPF_MOV_REG(BPF_REG_6, BPF_REG_1));
> +               if (use_ns) {
> +                       /*
> +                        * bpf_get_ns_current_pid_tgid(dev, ino, &nsinfo, sz)
> +                        * fills a struct bpf_pidns_info { u32 pid; u32 tgid; };
> +                        * the tgid is at offset 4.
> +                        */
> +                       dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, BPF_REG_1, dev);
> +                       dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, BPF_REG_2, ino);
> +                       emit(dlp, BPF_MOV_REG(BPF_REG_3, BPF_REG_FP));
> +                       emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, DT_TRAMP_SP_SLOT(0)));
> +                       emit(dlp, BPF_MOV_IMM(BPF_REG_4, 8));
> +                       emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_ns_current_pid_tgid));
> +                       emit(dlp, BPF_LOAD(BPF_W, BPF_REG_0, BPF_REG_FP,
> +                                          DT_TRAMP_SP_SLOT(0) + 4));
> +               } else {
> +                       emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
> +                       emit(dlp, BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
> +               }
> +               emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, getpid(),
> +                                        pcb->pcb_fastlbl));
> +               emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_6));
> +       }
> 
>         dt_cg_tramp_prologue_act(pcb, act);
> 
> --
> 2.50.1 (Apple Git-155)
> 
> 
> 
