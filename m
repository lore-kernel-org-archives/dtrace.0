Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6204F1F130D
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 23:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738278909; cv=fail; b=YfzSwfREpE8Qajp4MXIMON1jWL6lArKDHGkspxxTvVe4H/Ezt6xapJ0xJAk6lDhIzien7kPLW/ZMkc2MLzkCtRKJsshGgwp98Xk1iGr1rO5ae/+jYN6ITf65ia4+3CJuUjWU2Cy82kp/oOghNiZKS/c+R1yK8QcUUx0FNlPmqLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738278909; c=relaxed/simple;
	bh=dTe1dZb8T7bAr6/rOrmbAFdHOJix28gk6OcGIbMk2wo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sSBBr5L8sO/nCsCMsYmhO0sRSRphFg6p03ikGwaXOOXBQSg/Hf58Wng+MvJTxTTs3pPsM7E/EAZAEubY1vAl9TE2sm1v3T6vHe8K6P9KNN0v0fxwxzTkBRrPzr/fTTYLvsnqGRy+F2AO6mx1W950994Vcum7WEJ8ehI9ZBnwSFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MFzFhQ1e; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dSDWMxoU; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MFzFhQ1e";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dSDWMxoU"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UN9KOn001662
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 23:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=+HTbUUs0fmgpshNMkm
	vLBm259PkuJwdFl9Htmj35rMA=; b=MFzFhQ1e+d2MvTnk8viCbQHFV33VG5JLy9
	lhQ8XbkjAuGtQ5Z/Xck97F4CNAb4KzMyz63XhdrOToEck3ywAjxo7EeEjINvf4r4
	OYMNhdCrAiTpfHF9LjeRe+2vB3eCJzcq8Xd1oY/1jvmG/fo2rSQHXf0R8J0vMljF
	yOkWQBBG6hlHzBJTy0OM470n0fTHv1H8BVw+l55dC2vKy6CX2wPn48IoIcf2uxTP
	2VDHWTVN4MLgE+WtNH0x7wNpqKrlfpkCZR99cIurFa3R0xfNrSTZ1VTo1JdLCUmJ
	n3nrUnldIyp8ILFO7im4/0qAt5VScwRH9ELr34ZJDcpDT3MVi4iQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44gjtg008j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 23:15:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50UN0Vhn004235
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 23:15:02 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44gfe48nww-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 23:15:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PjioqY76Dj4z8+z7/clGGpPPAUo08E/yUA7LO5dIgopWDEI6h/c6BzRyVnY4t0CGjHGXWuaIhQwvuB/hO0Txz8GVltnUXg0fPCpSMlNbYYwK3ZMxF0VVpV625mAYWyDmi5QtxCq/ulEQqjYKgA3LKffPtM5QFVKd28PqPT1dNiFq3lSOf7FVDn+goVrlQo+/czwhBzZ4qozcrnaRTK2ofKjhHMY3devA5tYHXNUvlrjpUb4zg2tOQeAXrS+cjYLDX71+S0tZ35b79WA5Fd7viJUFFK3p7RA/nLf3sLQPCKzvtIyVLGfLyd7OuYOcQ3xh6/+3nM0gI1n+i8H0Mas87g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+HTbUUs0fmgpshNMkmvLBm259PkuJwdFl9Htmj35rMA=;
 b=sQxL+NIr9IDJ5YQpJ+cDa1X4hBcYzUFOQac4Mb/tNd7pmL3v8heL4BeiuAAOgoMwVxELhLrapxQczcr53M+HNGeYuFUnoLSygt/OHJhtpScR0r68kYAtFoOXeDOVIQnjcNhb/4A1itbuRfQ4eem0Bkcb1hNOfeScVgJGmFf6l7l3SlvNMFrj7tnD4p+/u1PAbvEQXISrGes01xkKcJv8PIxq+/lSOEjdS6XQi0+4jlmqq3vED7+ONACYz0gPxkfTK2P0HE6Tzqqb2oJeTq2mAbQRbTVRMV8+TEaPC01DFzPzPws/LLVLmIVkxEl8W0LoQGEnhz9m3m1jrZcWEkv6QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HTbUUs0fmgpshNMkmvLBm259PkuJwdFl9Htmj35rMA=;
 b=dSDWMxoULmYZjnH786MW7MiA8Mm0HzdiT1/xolwYKq4WOqitR4HtygSM8hG3jR9aoVKtiL3gpWoEil5LZ6XAA27Qi7UU7oBt2ERlC1BiGbESEcKkuLC7wTSDT8QDHg8vDPww1+DQff2tQIfnMgCw1Zhf6RHIoFTGOG4SfOnbtn4=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by CH3PR10MB7394.namprd10.prod.outlook.com (2603:10b6:610:149::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 23:14:59 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8398.014; Thu, 30 Jan 2025
 23:14:59 +0000
Date: Thu, 30 Jan 2025 18:14:55 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 3/6] bpf: implement additional relocation types
Message-ID: <Z5wH76ByPwuv4XRz@oracle.com>
References: <PH8PR10MB633706565F4BEEEDA1D562F9C2EF2@PH8PR10MB6337.namprd10.prod.outlook.com>
 <961b140b-e70e-4934-3b1c-b8d9ce799518@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <961b140b-e70e-4934-3b1c-b8d9ce799518@oracle.com>
X-ClientProxiedBy: BLAPR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:208:36e::8) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|CH3PR10MB7394:EE_
X-MS-Office365-Filtering-Correlation-Id: 6442a392-55b2-4bdf-b7e4-08dd4183ea2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bCDb6Bvzl6aYsFo9rsMTWzzSCAsPZA/CJhdeF79prHHFbUW4V5wVhyejDxdY?=
 =?us-ascii?Q?PdI91N8+yw4fC9gkcVkDikoHXDlWYDQXHyBbMAJ7Pin1GvVEFTMY2ZdYMdQy?=
 =?us-ascii?Q?MTwBke1sm6QpFeUUvNyGOKJ41XzmiDHSXZxeyrOcexL91N6TrcWMAakWruLD?=
 =?us-ascii?Q?J85E0gEVb0Zbetv9s53/RfaNSUtlwXslvUew6zW1HRaAPtEG8Wd3N0CitFiD?=
 =?us-ascii?Q?odTBWl4f2DkYui2fZY1nWhunrhfsgZZkCrjheZGe6l5QO7wW1K1BJ0bc9cGf?=
 =?us-ascii?Q?hRE2LY8HTL4drSbBemB79rX28h/bmKMgnyhLpjtLe/tHH28t4j49jzFQemgI?=
 =?us-ascii?Q?+J0/raq6IuCggkmteD5OZcNerlnU39hKg7EzTts3BYVgo1yADHf6lG90YP5n?=
 =?us-ascii?Q?CzezfJIY03HFi963Xe/So/fu1HNz+3AydzTnW3280u3+Z3XdhSLRl78+CjXQ?=
 =?us-ascii?Q?WGAivy3okRWqaN1X/kUntmlOW1MvlzQ4KI57ABxFtwq3l3LsYi5oOqRDd4Km?=
 =?us-ascii?Q?nyQjS1joPXtZ7FK8gZHEstJCYtN8rlbMqLliUDJ4FlaNRk6xnh1jWCEXLSoi?=
 =?us-ascii?Q?szANQV3//L9GOQucm9OEIBgwLE7RB+tPuslPFqK8cNow01QUM6vK7PZanG8A?=
 =?us-ascii?Q?/lnsV5xx7N5Yu/glI8wQCcWtunlbSC0jIq6w61CPQTU+/WZSNLBtRGZc9kRk?=
 =?us-ascii?Q?MxcbjbH6RKM6sbPTJ1Kbs9Ms8Cuh8dLwJp85SQ2PTmj/B4JV//B97172guNM?=
 =?us-ascii?Q?76CY0w1iVeXzHoLcMmOgmczAl+BSbxwizXNFgZa4u3aXzilT5/6ZMgSpux+i?=
 =?us-ascii?Q?dQsHxDD5vkIUqAul/2BWuWrzoZgXC4FGJpGKogbRP+0nz9WdZdioAnk8mwVf?=
 =?us-ascii?Q?DYZA3qfmioDyVcpPPPrDDLNFbKf0MKhkNYkl9Ghe8eCbJI+s8XusJWrM3Jvq?=
 =?us-ascii?Q?rvnP2DKAxajyNNKVm+5CiShoDo4h9uKOnoG6DdOSEsJAfmOIaMPjDq1fub40?=
 =?us-ascii?Q?z4Lc2KvgXHRgI5+qlUB0SpDPgk6IPZYevqsskX/vzzvC3PiWKUXzg4JgREu9?=
 =?us-ascii?Q?7dtd93jMAUtOzALlqDIw337+8nGlYUGnba8WKpPWUNi/jexXrXV6cwCztgLn?=
 =?us-ascii?Q?W0t604H4L2/nzzteISyTonyoUtt1ST6gPb0qmgakrQPio+fPgdns4b70ZJzt?=
 =?us-ascii?Q?Cl0f81vJQc3VHs6TVe33Kysl7iSixyZb38eEjgNp4UTTibL+PEYj0e5jrtum?=
 =?us-ascii?Q?Yz2l/+HbAhB5gujit4NbK64FEyxdY0uJGwQcencO4PtUPP7o7/8+utvCdSzt?=
 =?us-ascii?Q?opkzx8dvgWb7m5Sew7s0UrirMXL5g//ljBiAWUI2XbitvKp3a3NG9x/DbQi0?=
 =?us-ascii?Q?SaGXe4v+piPTo4Ozv5V6tv5wkPff?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?et6q/04CznLC0nkf7OjRbyCWwK+4pM835ual0Zhkr9wlXjZ4H3W+Yo6Rl8iM?=
 =?us-ascii?Q?8d5EidxNc824bkhYiXzGmWgk8hFFvN87NbfSvVcfGozcmTq+zRw8cKvloE4W?=
 =?us-ascii?Q?IJJU2Ug4yfqXIetqbLr2zWG1UWbk02rbYWETLpZAVg/99rpNqenxA8gVRRhu?=
 =?us-ascii?Q?U2zfzMHcofYZh2J7CzcirTARBWxYLa3cz1VVCKPX2tFcUvDdoqmDL3Vz/K5n?=
 =?us-ascii?Q?+oIQp8aiabmXOi3SMt+0D8i1jtqHjT24TEoPZ0eAAPtHdlLHjdQQQ4fqbpqa?=
 =?us-ascii?Q?tgmepGsgqzTXd6QVEqcWLWrJJBbiemUZrsrhy0cNaElL9+ICxZ0muI2wbaYQ?=
 =?us-ascii?Q?A+u3yvfG2QPZVET7jAEjrWdLTfvL+UBxB4ka0X+B1vKtWCTI4XNMhtnkG64c?=
 =?us-ascii?Q?nt0mCAfu2km1IaEXdO6HUOqK14HGkdmOnw7W6cb6WVRIpcnqPDrJX1FZUcry?=
 =?us-ascii?Q?L/+SztKoxn9FF3VzIQBC9Cw3MbuXwMRDmuaUjiBxLS+SKbzBhUZp1viOYvfs?=
 =?us-ascii?Q?DcpvSYDbNG082zWWCCTNYkY5RcfmIu+BCU5oaRTnVDXI7DxodOJ2dBa+LY6G?=
 =?us-ascii?Q?ZJvJfsWwpk8Epd4XZy3FcawbKAi5/c6TXep/DZSugbgCnbXeqmJQqbHanQhU?=
 =?us-ascii?Q?egEBTjqGH6jGyZK3Phjsyr6x7U9dX5vxYbzPrylKkLaKkelGDpSrK05Gt5h4?=
 =?us-ascii?Q?DWwRFqrT5UbXHwTWzJl/7J78QYfpumZce5YOEi8lCABfMBnRQ6DQXu53xZeK?=
 =?us-ascii?Q?Yz+Q975ZDZiGRFNOBp5P0zUEoAcTe3sz1RNZCqGLRhGGjobfJWsJFp1fhict?=
 =?us-ascii?Q?DH3eJsQ9MPdoZKhOPtlYV7c0mLR1SCvrvQnBbhOSM5erIvSEah4G8HE4wEhF?=
 =?us-ascii?Q?4Q1FAzBVoZQ5eowY4drkqK/RR5Nfkc1xz76IrIdLdJ56DvObxvXMCMIR+mqo?=
 =?us-ascii?Q?0RoUdIDZ9SkNuYu5onKVYVVUswlcKE9UL+vTEK03IFfu1AYaNXXqVKki+Fv1?=
 =?us-ascii?Q?hDZjEjr1Shw8KKwBlQ0zmciNKEEXUKLnNut1wXeiln2gw/ziwLuRy3PlmVia?=
 =?us-ascii?Q?/6TOFGJtq4387dferF13x22/vy1ysYtJEqzFIbzDYE1QHKnTS3KM9Xmr798D?=
 =?us-ascii?Q?LKk5YGJEv9RupHrWX/Inz+lznuhh5R2gTBiJkXaTcaAB3uNSHbcCd4447ZFG?=
 =?us-ascii?Q?RXCmj/epsCV5Ccw4m+MTng/s3KUajEl96w42RMN4zJf8tr4cdv5RuHP6+6P/?=
 =?us-ascii?Q?KUes2E6uQ+FUdhL10+z3dZrA3JlOgTSzNUGgyaIkj1tc0qnTidmJpP/KkeKK?=
 =?us-ascii?Q?Yzjuzlj5DIkg4levZSyhipu3mcAIfl0C2sCnzZC8m4mQM21whvbkJ/8kkbXJ?=
 =?us-ascii?Q?hcq7rhXvkBmttuNgN/LRjW2QE2fAE538ma6a4IF5VrfqkbSLbK7BAoVYMs5p?=
 =?us-ascii?Q?+Clcm7Ql2NTukH9L96oo2sRopv4hyXWhcY0sjRvZPvlG3GfPIj6kBcKdox8b?=
 =?us-ascii?Q?rKCouRG9xjJ/zIlL3xXIO5FKfrz8vR1CHW/+3/Xn+j+FBYoZ/OyXCbXcFxly?=
 =?us-ascii?Q?HJlIfccFJPZk5jLKyyrPf4CwggxCaqzT46eLWPojMmuFmDcM6/RvY/zhu2vo?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ya9fptUjVMJeWFyx2AuUlyTYeZFiy+6g2li4QWCORXgHKAiIJTnWPee86sxmzyG4/ez2KxJ0/t17M5PiihZsYTuVLnigrLVI4Qm5DQU8zPCG+hgHMRpyFXk/4+KL0b/uBJHkU4pEhMqAYqhkcWezD9AKkv2WIki8UtewCm40wJ9OdvJjDSN/yJK5Xw9WHHn6g9ZFKbl/uKn3Y8voDGY+VO3qadgMO8Cf2wdxdWwDH8m6IjG6cKYYBBfNvPw6yDJj+Rac0Z17O1ZRIJS4lRlu8/U7t1YZt3eQIqxwM/W5bHWTvM5GG8O9kW9ZotA+4pIeueXAM62uydQrLTuwe694U1U+CT27KFEi2tEYsebs0loDG8tKbXq0ixfNJmQTUe804Fza3PzCErX5uSXVxaWKJ/YkuXrTFalX9twfXtk153v2NTut4yCnWcrjp1r34ihRvSX+JiLik+83L6bHlhwEzhcWNn69uGGpmuC7L0o0aUjEptsQ07tF9mwFGFQTO2g+bMdQ4/MiOWk9nnSmNTTP1dD0DObey9oXDUPFg/pY/PG9DvumYIAdjtw8g8mVAvxz0A/6acZRMUoJMWNDA3+CdrqFFXC4auGP2ZwtEE6ZgW0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6442a392-55b2-4bdf-b7e4-08dd4183ea2a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 23:14:58.3332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yrs5uZz0Pdp72EAw94uJNHqeAmzhl2JQdeiF0EFj/PXrg0c9wcccsid3ky+ty61x0bmZYQpG/cg9Fd6adTTJCWt/Er5KpVbvvdKw8oSFe20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7394
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_10,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2501300180
X-Proofpoint-GUID: mrMED7t180LVkQYHVuZWFnCYiEEJfl84
X-Proofpoint-ORIG-GUID: mrMED7t180LVkQYHVuZWFnCYiEEJfl84

On Thu, Jan 30, 2025 at 05:53:01PM -0500, Eugene Loh wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> and an explanation in the commit msg what motivates this patch?

Sure, though I think it is actually quite obvious for anyone looking at the
documented BPF relocation types, and the relocations generated by gcc for
BPF code.

> On 1/28/25 01:31, Kris Van Hees wrote:
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   include/port.h     | 6 ++++++
> >   libdtrace/dt_as.c  | 2 +-
> >   libdtrace/dt_cc.c  | 3 ++-
> >   libdtrace/dt_dis.c | 9 ++++++++-
> >   4 files changed, 17 insertions(+), 3 deletions(-)
> > 
> > diff --git a/include/port.h b/include/port.h
> > index 6ce8611e..0aadacb8 100644
> > --- a/include/port.h
> > +++ b/include/port.h
> > @@ -88,6 +88,12 @@ pid_t gettid(void);
> >   #ifndef R_BPF_64_64
> >   #define R_BPF_64_64		1
> >   #endif
> > +#ifndef R_BPF_64_ABS64
> > +#define R_BPF_64_ABS64		2
> > +#endif
> > +#ifndef R_BPF_64_ABS32
> > +#define R_BPF_64_ABS32		3
> > +#endif
> >   #ifndef R_BPF_64_32
> >   #define R_BPF_64_32		10
> >   #endif
> > diff --git a/libdtrace/dt_as.c b/libdtrace/dt_as.c
> > index a634b855..d3126f9a 100644
> > --- a/libdtrace/dt_as.c
> > +++ b/libdtrace/dt_as.c
> > @@ -492,7 +492,7 @@ fail:
> >   			case BPF_ST | BPF_MEM | BPF_DW:		/* stdw */
> >   			case BPF_ALU64 | BPF_MOV | BPF_K:	/* mov */
> >   			case BPF_ALU64 | BPF_ADD | BPF_K:	/* add */
> > -				rp->dofr_type = R_BPF_64_32;
> > +				rp->dofr_type = R_BPF_64_ABS32;
> >   				break;
> >   			case BPF_LD | BPF_IMM | BPF_DW:		/* lddw */
> >   				rp->dofr_type = R_BPF_64_64;
> > diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
> > index eebd923c..29cfbd84 100644
> > --- a/libdtrace/dt_cc.c
> > +++ b/libdtrace/dt_cc.c
> > @@ -1266,7 +1266,8 @@ dt_link_resolve(dtrace_hdl_t *dtp, dtrace_difo_t *dp)
> >   		if (rp->dofr_type == R_BPF_64_64) {
> >   			buf[ioff].imm = val & 0xffffffff;
> >   			buf[ioff + 1].imm = val >> 32;
> > -		} else if (rp->dofr_type == R_BPF_64_32)
> > +		} else if (rp->dofr_type == R_BPF_64_32 ||
> > +			   rp->dofr_type == R_BPF_64_ABS32)
> >   			buf[ioff].imm = (uint32_t)val;
> >   	}
> >   }
> > diff --git a/libdtrace/dt_dis.c b/libdtrace/dt_dis.c
> > index d983c099..b2e66754 100644
> > --- a/libdtrace/dt_dis.c
> > +++ b/libdtrace/dt_dis.c
> > @@ -639,6 +639,12 @@ dt_dis_rtab(const char *rtag, const dtrace_difo_t *dp, FILE *fp,
> >   		case R_BPF_64_32:
> >   			tstr = "R_BPF_INSN_DISP32";
> >   			break;
> > +		case R_BPF_64_ABS64:
> > +			tstr = "R_BPF_DATA_64";
> > +			break;
> > +		case R_BPF_64_ABS32:
> > +			tstr = "R_BPF_DATA_32";
> > +			break;
> >   		default:
> >   			tstr = "R_???";
> >   		}
> > @@ -853,7 +859,8 @@ dt_dis_difo(const dtrace_difo_t *dp, FILE *fp, const dt_ident_t *idp,
> >   		for (; cnt; cnt--, rp++) {
> >   			if (rp->dofr_offset < i * sizeof(uint64_t))
> >   				continue;
> > -			if (rp->dofr_offset == i * sizeof(uint64_t))
> > +			if (rp->dofr_offset >= i * sizeof(uint64_t) &&
> > +			    rp->dofr_offset < (i + 1) * sizeof(uint64_t))
> >   				rname = dt_difo_getstr(dp, rp->dofr_name);
> >   			break;
