Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F1032C8E
	for <dtrace@lists.linux.dev>; Sat,  2 Nov 2024 01:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730509788; cv=fail; b=PPH7wKAttQ6CSfXEroO9XDXFtyoJrL4INiyQoLv7Bn8njCBuopXnPu6pUgzjnl/tyNA3ZDSZgAQlMhpZ/SuVEwo5m6m9Q3tppdu9D9F5VY194USxxFGAENSVkGmXQuNXadEQyWH0YmTZFrQ8By8+4VlO7t6F+KAInviX/lGcrEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730509788; c=relaxed/simple;
	bh=yeaCe+LYAmo6IEw9VOflZcNr+LKyB1I+V0MYnnwiUDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=b8Uhww5h85G7me6H/q9zfY8f/vcfUcIBHpOF394G9F87VEVR0hkjxFINw9aR/wH73Xj426ThLgQMfYMFL5+QBLRyhJFz9gBIn2XdraF2XXfrT/yp+KouAULlDpcMFvlcQA/FbrlCNg1sSSmKfTq5p582n2hSm7dUa68Ta9cFBUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dz09JwCh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tdMyxt8O; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dz09JwCh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tdMyxt8O"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A20UGxI022199
	for <dtrace@lists.linux.dev>; Sat, 2 Nov 2024 01:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=tWZKD3604tvcurrbTP
	ZJ0+PSbiPlZUriZen/cvaxeGg=; b=dz09JwChfEghR0v8k3VWSUMUSfEAuhtAh8
	QzV6DoeDs8hguaR/ufHI/SoVa4Rpch0JZxmS9AytKwFn2ntL95FChote3St7/GEh
	zn574hAyLn8A9CP/eRPhvbQ+N7ng0HpBJ1TrLzXHHA+xvSRHHR8pY8Jb1CYKCQBo
	r+I/4sm/+vNaXotKYnHzo5zMvpl91Y+A2vjhVvErdZ4RC0kuHY1GN9tGU1qdUQV1
	wH30LFNtfZppqF2uvPD/rtoMvAT8DPW54WQsNBOlvbXJG2tECSp0yFhtcsNIbe5q
	XCJlBr1DARsOTeg4Cv9X+kqLcReL26YPJ7mkmUWS46L748MHkEaw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdxw9c7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 02 Nov 2024 01:09:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1NbRRV004210
	for <dtrace@lists.linux.dev>; Sat, 2 Nov 2024 01:09:29 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42jb2ynxqu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 02 Nov 2024 01:09:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=of0GCevLZT41twNZLDb5aVLnAr4TlZ8uLTyeagMhUYP9EVrlzJ+j3l8MHDyDXHq5Psu3bPIHxNaJCoZSBvAQPxAD2NoKhTKEWJHtzQGNcU4mQE+CY6yZRKfuO5hh+HMruEHoYa/sFvnTHHcsv8QghjEsMpiagPDo77mKgSwUkSxzc/8UsoGT4U+96y/LfAc2gm1yKXqxSUk01xSaLdZxdLIM9i8YS3diB2aLzZQZnbgMlfyM8ptx5wMIYcHUFUyAxVgb6qOG2V7iSi4z7xraQddFY/2kQA1k12m5aCACTtN02Mbre73WghljnihzTuRas5sXuytPeaw4DS1NfM2L/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWZKD3604tvcurrbTPZJ0+PSbiPlZUriZen/cvaxeGg=;
 b=QLkE8WqvE58Hf/RAIM6zUXbYa2dTxnpswYvLpuoubc+FJk1Tj6dwTfAfqHQLS4RhIcuCUxUFJw7K/i/u4Yrmsi9msRD7ifGRxBvSHWWJ1I8qN0OtvP/7TJnpNAhEMGXlleddFhGyIlItFuruNMzHF+xP6qVCMQZ3RyM/7q4gnDQTcykmJvoWQc4NV2mDErLSv7zGERWKF/1TjNwJwFsQ0KII12Y1y2KzWkmX/8Gx12x7DrgPtvjOtmKKXlRjokmee+31OFzC+2K9I5Xv9bOUXh1icEqmwlIYkVrjvgM1DEzSkL6ITXG0Vj1DQjeBEdVcgd7HMzg0qMW7sghuXIlbBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWZKD3604tvcurrbTPZJ0+PSbiPlZUriZen/cvaxeGg=;
 b=tdMyxt8OW55KoK/dpPrDZ8esCyOOoaZklI6hhBAveALqiuXQ4HpgZUdTYp1vPkj9xSnNeyefAsKz/DZHFG6rNr4V5sDpD5VLO54H3pOBqleWZaxsBEJj9r6b6c4DZO+hhL9nkdb7rBfGZ6LpK3jgaCguzPjPCd2fJTJyKiEia8g=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by LV8PR10MB7797.namprd10.prod.outlook.com (2603:10b6:408:1e5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Sat, 2 Nov
 2024 01:09:25 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8114.023; Sat, 2 Nov 2024
 01:09:25 +0000
Date: Fri, 1 Nov 2024 21:09:22 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v4 4/5] usdt: typed args and arg mapping
Message-ID: <ZyV7wuoL7J6us1ri@oracle.com>
References: <20241101155712.397674-1-nick.alcock@oracle.com>
 <20241101155712.397674-5-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101155712.397674-5-nick.alcock@oracle.com>
X-ClientProxiedBy: BLAPR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:208:32b::20) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|LV8PR10MB7797:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cc52217-d8e8-4c46-6599-08dcfadafe0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xQIqL2F9dMKBR2AB5+VwUTI8XBJvw4M4RMSlZMf+a6ORIxCIqnYOvOS8ax2K?=
 =?us-ascii?Q?LGgn8zEP58JGM2+Hl5lwIAghSaL3BM/CKgrZ06l8/UVzPaDic7nZF2bdfCMI?=
 =?us-ascii?Q?GBTeGwMcv2C88uxVEh02+fYgaJlK2tddM2slwslaO+z7gU6JdTMVhYav1mw9?=
 =?us-ascii?Q?FxxUpb+zLsGwru+S9ZRtURSUcWvTeo7FxdKnGcpn2kue2cnnZXzYIp8ZRSK/?=
 =?us-ascii?Q?TvkH5D8wTMs1g5FYk/h86QjWxz60gzqxpxSPWVVbRQHaxo8qXfA8tInShWVp?=
 =?us-ascii?Q?MB4gqpiy54raGsNAo3qZZ4MRkiIgsO84Kxy2upXAGtb5Tj6WcFLuI5RCIByV?=
 =?us-ascii?Q?9lWfRS+Ql9FGYKZI9Mm4Hx+2zUF7VNOJW4asDKMV/yareA2LIr7sZlKXfqMx?=
 =?us-ascii?Q?QDUheoP6Pw+mhJN8GSXWKJ7Hu+84jGT3SqsKFSmaVZHMpF0unoerC9OvLDmn?=
 =?us-ascii?Q?EdSj6tx+6VVbeWYmQ7Na4JoejjXsEbHgPstS50l2dPIS1XjpOZawfLgC3FND?=
 =?us-ascii?Q?y7QOTlhXTRz++3pA0N9hklmgcVCcs7ktzZUCr03KVfP6aWkcn3avQaz/u2MO?=
 =?us-ascii?Q?xz8AXQlbm5hDn7JrPWx2J3luuEluMblAcXCclF7LLQNXtaJ77uyOl68kyU7/?=
 =?us-ascii?Q?whGwfjTWKtUPp1u6R6AoSNkIiYVYQRASGO6RKO6xsewx9lSFYunSaGjS4tpe?=
 =?us-ascii?Q?y3DcfGKGe0SGtEiW2HCMgtMhw5ZjZclJ9Qv1aIGH4QWIpUrfjxBt69UQ/xNa?=
 =?us-ascii?Q?J711MEKF8ZAXMZ1PAdpSWbVGriUPkuWoV0PAC2W+HrOUgeu8OLrb17u+NmH3?=
 =?us-ascii?Q?pREKF97VeKk5F5841zo7Noa0m2QuNR4Kg9vIcNl7Krjho8sFEK2sNwfFZS74?=
 =?us-ascii?Q?swTDHF99PrO/t35lH++XDXnWwtCMhqWP8OAksTjQ5Yxl/Z2cZ8/2K8Nvp3Ux?=
 =?us-ascii?Q?hsQTi1HvOKS7z0TXW7N9mFGTSik4GEf5NSpTIqvYFgFP5PbwPlzbsQ4aG2Pc?=
 =?us-ascii?Q?OkSL1E1x9DkdcundS2mH6jTbjMCMxHtD3Rk+jGXov+A446FneveN0+6mi9v7?=
 =?us-ascii?Q?rHs1Q9JewSOhyd5hNAh3QIMTmgC+QDCOXN7E4EZVSYrjcf/JAIFyWeohqHuS?=
 =?us-ascii?Q?qQ6dcYU/dRUKRmh+xkflBCBpjuQAXT7lSxS/tX0mh8Bgb2/CJVKHFdEaSS1E?=
 =?us-ascii?Q?irjwTim2jHkjiwiSC52/rX0e46yAuYhZ2EtNZW+rZYbs6zWxdU2Sf3yFQRIK?=
 =?us-ascii?Q?dtLQnSQOWQiFm9dN6ceAMiO+DXrh1+MapQoydj5JAkEjvMFUYhTntPRecqxu?=
 =?us-ascii?Q?xarNib2TzeYrOw/1lWUaU9vL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xwd/g62frM3saoIfDRydqU5st/2rA2xbOlaqdln6o9XxBMrXsHCugNrcG3G6?=
 =?us-ascii?Q?jnpErp9HePQT4Iq3itHlSVpj7PXuYD3s4gJVQFha+zqdQhddwFury37VaHm/?=
 =?us-ascii?Q?EiFrKpubNrv+f1Bev+4X+zgPeteh1IvWM3BsdzBagAb5b8FQ9PAbn1uvn1YF?=
 =?us-ascii?Q?PEhiBLktEliXKnrl+ILrewqCj99CgRxPwD3if09FoWg5mz5GVY90nOTWIot9?=
 =?us-ascii?Q?TwFAP5os07DbsUFWQ9849yrC6HEtNpbmpcSbwnkLVbBOmb4Yr8Mg64vQrMb6?=
 =?us-ascii?Q?QSqKtYjxLI4Kqnz5vwucl0qP/zOfbTRbE1asr0x+FnkyJC9ySe0R+ALlaj06?=
 =?us-ascii?Q?7/MDF4CEprOb2C8dTq5B9LAjuFFjVVAt3xlAzKpN75uKEDRPgdiwp3QrLbDu?=
 =?us-ascii?Q?Wj9KN8jAyxJ7D8m1D00lPdiNzgoENssQIMv/clpkdocDQ4FPjh7rCi4JQ2BP?=
 =?us-ascii?Q?sgW5dEr/A36mMKkU4SBY9no41omCelw2fVj/tWBQZ4iZAOU5cnwOo7DwC7KN?=
 =?us-ascii?Q?AKnXABuVBq2OVbzpAFmSaSXoqPKn9GJXqPa8UVc8+/8TQJLgjK+mRw4D97zE?=
 =?us-ascii?Q?P5lb2lsWYPB6zluLXDWAOWzvR2q2CJ3bfJhvRhtkfM1vO18beBjgM2ywvSQI?=
 =?us-ascii?Q?GvOmUC6J02x/CcMtV3zZS7WpY4PQO/DpkI6vGNjEyj47r8tkVLsNfyim8Cte?=
 =?us-ascii?Q?Ocz/6nG0vvkcLpuOleotWmlFnuF6DxUEaGc/CtqjPfv3OdFvQK0X7llNOA6b?=
 =?us-ascii?Q?sYwWCd0FBxcaBCoUfUSha45Km0NPw0ZCaV72wwo4CpO6g0pLEq4wH7zJFlpk?=
 =?us-ascii?Q?e/zCH7wEBvMAyPG5Fet1WcUbn8qSV9+ZjbYgRa3yU7GWtjyfpsCpNyeEs0Qg?=
 =?us-ascii?Q?A6pfRTrNeJtP4f3l9ILVxMXlw3qOIl8t3byNtwuRrLi0tCgrvBlFXwOdbzVb?=
 =?us-ascii?Q?aMgq9z8BkELqcVE9NChWIyiCtZvAu1URsMRtDdmwfsrT5EKXMLdZMHa2wtAf?=
 =?us-ascii?Q?+ymBxjQKVy12pCO4l/Ikjh7T2YXnA8UKXLacsFxG8el6l0XJ2/iTs161eAcS?=
 =?us-ascii?Q?nnSPF2Fg0yW5gczr4MSX9EsDwxamNBTu5a24xTKCVXOw/+KopGNp+bEV5qGb?=
 =?us-ascii?Q?8Cd+MvrXUcPcGstBkIBu6PLPmbdFb8WqCjbH/r3FN4tUD3BtNgZeJHbpP9wi?=
 =?us-ascii?Q?yZAcDTnjcwnBBQhbZmq+4Z2mAwyoCI1gUUmTvhn7aoaUxTBWpoorB40vyLsG?=
 =?us-ascii?Q?P7rR+Cc/kCcHpCufheNjOtjDOQYetcPckCiXdm/FXYmtRewKZUr1R87V9XHs?=
 =?us-ascii?Q?GW0buPOoIazWUuCOZivu1dAlP01HPPLt+rYz/AH4T5YG4ykfdrd6zdCiKS/C?=
 =?us-ascii?Q?Qeop61rW8B3PYtF1fnX05rdZn8tkhumJZvDdX5+bYPja+0EM7/bsKtxySTBM?=
 =?us-ascii?Q?W718/6zJ9p3dkjMMWptJ/T/r2ylAhaOxwevtkU2GvAyoSdf6gmuoHflhOrnn?=
 =?us-ascii?Q?33kS0QahdXoKev6sw2ZQdhKPzQhgfIjgPi+f4hc62MRM81cmMO168YNHtlPy?=
 =?us-ascii?Q?tt4b+lmlPDaXuIzQiOHP8JNOdkWysiGFk3tNFXUlpesIU/AOo4NDIytnv6Uw?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xITQpx4G8hBVQi6Buy5OszozIdzfHC8sf8/mnecTquOnmKHJz2S6KXXI3hW1RiqiwTezChEmeeCnxbixI8By8NnPJyNd0nR0zHp/G5J4PvoEnkCVZr5ICHcUyVRe6XzV/aBArZiYXGCuFMIXkGA1p3jzzVkRU5UqWXW//hvMzWpwwADCADwTjRwBiGeW8gNuUgZkPIX0ltM90jQD6INqhT+5M0qblOSrfvoBDw21GPy135lU6Q5jW1pPJu7vjD1aLtRhNQY9R/WL4yCL6mpa7PjtcfDes2vGs9O1aYqfeaZuhEOTZHddCtkV+bwZkvZbxkw6OGyzSXMmoh+sJTj8OOmi1wMRddE6s4AkEO7KoC2+XLWs3tIcjc4+UdWXLZ4/tRwgozHzMN8Uf+/DlRED69t16D5Jw6RYaAzAnwrNdT/RW7cfQzFBpMABhcq9TeMPuTn7IHRBq2umojdCqVFsEVWP0dhm2ZFySISfMo7698a0Yub1+366Q1tHQq+Ssua4UmMOTpUGUhurfdsKYcNZ2sGRSF/mmmDk6jE+XeY7pTCMB48br/93Agnv4nRXQ+JZZmGM+RyMyRvIe8yJK1rcD2nMxQiz+jUF2wSEpgNKjf4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cc52217-d8e8-4c46-6599-08dcfadafe0a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2024 01:09:25.3360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sv7AXhTZL/qmLQ0H6ne3V1q12rbx/LBbYkOY3qP9FmMbHDrt/NQUnt2opChZarJkN57snHkylwC/faIPYR3Fx7PsOZ+TBwveqLiZ5EGz4Fw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7797
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-01_19,2024-11-01_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411020007
X-Proofpoint-GUID: EqibUkTsL7-LA2jM_e5MWQ-TbPYmYgS0
X-Proofpoint-ORIG-GUID: EqibUkTsL7-LA2jM_e5MWQ-TbPYmYgS0

On Fri, Nov 01, 2024 at 03:57:11PM +0000, Nick Alcock wrote:
> This change propagates the arg type and mapping info we just got into the
> pid_probespec_t onward into the underlying dt_uprobe_t, shuffles the native
> types before handing off a 1:1 mapping to the dt_probe_t, and calls
> dt_cg_tramp_map_args() to apply the requested mappings.  With this, USDT
> probes should now have visible types which obey the :-notation translators
> specified in their .d fils (this is now tested).
> 
> The probe info has been moved from the underlying probe to the overlying one
> as part of this: underlying probes don't have any user-visible args to
> get info for, and their probe_info functions are never called.  We do all
> the arg reshuffling in a function ultimately called from USDT probe
> discovery via provide_underlying, so it predates trampoline setup let alone
> probe_info on the overlying probe and all the args info is present before
> it is needed.  (We intentionally do not shuffle the args in
> dt_cg_tramp_map_args specifically so that we are not sensitive to the
> relative call order of trampoline() versus probe_info(), but there's no
> escaping the requirement for USDT probe discovery to predate all of this:
> but this was already a requirement in any case.)
> 
> We make one assumption for simplicity, noted by a TODO in the source.
> We assume that overlying probes all have the same native types and mappings,
> so we don't need to look at more than one underlying probe to figure out what
> they are.  DTrace always generates such a thing, but DOF specifying multiple
> overlapping probes seems perfectly possible for other programs to generate.
> This should probably be validated in dof_parser.c in future.

Two comments:
1) DOF is DTrace.  If other things generate DOF then they better make sure they
   generate DOF that is compatible with DTrace or else it may not work.  It is
   not an assumption that multiple USDT probes cannot share an underlying
   probe.  That is an actual fact due to the implementation of USDT probes.
   In other words, there is no assumption here, nor a real TODO.  The USDT
   provider implementation does not support more than 1 USDT probe per
   underlying probe, so you can depend on the arg data stored with the
   underlying probe to be truly representative for the overlying USDT probe.

2) Why not validate this in dt_prov_uprobe.c, i.e. when creating the underlying
   probe?  If it was already created for a USDT probe, then we have an issue
   because two USDT probes on the same underlying probe is not supported.

> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>  libdtrace/dt_pid.c                            |   1 +
>  libdtrace/dt_prov_uprobe.c                    | 159 +++++++++++++++++-
>  test/triggers/usdt-tst-argmap-prov.d          |   5 +-
>  test/triggers/usdt-tst-argmap.c               |   5 +-
>  .../dtrace-util/tst.ListProbesArgsUSDT.r      |  34 ++++
>  .../dtrace-util/tst.ListProbesArgsUSDT.r.p    |   2 +
>  .../dtrace-util/tst.ListProbesArgsUSDT.sh     |  83 +++++++++
>  test/unittest/usdt/err.argmap-null.d          |  41 +++++
>  test/unittest/usdt/err.argmap-null.r          |   2 +
>  test/unittest/usdt/err.argmap-null.r.p        |   2 +
>  test/unittest/usdt/tst.argmap-null.d          |  32 ++++
>  test/unittest/usdt/tst.argmap-typed-partial.d |  49 ++++++
>  test/unittest/usdt/tst.argmap-typed.d         |  48 ++++++
>  test/unittest/usdt/tst.argmap.d               |   5 +-
>  14 files changed, 455 insertions(+), 13 deletions(-)
>  create mode 100644 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
>  create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
>  create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
>  create mode 100644 test/unittest/usdt/err.argmap-null.d
>  create mode 100644 test/unittest/usdt/err.argmap-null.r
>  create mode 100755 test/unittest/usdt/err.argmap-null.r.p
>  create mode 100644 test/unittest/usdt/tst.argmap-null.d
>  create mode 100644 test/unittest/usdt/tst.argmap-typed-partial.d
>  create mode 100644 test/unittest/usdt/tst.argmap-typed.d
> 
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index 71ac1754d343..189b15f61a89 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -950,6 +950,7 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
>  
>  			p += args->size;
>  			seen_size += args->size;
> +			args = (dof_parsed_t *) p;
>  
>  			if (!validate_dof_record(path, args, DIT_ARGS_MAP,
>  						 dof_buf_size, seen_size))
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index a8c1ab2761f0..fd7ad1643946 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -57,7 +57,11 @@ typedef struct dt_uprobe {
>  	uint64_t	off;
>  	int		flags;
>  	tp_probe_t	*tp;
> -	dt_list_t	probes;		/* pid/USDT probes triggered by it */
> +	int		argc;		   /* number of args */
> +	dt_argdesc_t	*args;		   /* args array (points in */
> +	char		*nargvbuf;	   /* array of native args */
> +	char		*xargvbuf;	   /* array of xlated args */

Not really arrays, though.  Just a binary blod of concatenated 0-terminated
strings.  Since their content should have been validated by now, why not just
store them as a single concatenated blob, e.g. argdata rather than as two
separate pointers?  You never end up using them anyway once the args data is
populated based on the strings.  So there is no need to keep it separate.

> +	dt_list_t	probes;		   /* pid/USDT probes triggered by it */
>  } dt_uprobe_t;
>  
>  typedef struct list_probe {
> @@ -123,6 +127,9 @@ static void probe_destroy_underlying(dtrace_hdl_t *dtp, void *datap)
>  	dt_tp_destroy(dtp, tpp);
>  	free_probe_list(dtp, dt_list_next(&upp->probes));
>  	dt_free(dtp, upp->fn);
> +	dt_free(dtp, upp->args);
> +	dt_free(dtp, upp->nargvbuf);
> +	dt_free(dtp, upp->xargvbuf);
>  	dt_free(dtp, upp);
>  }
>  
> @@ -516,6 +523,87 @@ static int discover(dtrace_hdl_t *dtp)
>  	return 0;
>  }
>  
> +/*
> + * Populate args for an underlying probe.  This really relates to the overlying
> + * probe (all underlying probes associated with a given underlying probe must

The first 'underlying' here should be 'overlying'.

> + * have the same args), but the overlying probe doesn't exist at the point this
> + * is populated, so we must put it in the underlying probe instead and pull it
> + * out when the overlying probe info is called for.

You need to be more nuanced though because what you say applies to USDT probes
only.  Yet, an underlying probe may have an overlying pid probes associated
with it as well.  What you say does not apply to pid probes.

> + *
> + * Move it into dt_argdesc_t's for use later on. The char *'s in that
> + * structure are pointers into the nargvbuf and xargvbuf arrays, which
> + * are straight copies of the nargc/xargc in the pid_probespec_t.

As mentioned above, why not combine the two into a single blob?

> + */
> +static int populate_args(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
> +			 dt_uprobe_t *upp)
> +{
> +	char	**nargv = NULL;
> +	char	*nptr = NULL, *xptr = NULL;
> +	size_t	i;
> +
> +	upp->argc = psp->pps_xargc;
> +
> +	/*
> +	 * If we have a nonzero number of args, we always have at least one narg
> +	 * and at least one xarg.  Double-check to be sure.
> +	 */
> +	if (upp->argc == 0 || psp->pps_xargv == NULL || psp->pps_nargv == NULL
> +		|| psp->pps_xargvlen == 0 || psp->pps_nargvlen == 0)
> +		return 0;
> +
> +	upp->xargvbuf = dt_alloc(dtp, psp->pps_xargvlen);
> +	if(upp->xargvbuf == NULL)
> +		return -1;
> +	memcpy(upp->xargvbuf, psp->pps_xargv, psp->pps_xargvlen);
> +	xptr = upp->xargvbuf;
> +
> +	upp->nargvbuf = dt_alloc(dtp, psp->pps_nargvlen);
> +	if(upp->nargvbuf == NULL)
> +		return -1;
> +	memcpy(upp->nargvbuf, psp->pps_nargv, psp->pps_nargvlen);
> +	nptr = upp->nargvbuf;
> +
> +	upp->args = dt_calloc(dtp, upp->argc, sizeof(dt_argdesc_t));
> +	if (upp->args == NULL)
> +		return -1;
> +
> +	/*
> +	 * Construct an array to allow accessing native args by index.
> +	 */
> +
> +	if ((nargv = dt_calloc(dtp, psp->pps_nargc, sizeof (char *))) == NULL)
> +		goto fail;
> +
> +	for (i = 0; i < psp->pps_nargc; i++, nptr += strlen(nptr) + 1)
> +		nargv[i] = nptr;
> +
> +	/*
> +	 * Fill up the upp->args array based on xargs.
> +	 */
> +
> +	for (i = 0; i < upp->argc; i++) {
> +		int map_arg = psp->pps_argmap[i];
> +
> +		if (xptr) {
> +			upp->args[i].native = nargv[map_arg];
> +			upp->args[i].xlate = xptr;
> +			xptr += strlen(xptr) + 1;
> +		} else {
> +			upp->args[i].native = nptr;
> +			nptr += strlen(nptr) + 1;
> +		}
> +		upp->args[i].mapping = map_arg;
> +		upp->args[i].flags = 0;
> +	}
> +
> +	free(nargv);
> +	return 0;
> +
> + fail:
> +	free(nargv);
> +	return -1;
> +}
> +
>  /*
>   * Look up or create an underlying (real) probe, corresponding directly to a
>   * uprobe.  Since multiple pid and USDT probes may all map onto the same
> @@ -530,7 +618,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  	char			prb[DTRACE_NAMELEN];
>  	dtrace_probedesc_t	pd;
>  	dt_probe_t		*uprp;
> -	dt_uprobe_t		*upp;
> +	dt_uprobe_t		*upp = NULL;
>  
>  	/*
>  	 * The underlying probes (uprobes) represent the tracepoints that pid
> @@ -590,8 +678,11 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  		if (upp->tp == NULL)
>  			goto fail;
>  
> +		if (populate_args(dtp, psp, upp) < 0)
> +			goto fail;
> +
>  		uprp = dt_probe_insert(dtp, pvp, pd.prv, pd.mod, pd.fun, pd.prb,
> -				      upp);
> +				       upp);
>  		if (uprp == NULL)
>  			goto fail;
>  	} else
> @@ -613,6 +704,8 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  	return uprp;
>  
>  fail:
> +	dt_dprintf("Failed to instantiate %s:%s:%s:%s\n", psp->pps_prv,
> +		   psp->pps_mod, psp->pps_fn, psp->pps_prb);
>  	probe_destroy(dtp, upp);
>  	return NULL;
>  }
> @@ -787,6 +880,9 @@ static void enable_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
>   *
>   * The trampoline will first populate a dt_dctx_t struct.  It will then emulate
>   * the firing of all dependent pid* probes and their clauses.

pid* and USDT probes and their clauses.

> + *
> + * uprobe trampolines will also arrange for argument shuffling if the argmap
> + * array calls for it.

That becomes a problem when a uprobe serves both a USDT probes and a pid
probe.  We shouldn't be mapping any arguments for pid probes.  No need to have
this comment here.  If it needs a xomment, put it below where the mapping is
actually done.

>   */
>  static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  {
> @@ -864,7 +960,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	}
>  
>  	/*
> -	 * USDT
> +	 * USDT.

Why?

>  	 */
>  
>  	/* In some cases, we know there are no USDT probes. */  // FIXME: add more checks
> @@ -873,13 +969,19 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  
>  	dt_cg_tramp_copy_args_from_regs(pcb, 0);
>  
> +	/*
> +	 * Apply arg mappings, if needed.
> +	 */
> +	if (upp->args != NULL)
> +		dt_cg_tramp_map_args(pcb, upp->args, upp->argc);
> +

I would add a dt_cg_tramp_save_args() here, followed by dt_cg_tramp_map_args(),
because the mapping should act on the saved copy of arguments.  But if we need
to do anything else with arguments, we want to be able to restore the original
arguments.  That is a function of the trampoline, not of the mapping function.

Incidentally, you could consider adding a flag on the dt_uprobe_t to indicate
whether argument mapping is needed.  It is more likely that we have argument
type data without mapping than with mapping, so being able to avoid making a
copy of the args (and going through a loop that won't generate any code) is
worth it.  Adding PP_HAS_ARGMAP comes to mind?

>  	/*
>  	 * Retrieve the PID of the process that caused the probe to fire.
>  	 */
>  	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
>  	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
>  
> -	/*
> +        /*

Eeks?  Indentation issues again?

>  	 * Look up in the BPF 'usdt_prids' map.  Space for the look-up key
>  	 * will be used on the BPF stack:
>  	 *
> @@ -1083,8 +1185,49 @@ attach_bpf:
>  static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>  		      int *argcp, dt_argdesc_t **argvp)
>  {
> -	*argcp = 0;			/* no known arguments */
> -	*argvp = NULL;
> +	size_t		i;
> +	list_probe_t	*pup = prp->prv_data;
> +	dt_uprobe_t	*upp;
> +	size_t		argc = 0;
> +	dt_argdesc_t	*argv = NULL;
> +
> +	/* No underlying probes?  No args.  */
> +	if (!pup)
> +		goto done;
> +
> +	upp = pup->probe->prv_data;
> +	if (!upp || upp->args == NULL)
> +		goto done;
> +
> +	argc = upp->argc;
> +
> +	argv = dt_calloc(dtp, argc, sizeof(dt_argdesc_t));
> +	if (argv == NULL)
> +		return dt_set_errno(dtp, EDT_NOMEM);
> +
> +	for (i = 0; i < argc; i++) {
> +		argv[i].native = strdup(upp->args[i].native);
> +		if (upp->args[i].xlate)
> +			argv[i].xlate = strdup(upp->args[i].xlate);
> +		argv[i].mapping = i;
> +
> +		if (argv[i].native == NULL ||
> +		    (upp->args[i].xlate != NULL && argv[i].xlate == NULL)) {
> +			size_t j;
> +
> +			for (j = 0; j <= i; j++) {
> +				free((char *) argv[i].native);
> +				free((char *) argv[i].xlate);
> +			}
> +
> +			dt_free(dtp, argv);
> +			return dt_set_errno(dtp, EDT_NOMEM);
> +		}
> +	}
> +
> +done:
> +	*argcp = argc;
> +	*argvp = argv;
>  
>  	return 0;
>  }
> @@ -1152,7 +1295,6 @@ dt_provimpl_t	dt_uprobe = {
>  	.load_prog	= &dt_bpf_prog_load,
>  	.trampoline	= &trampoline,
>  	.attach		= &attach,
> -	.probe_info	= &probe_info,
>  	.detach		= &detach,
>  	.probe_destroy	= &probe_destroy_underlying,
>  	.add_probe	= &add_probe_uprobe,
> @@ -1178,6 +1320,7 @@ dt_provimpl_t	dt_usdt = {
>  	.populate	= &populate_usdt,
>  	.provide_probe	= &provide_usdt_probe,
>  	.enable		= &enable_usdt,
> +	.probe_info	= &probe_info,
>  	.probe_destroy	= &probe_destroy,
>  	.discover	= &discover,
>  	.add_probe	= &add_probe_usdt,
> diff --git a/test/triggers/usdt-tst-argmap-prov.d b/test/triggers/usdt-tst-argmap-prov.d
> index 28134baa6fa3..d8c3e88c4616 100644
> --- a/test/triggers/usdt-tst-argmap-prov.d
> +++ b/test/triggers/usdt-tst-argmap-prov.d
> @@ -1,10 +1,13 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
>  provider test_prov {
>  	probe place(int i, int j) : (int j, int i, int i, int j);
> +	probe place2(int i, char *j) : (char *j, int i, int i, char *j);
> +	probe place3(int i, char *j) : (char *j);
> +	probe place4(int i, char *j) : ();
>  };
> diff --git a/test/triggers/usdt-tst-argmap.c b/test/triggers/usdt-tst-argmap.c
> index 89a0a53fc1d5..9244092514ff 100644
> --- a/test/triggers/usdt-tst-argmap.c
> +++ b/test/triggers/usdt-tst-argmap.c
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -12,6 +12,9 @@ main(int argc, char **argv)
>  {
>  	for (;;) {
>  		DTRACE_PROBE2(test_prov, place, 10, 4);
> +		DTRACE_PROBE(test_prov, place2, 255, "foo");
> +		DTRACE_PROBE(test_prov, place3, 126, "bar");
> +		DTRACE_PROBE(test_prov, place4, 204, "baz");
>  	}
>  
>  	return 0;
> diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
> new file mode 100644
> index 000000000000..8bcfa92ff6b0
> --- /dev/null
> +++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
> @@ -0,0 +1,34 @@
> +   ID   PROVIDER            MODULE                          FUNCTION NAME
> + XX test_provXXXX              test                              main go
> +
> +	Probe Description Attributes
> +		Identifier Names: Private
> +		Data Semantics:   Private
> +		Dependency Class: Unknown
> +
> +	Argument Attributes
> +		Identifier Names: Private
> +		Data Semantics:   Private
> +		Dependency Class: Unknown
> +
> +	Argument Types
> +		args[0]: char *
> +		args[1]: int
> +
> +   ID   PROVIDER            MODULE                          FUNCTION NAME
> + XX test_provXXXX              test                              main go
> +
> +	Probe Description Attributes
> +		Identifier Names: Private
> +		Data Semantics:   Private
> +		Dependency Class: Unknown
> +
> +	Argument Attributes
> +		Identifier Names: Private
> +		Data Semantics:   Private
> +		Dependency Class: Unknown
> +
> +	Argument Types
> +		args[0]: char *
> +		args[1]: int
> +
> diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
> new file mode 100755
> index 000000000000..c575983adf65
> --- /dev/null
> +++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
> @@ -0,0 +1,2 @@
> +#!/bin/sed -rf
> +s,test_prov[0-9]*,test_provXXXX,g; s,^ *[0-9]+, XX,g;
> diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
> new file mode 100755
> index 000000000000..ad8dc2e7c267
> --- /dev/null
> +++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
> @@ -0,0 +1,83 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2013, 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +
> +##
> +#
> +# ASSERTION:
> +# Testing -lvn option with USDT probes with a valid probe name.
> +#
> +# SECTION: dtrace Utility/-ln Option
> +#
> +##
> +
> +if [ $# != 1 ]; then
> +	echo expected one argument: '<'dtrace-path'>'
> +	exit 2
> +fi
> +
> +dtrace=$1
> +CC=/usr/bin/gcc
> +CFLAGS=
> +
> +DIRNAME="$tmpdir/list-probes-args-usdt.$$.$RANDOM"
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +cat > prov.d <<EOF
> +provider test_prov {
> +	probe go(int a, char *b) : (char *b, int a);
> +};
> +EOF
> +
> +$dtrace -h -s prov.d
> +if [ $? -ne 0 ]; then
> +	echo "failed to generate header file" >& 2
> +	exit 1
> +fi
> +
> +cat > test.c <<EOF
> +#include <sys/types.h>
> +#include "prov.h"
> +
> +int
> +main(int argc, char **argv)
> +{
> +	TEST_PROV_GO(666, "foo");
> +	sleep(10);
> +}
> +EOF
> +
> +${CC} ${CFLAGS} -c test.c
> +if [ $? -ne 0 ]; then
> +	echo "failed to compile test.c" >& 2
> +	exit 1
> +fi
> +$dtrace -G -s prov.d test.o
> +if [ $? -ne 0 ]; then
> +	echo "failed to create DOF" >& 2
> +	exit 1
> +fi
> +${CC} ${CFLAGS} -o test test.o prov.o
> +if [ $? -ne 0 ]; then
> +	echo "failed to link final executable" >& 2
> +	exit 1
> +fi
> +
> +script()
> +{
> +	$dtrace -c ./test -lvn 'test_prov$target:::go'
> +	./test &
> +	PID=$!
> +	disown %+
> +	$dtrace -p $PID -lvn 'test_prov$target:::go'
> +	kill -9 $PID
> +}
> +
> +script
> +status=$?
> +
> +exit $status
> diff --git a/test/unittest/usdt/err.argmap-null.d b/test/unittest/usdt/err.argmap-null.d
> new file mode 100644
> index 000000000000..ba765bea7a04
> --- /dev/null
> +++ b/test/unittest/usdt/err.argmap-null.d
> @@ -0,0 +1,41 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/* @@trigger: usdt-tst-argmap */
> +/* @@trigger-timing: before */
> +/* @@runtest-opts: $_pid */
> +
> +/*
> + * ASSERTION: Verify that a probe left with no args at all due to mapping
> + *            has no args.
> + */
> +
> +BEGIN
> +{
> +	/* Timeout after 5 seconds */
> +	timeout = timestamp + 5000000000;
> +}
> +
> +test_prov$1:::place4
> +/args[0] != 204 || args[0] == 204/
> +{
> +	printf("this should never happen");
> +	exit(1);
> +}
> +
> +test_prov$1:::place4
> +{
> +	printf("nor should this");
> +	exit(1);
> +}
> +
> +profile:::tick-1
> +/timestamp > timeout/
> +{
> +	trace("test timed out");
> +	exit(1);
> +}
> diff --git a/test/unittest/usdt/err.argmap-null.r b/test/unittest/usdt/err.argmap-null.r
> new file mode 100644
> index 000000000000..215475e39b48
> --- /dev/null
> +++ b/test/unittest/usdt/err.argmap-null.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/usdt/err.argmap-null.d: line 24: index 0 is out of range for test_provXXXX:::place4 args[ ]
> diff --git a/test/unittest/usdt/err.argmap-null.r.p b/test/unittest/usdt/err.argmap-null.r.p
> new file mode 100755
> index 000000000000..c575983adf65
> --- /dev/null
> +++ b/test/unittest/usdt/err.argmap-null.r.p
> @@ -0,0 +1,2 @@
> +#!/bin/sed -rf
> +s,test_prov[0-9]*,test_provXXXX,g; s,^ *[0-9]+, XX,g;
> diff --git a/test/unittest/usdt/tst.argmap-null.d b/test/unittest/usdt/tst.argmap-null.d
> new file mode 100644
> index 000000000000..dacf4c4f569a
> --- /dev/null
> +++ b/test/unittest/usdt/tst.argmap-null.d
> @@ -0,0 +1,32 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/* @@trigger: usdt-tst-argmap */
> +/* @@trigger-timing: before */
> +/* @@runtest-opts: $_pid */
> +
> +/*
> + * ASSERTION: Verify that you can map to no args at all.
> + */
> +
> +BEGIN
> +{
> +	/* Timeout after 5 seconds */
> +	timeout = timestamp + 5000000000;
> +}
> +
> +test_prov$1:::place4
> +{
> +	exit(0);
> +}
> +
> +profile:::tick-1
> +/timestamp > timeout/
> +{
> +	trace("test timed out");
> +	exit(1);
> +}
> diff --git a/test/unittest/usdt/tst.argmap-typed-partial.d b/test/unittest/usdt/tst.argmap-typed-partial.d
> new file mode 100644
> index 000000000000..8c4d7273c0ab
> --- /dev/null
> +++ b/test/unittest/usdt/tst.argmap-typed-partial.d
> @@ -0,0 +1,49 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/* @@trigger: usdt-tst-argmap */
> +/* @@trigger-timing: before */
> +/* @@runtest-opts: $_pid */
> +
> +/*
> + * ASSERTION: Verify that args[N] variables are properly typed when mapped,
> + *            even if some args are unused.
> + */
> +
> +BEGIN
> +{
> +	/* Timeout after 5 seconds */
> +	timeout = timestamp + 5000000000;
> +}
> +
> +test_prov$1:::place3
> +/stringof(args[0]) != "bar"/
> +{
> +	printf("arg is %s; should be \"bar\"",
> +	    stringof(args[0]));
> +	exit(1);
> +}
> +
> +test_prov$1:::place3
> +/stringof(copyinstr(arg0)) != "bar"/
> +{
> +	printf("arg is %s; should be \"bar\"",
> +	    stringof(copyinstr(arg0)));
> +	exit(1);
> +}
> +
> +test_prov$1:::place3
> +{
> +	exit(0);
> +}
> +
> +profile:::tick-1
> +/timestamp > timeout/
> +{
> +	trace("test timed out");
> +	exit(1);
> +}
> diff --git a/test/unittest/usdt/tst.argmap-typed.d b/test/unittest/usdt/tst.argmap-typed.d
> new file mode 100644
> index 000000000000..1243e059b8ae
> --- /dev/null
> +++ b/test/unittest/usdt/tst.argmap-typed.d
> @@ -0,0 +1,48 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/* @@trigger: usdt-tst-argmap */
> +/* @@trigger-timing: before */
> +/* @@runtest-opts: $_pid */
> +
> +/*
> + * ASSERTION: Verify that args[N] variables are properly typed when mapped.
> + */
> +
> +BEGIN
> +{
> +	/* Timeout after 5 seconds */
> +	timeout = timestamp + 5000000000;
> +}
> +
> +test_prov$1:::place2
> +/stringof(args[0]) != "foo" || args[1] != 255 || args[2] != 255 || stringof(args[3]) != "foo"/
> +{
> +	printf("args are %s, %d, %d, %s; should be \"foo\", 255, 255, \"foo\"",
> +	    stringof(args[0]), args[1], args[2], stringof(args[3]));
> +	exit(1);
> +}
> +
> +test_prov$1:::place2
> +/stringof(copyinstr(arg0)) != "foo" || arg1 != 255 || arg2 != 255 || stringof(copyinstr(arg3)) != "foo"/
> +{
> +	printf("args are %s, %d, %d, %s; should be \"foo\", 255, 255, \"foo\"",
> +	    stringof(copyinstr(arg0)), arg1, arg2, stringof(copyinstr(arg3)));
> +	exit(1);
> +}
> +
> +test_prov$1:::place2
> +{
> +	exit(0);
> +}
> +
> +profile:::tick-1
> +/timestamp > timeout/
> +{
> +	trace("test timed out");
> +	exit(1);
> +}
> diff --git a/test/unittest/usdt/tst.argmap.d b/test/unittest/usdt/tst.argmap.d
> index 7896dc07e0e2..a7d68da3dfbc 100644
> --- a/test/unittest/usdt/tst.argmap.d
> +++ b/test/unittest/usdt/tst.argmap.d
> @@ -1,17 +1,16 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
> -/* @@xfail: dtv2 */
>  /* @@trigger: usdt-tst-argmap */
>  /* @@trigger-timing: before */
>  /* @@runtest-opts: $_pid */
>  
>  /*
> - * ASSERTION: Verify that argN and args[N] variables are properly remapped.
> + * ASSERTION: Verify that argN and args[N] variables are properly mapped.
>   */
>  
>  BEGIN
> -- 
> 2.46.0.278.g36e3a12567
> 
