Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9E945001
	for <dtrace@lists.linux.dev>; Wed, 19 Jun 2024 03:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718767977; cv=fail; b=H4MIoqooOzeBX77k6W/KdD8bA1PpEqWH0L1XxnPcFMu2LtkJ4js/qFUh4tEkV5SywdHfdordz/rrzpoj7WWIZmVBrwd3iVUkGzJ7EPYZyawHdi0yN8ehhRamNXvKqQcLsgGEcsQazoPzOmGRqdV8xoPRlAe63RjRUG6mXoZb578=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718767977; c=relaxed/simple;
	bh=dYLNApPXXaR++vYqA7QQJBibkatUhIS+VO6snjn7kq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hm6fkefeZ16bbTQlTz1nmvojZjqjaGwtS6lbIQ5UvibvxpYmMxxziRXeljWNK4cf1C6LdbRjM9GiHUtdoX5mDdk2hY/BMC1vFqJn+hTT5CreOEpzCvnQlJTdN+4JtSErlbrTsgbTH3hWi3UGPXqJohOotTRrDWfOc941zACTJv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TtaLMj/r; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PxUkM95U; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TtaLMj/r";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PxUkM95U"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J1tUQm005060
	for <dtrace@lists.linux.dev>; Wed, 19 Jun 2024 03:32:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=Q7WO17uQ9f0taoh
	T0L0FH9+2bZlvZasuKpRC6jT2qLw=; b=TtaLMj/rtCyl1rpDbYvb/ta/Nzoseh6
	KQKJGGNQnS+EZzuP8+QQVdPh9j1gT7whE5rbefRg9W4qcejNpTF2U858t6DjP83m
	5k9pAiVBqQ8s/RRM2D65fcyas6FeZVRMQSgs+88ZE2/v1a7N+usmykBlDJPB2YE8
	BXIr00dwtBUWh/ggOg6LND/O9juX1aGGilhP+1+lPd6sJxMT9DCgCuwANHZcgO4Z
	R7JFnspifqbTHiPxEJWirHlde0tq6w8DMWW0TIe2dX15zk+bTB87qYOO4IjdTq9K
	tbb07W1pCD5QgzFCPuo9NMFDr+bITg+/BRNG14eYp+lVodQNoj9tJrA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yuj9r0bvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Jun 2024 03:32:54 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45J2bZWI032890
	for <dtrace@lists.linux.dev>; Wed, 19 Jun 2024 03:32:53 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ys1d8r8hm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Jun 2024 03:32:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oBKXRx6AYTRB9Z/i2vxeI03fZ2ipAGPQvJ3uIMvC8ku5KVqjNHHV5U350yZ3Jij9CQseuSYVXV2RgAfrIa0czkCgNPor1K709tmeFf2DBFO+59HogJ3Ass1Hy1wZz6FSs7JcL4yZCPJSDJQW9ExrPnrm8IjoH5fVtosxI3J6dgEBcwtnufhM1Ws4+OtlzcTV88ViQoX3Z1VR0mhes7DXKkChvndd0NDDLKwP6GMb38qDM5h89hxPl9QqVrCn7G8bSEXsFESGQ6DSJVB8WHfADShfsyBl9tXyqqrKxpocAEn0pLcEIhbQ75huESti2pou7RBpFRxqfY6M2EVRZHow/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q7WO17uQ9f0taohT0L0FH9+2bZlvZasuKpRC6jT2qLw=;
 b=G7F+CUYSuj8zUU8RsDTK3gnGdwn+nV9fTGQcis1dApG5K3i7afG0LA9SgWMIRiGcqSIte0aN+piNcoxdwYCZYHmbHfU0XGPvpZCwiaJYrYQosBqSCd6O3+/lTwsFaLE4VT30EtbWcgnTAHmJmzccLuH/FcoD65uc3+WkjI6g6IH4O6UN7QeN1MaNaqn9guk85IuAh5NEC5yq8JeKR1p93UlVozbck9+eCYbGvgpGvyn411b+2HhIdi84xI9xeqpTYmZXdThnqbHJoxeYlh+9XxTELXVZVY4tpw0tztHD4SeRRETFpbOYJVPZLrzdYI04uQMl1YHTs91LJdN2+EdufA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q7WO17uQ9f0taohT0L0FH9+2bZlvZasuKpRC6jT2qLw=;
 b=PxUkM95Unj5NUY//JzdjRREUTn1nXSQehIFviaYh2kMqk6QsspVHY3HPrNeJE77pK4u567ibHCTuQGh0+F24uggSDz9ippoi8RyPKX3x1nsHi2UP7FG8BJD/cJLbJK4aiAEDbuDPcUjumwYERNwdvQwFkpaWqWgSGMJCa6Vwggc=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SJ0PR10MB4591.namprd10.prod.outlook.com (2603:10b6:a03:2af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Wed, 19 Jun
 2024 03:32:50 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 03:32:50 +0000
Date: Tue, 18 Jun 2024 23:32:48 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com,
        kris.van.hees@oracle.com
Subject: Re: [PATCH v2 1/2] translators: support 6.10
Message-ID: <ZnJRYDRrlwAsNRr7@oracle.com>
References: <20240607184155.316904-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607184155.316904-1-nick.alcock@oracle.com>
X-ClientProxiedBy: MN2PR16CA0018.namprd16.prod.outlook.com
 (2603:10b6:208:134::31) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SJ0PR10MB4591:EE_
X-MS-Office365-Filtering-Correlation-Id: 7014746a-c646-422e-e57f-08dc90107f28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UFM7kexUFnYeYncC/7XkFPhhnsRFSNqIqgf/U+r9He5AbmJ1NwR2CD3yu4Es?=
 =?us-ascii?Q?9eetaXP55tcTizQV7/YrXDV5EGvfEAd6VPvRle5ZD8dS6DppCGtXnbjZiPYA?=
 =?us-ascii?Q?q1SZ0QV+cHbIVUNz3vVNcP/SCkFGGlk1nVdqteuY4cXf6Oq81mzjGSmG5CWo?=
 =?us-ascii?Q?sYemujmqv1dcWOfPQ059Nc5fj6JupYXu0T8B1kGyfvcC0HJl3BjQ4QJcCprf?=
 =?us-ascii?Q?yuXD76qFR7kiVoGK3K0suylROrhzH1Xu9SixIUOO+0pkXx/xX6GUw6JOB503?=
 =?us-ascii?Q?1Fbt/XC3Euf6zOUANwXAj5UTdLowZpchY27VHXCJmdpXAw3XFQCOxvaJMbhY?=
 =?us-ascii?Q?biqNiHKNer180kIqKn6HfrgRE7uyIv7B+sUMxH5W6BaRk7/aZMzogwxh4VrH?=
 =?us-ascii?Q?QDBEyGiIBk8+sC7BoXWg9SzTLiesUHODUOr/UmvemV3v4kZaE48ueHmv05SF?=
 =?us-ascii?Q?+DeTW0qrOo3TQi9EaFZ7tHGq9KjSXW6HCTVXPqh/kC/ayIH4iz1eW6W0wxUl?=
 =?us-ascii?Q?9UK93eMdP6qynd4mrpWl8LZHowflvTSMpol2fE7tCUKroluJpV0n3mYsk4ii?=
 =?us-ascii?Q?62aH/C5spq1b+SXnCCE0zeE5hK2lehYAp7oBAXID8h1E+L2/blkd3IIGsL/1?=
 =?us-ascii?Q?oUCmTDPebYfGmylZBuO1CIBijgjjF0hAoNFiNe5TElGE5fmuZCKr8DXWRrKq?=
 =?us-ascii?Q?PNq00x6t5IYW/xo2ZiHldwlJPkNNpCHwt86QSarMDoYOEzwA/2hYHbjK8Lfx?=
 =?us-ascii?Q?QoDwaEr/SyzAxvQufMHzK22FTDQIKTQdbOkboueCBsIRhi2lRAivoY2Ec570?=
 =?us-ascii?Q?q30pNCRuLzV7bMtfyY97sl8C6bha4DZOM3RGnZe3qpA6rU+0pi/++fnvLBTO?=
 =?us-ascii?Q?Zg1Bes2J/Hea0AOvQrPy3rXdz5FMCltqZY/v/wRhNFpPPd2f5vmse8KiDcpr?=
 =?us-ascii?Q?GmAdUzDrNd1WqHilx3MfFT9wUvBcoD/mfti/4Bhh1j7ZmUBdf7Cqn4NroNiX?=
 =?us-ascii?Q?T1oOwgTq36XqYDju6UXgryorxRjOGYD83eZndqBXH9CtEdN5QoY45Nts7OLs?=
 =?us-ascii?Q?BWPPvCZrCnlvtnYeHjOKX2+Q0dNQPLC5Gi8rI05SoO+ORYpYq3ZflcckwR0y?=
 =?us-ascii?Q?mytgTwI4n/K8l2fHvEFTIo5idJ5uzwYFEKqpCS0AN+VFsoFinXLb5rDy6xVU?=
 =?us-ascii?Q?vGkkMOvibbJqyS7TF0f0OxUHLRDOmhu8wb8Jf/kBqVIeL8TDMNVynSYqtQua?=
 =?us-ascii?Q?OZ4yxTqjxPNr83KxH+EQ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0uJSd4QKBtKZIOBFRPpzeoT4cSJfm60wvC5qHt3o4XwFmfGQ020WGPNMT6Vb?=
 =?us-ascii?Q?OE2JuPiIp996S/WzcF5mPGyB9gYAo01PxtiwFfUJlrajxhcLd4k/kcldQaG3?=
 =?us-ascii?Q?p8ON622wjKAc7NrkrWZTcQ4c4S0vwNgl1IipewPRzDGXn34JQZYmpEWnIQaY?=
 =?us-ascii?Q?wEoyD9l9pvfZyf7cuyVqv8D3dSCINDXMDel5xXJmxnqDejM93y0CuZLcp6ef?=
 =?us-ascii?Q?qFB3CcNxGFFJHxc3yCqbm3HutXCv3OQU/dJKhXUQv/fWky11IW0HU1P3tsLY?=
 =?us-ascii?Q?/Gtp4cCH88384vHV6/JURBvPVO2GXZ7m4gf7oyRvkpF7TOd5ZJw5mg2E4zOY?=
 =?us-ascii?Q?8VUBZMOmiLkT3pZ0ZD+lpVW5mz0sKwhwVuYvv0VXONMFY4XAkvkyOUUEXlrP?=
 =?us-ascii?Q?rZuqxj29eiSYK5UgAU+lIrJanoOiCKYIUJKdSGW79QN6Q3SLmOwO/2CpE/A1?=
 =?us-ascii?Q?KcCr52VKjgnIACKMu1SdG3zDuH38OtH/5jHRN7UAzWGh/CZ4t1WKdfmqgh6M?=
 =?us-ascii?Q?rqoUnSUOvZFw6eB+F7dxnJ3cZXaKEvrYEVz6WUcE+QnDmiGqm9cr6JzboOFZ?=
 =?us-ascii?Q?RYUI92MRasuxe9p3ECLzSKT3aUq2alF9f1uR/MO/JMLcw7TptlwHRbvUW4Wc?=
 =?us-ascii?Q?AnHQvfnfsjPzq2QeYL0+QkeCglD1StCeX5AR3dieepcNTHrh2CI0YSXUWUAv?=
 =?us-ascii?Q?deqSxXf60CNozB/nFajUrESkWjfgYT5lnIdJmbvz6ji4yQt0av03e8pK2R1E?=
 =?us-ascii?Q?admZ9CweNxI/pCOFtD99DZNJSRF+hQu9l9jUjGZoWtBsZ0NwRjC42EvQX5TO?=
 =?us-ascii?Q?/f6DlLaJ7uUObIOITOoTwyYnlgjjvXhTn1Ht5OVQS/sxg+ZiovvLAuCUOd4I?=
 =?us-ascii?Q?B2SAan2P3t9yFTgg2r25XRyuBIp9OWh2X8a0s2TnC+87FfAtXM2cIC1UF+3r?=
 =?us-ascii?Q?BcUGmEE8A8sgztk5I4mNPkQeZzc7RVwwsuAhqNnCsGXBxsgtrmpbhUZMn07E?=
 =?us-ascii?Q?ieUA0t8kQcApnzXTruu2d57IqCqZMWV5/ooBBYeCbtv4jI89/0e1RaqHlXyJ?=
 =?us-ascii?Q?5ZsRUOiHJ5gEq0eLGAcgu8eiBRzuJcDk1bSkdZm0nkEY1etX70tk3hj1K8c3?=
 =?us-ascii?Q?rOKRDfIeTiApSYNOmhaU/UEeBIAZriXPTJWSpA36ciKJtqzNrQxfec7Mtqdl?=
 =?us-ascii?Q?JEDRF9b5T6m4U6LYhPkuaCrQ0lcoQt9WvgtT2cEJh40pZsZwjRep6ykPw2fF?=
 =?us-ascii?Q?47ZCAPK3/c+wkT7MxyGS/dl0PWrHNjXNcIFon5f3nq6t8Rp8PHcGKxuk05+0?=
 =?us-ascii?Q?AF1Eq/dR6059xfULhaFyVNXcPynEyRyp1NEiF3h/8LobBBrQnuXyoPiFMwnr?=
 =?us-ascii?Q?sraixK+Fy19H/Fe4gwrx8ozqF1Oqvs/bt/LqVMlfsvwJcBlSUrA1EilQlwAP?=
 =?us-ascii?Q?SocQpb7phdd0DIEmLa4phFwr87O8cWgOEqhdzGDuRAm+V20WFZhU5KqByY+E?=
 =?us-ascii?Q?rvdfZKOy/2+9IF2tAr7mQGzQQJm19ZY3jMAoRePLzF1Us7UJllAklhQRLILK?=
 =?us-ascii?Q?6xaBlLTOXQzh8mbNNbuowsXjLjaFSBllfBccwBuIXrvycGLncSp33ROINoa2?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	V1KcYg73KAaNDZ1wBY0Ne9j8azcd4TkyKPB2iKRgWa6kp88PtV1/uqdadedG6CuF5SGCiQZSN80iGqNcmph3BM/tMxw2+rD2k1fJaqtL/hou4/ChrmDke7U3SCcipKlFqT+r0mDnrLx3mPLn8LSmX7lwHzcuKqyCUejw2QpCE5+Jk4pqBG9QM0w66RdLGp6Pgq+Ryw9lAkgmovznK9m1HJ0uSWDzGT9RJ3yRl7afAF9te97XJac4g4dSf8K6V0pEJAkZFAYm2m7icjqMQWZ227iV4cDkD4E9CSuYy/Z6cpbu6meur1uTUQJs6Tr29aessSAvrthYDhBMICrvu9VzZ6xMKi/mRdrZL/81DeFBkvizbMFq3i5AEQESnG9QnA9Jtvo4/5HCjvsj8fR4F5e8bFR6sAHaTwrXd4LYzTvcVbdxdVAK2DN61pXZPTzQUvNL5V6IRfzrrhPQuWHPzb39ogE4kIUeIImF6BopPNPHM8OGVz7cmXL7t9I2kV1t3KsIIAQ4rHtgVHI3HTECBxn6Wp86WXvSzI2FiMDKMTXEWy7EWCwN/xqv82og6cFWdoXmp/4xa7D8dTR/XdyDmN5TwsKLYHpxYE7mC+po6bYK89M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7014746a-c646-422e-e57f-08dc90107f28
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 03:32:50.7902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QAP0aVRI3yOGWhF5Y2z2BSjo4kNRLGkekZ0XyHHGzAFgCuYRv2ASOjqnlkJRK7zPr9m/ZVIJ9Pv3uwEOpW9qoPLL3UrvWqYvSD97tjdKHjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4591
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_08,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406190025
X-Proofpoint-GUID: fz9x7kWffpRg79lbKymTBrvmy4yz_no5
X-Proofpoint-ORIG-GUID: fz9x7kWffpRg79lbKymTBrvmy4yz_no5

This patch breaks generation dlibs for kernels < 6.10...  See bwlow.

On Fri, Jun 07, 2024 at 07:41:54PM +0100, Nick Alcock wrote:
> This changed the block device into a component of an atomic
> flags word (so we need to change the .d.in as well to pull in
> the releavnt #define for the blockdev portion of that flags word).
> 
> See kernel commit 1116b9fa15c09748ae05d2365a305fa22671eb1e.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>  libdtrace/io.d.in | 6 +++---
>  libdtrace/io.m4   | 5 +++--
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/libdtrace/io.d.in b/libdtrace/io.d.in
> index b3da517778264..f44f53f092dce 100644
> --- a/libdtrace/io.d.in
> +++ b/libdtrace/io.d.in
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2012, 2023, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2012, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -69,7 +69,7 @@ inline int REQ_SYNC = REQ_SYNC_VAL;
>  define_for_kernel([[__bi_rw]], [[(m4_kver(4,8,0), [[bi_opf]])]], [[bi_rw]])
>  define_for_kernel([[__disk]], [[(m4_kver(5,12,0), [[bi_bdev->bd_disk]]), (m4_kver(4,14,0), [[bi_disk]])]], [[bi_bdev->bd_disk]])
>  define_for_kernel([[__disk_chk]], [[(m4_kver(5,12,0), [[bi_bdev]]), (m4_kver(4,14,0), [[bi_disk]])]], [[bi_bdev]])
> -define_for_kernel([[__bio_partno]], [[(m4_kver(5,12,0), [[bi_bdev->bd_partno]]), (m4_kver(4,14,0), [[bi_partno]])]], [[bi_bdev->bd_part->partno]])
> +define_for_kernel([[__bio_partno]], [[(m4_kver(6,10,0), [[bi_bdev->__bd_flags.counter & BD_PARTNO]]), (m4_kver(5,12,0), [[bi_bdev->bd_partno]]), (m4_kver(4,14,0), [[bi_partno]])]], [[bi_bdev->bd_part->partno]])
>  define_for_kernel([[__bio_part_dev]], [[(m4_kver(5,12,0), [[bi_bdev->bd_dev]]), (m4_kver(5,11,0), [[bi_disk->part_tbl->part[B->bi_partno]->bd_dev]]), (m4_kver(4,14,0), [[bi_disk->part_tbl->part[B->bi_partno]->__dev.devt]])]], [[bi_bdev->bd_part->__dev.devt]])
>  
>  #pragma D binding "1.6.3" translator
> @@ -98,7 +98,7 @@ typedef struct devinfo {
>  } devinfo_t;
>  
>  define_for_kernel([[__bh_bdev_dev]], [[(m4_kver(5,11,0), [[b_bdev->bd_disk->part0->bd_device]])]], [[b_bdev->bd_disk->part0.__dev]])
> -define_for_kernel([[__bdev_partno]], [[(m4_kver(5,11,0), [[bd_partno]])]], [[bd_part->partno]])
> +define_for_kernel([[__bdev_partno]], [[(m4_kver(6,10,0), [[__bd_flags.counter & BD_PARTNO]]), (m4_kver(5,11,0), [[bd_partno]])]], [[bd_part->partno]])
>  #pragma D binding "1.0" translator
>  translator devinfo_t < struct buffer_head *B > {
>  	dev_major = getmajor(B->b_bdev->bd_dev);
> diff --git a/libdtrace/io.m4 b/libdtrace/io.m4
> index e837ef65b86f7..aa406ec375698 100644
> --- a/libdtrace/io.m4
> +++ b/libdtrace/io.m4
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2005, 2013, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2005, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -11,7 +11,7 @@
>   * to replace those tokens with their values to create the finished io.d.
>   */
>  
> -/* #include <linux/buffer_head.h> */
> +#include <linux/blk_types.h>

This causing a dlib generation failure because this include is not sufficient:

In file included from /home/kvanhees/linux-uek/arch/x86/include/asm/pgtable_types.h:380,
                 from /home/kvanhees/linux-uek/arch/x86/include/asm/processor.h:21,
                 from /home/kvanhees/linux-uek/arch/x86/include/asm/cpufeature.h:5,
                 from /home/kvanhees/linux-uek/arch/x86/include/asm/thread_info.h:59,
                 from /home/kvanhees/linux-uek/include/linux/thread_info.h:60,
                 from /home/kvanhees/linux-uek/include/linux/spinlock.h:60,
                 from /home/kvanhees/linux-uek/include/linux/wait.h:9,
                 from /home/kvanhees/linux-uek/include/linux/wait_bit.h:8,
                 from /home/kvanhees/linux-uek/include/linux/fs.h:6,
                 from /home/kvanhees/linux-uek/include/linux/highmem.h:5,
                 from /home/kvanhees/linux-uek/include/linux/bvec.h:10,
                 from /home/kvanhees/linux-uek/include/linux/blk_types.h:10,
                 from libdtrace/io.m4:14:
/home/kvanhees/linux-uek/include/asm-generic/pgtable-nopud.h:18: warning: "PUD_SHIFT" redefined
   18 | #define PUD_SHIFT       P4D_SHIFT

The cause seems to be that you should add an include of linux/kconfig.h prior
to including linux/blk_types.h.  And in all, including linux/buffer_head.h seems
to be safer because blk_types.h says it shouldn't be included explicitly except
to break include loops.

>  #include <sys/file.h>
>  #if 0
>  #ifndef __USE_UNIX98
> @@ -43,4 +43,5 @@ DEF_REPLACE(O_NOFOLLOW)
>  DEF_REPLACE(O_CLOEXEC)
>  DEF_REPLACE(O_DSYNC)
>  DEF_REPLACE(O_RSYNC)
> +DEF_REPLACE(BD_PARTNO)

Thus reports an error when BD_PARTNO is not defined (and that is the case for
kernels < 6.10).  Wrapping this in #ifdef BD_PARTNO // #endif might be enough
to fix that.

>  #include "io.platform.m4"
> 
> base-commit: 454c6d47bf408415f7eb52ea701779f041aa6957
> -- 
> 2.45.1.275.g567cb0950c
