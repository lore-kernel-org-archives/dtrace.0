Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF5C211C
	for <dtrace@lists.linux.dev>; Fri,  2 Aug 2024 05:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722576650; cv=fail; b=UPIqCLMRdMS07DLG12ESjPI6q80bbT99VKvTVuzA1pMk3nhDVe63CykpQtCcJdZ94E7HfZKZ4DgOVhOemxk96+bNeNnED5UwD6guFsUikVVUe2vZcTnE502L9UucTMbiQPuUolbYAK++OJ6lmqabMbj4pxtpHYjooXXeFMD9+tc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722576650; c=relaxed/simple;
	bh=R3HVum+eRrhlOEo4mTpJN3oPlwNdoQUqvSg7T+vJIW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PHPFhXekYXS04jMek//2akFX7RJp7ZdvuDFajDPEdRDQwybTyNrsM/Tm7uNSBM33MMdIvpHJ88NzSbw6jSUOnX+psi6k6hwF0VitdzaIxqCJLH66HpyfcIIxChzeLOU+NNUMSls31I+McNVbpvGCNzxCuYOPUUTtAMXqthVrLZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=audg+zWP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lVkSOI6O; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="audg+zWP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lVkSOI6O"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4723gWIH003679
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 05:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=aL0ImQORSBehKJj
	Kk96hjOhd7n7UrY6SCulCh/qD8SI=; b=audg+zWPDDbcouS2m+eTSIEdwmHSzSN
	OVfc4F8khKDs4KqqbihBEG1Q1CqLXMCiJffNj25YSQJw11uDLtsqOyx8untb1zFG
	wBRusvJHArFfQq1dSl2gEbJuuwhYswN1IT+YtLshv9quCQykGQ9rJVoDkAb9Y/6y
	83T0UUVe7UozLBeAJsHn7AIgB5ZOSTlP98cbXNvejgmhGeuOgCDblBnZPR6Ng2v0
	94yaMBb6Zshm6kU5FA8PsynWGx0HipYY6U3UeGszwvL/tWWA+2JiEex9S7UQZObH
	IjFblxTJd7p/b7XdvgLhMCqwes7KbpOMtMU8yjUFJ2xxVHhO4F2ekMg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40rjdwgds2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 05:30:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 472317N5028932
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 05:30:46 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40qmptx917-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 05:30:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FYFbBjzUr6CAjnCoZB84woLceoRFeXQ7KS17KhY4sTf0Mcgm5xtlWkgd6jRqIsZLQtrDbxzPAmksDBnnxIOP+w4XTW5RGYEUcGOTiNmyOmI6ngxxw9aIe8rb/Iy+7uB7xz6oN+NKjTbCuPISObpya0iKaiW0nQth0KQd/yj4Zkt8GxXF+fH3oGEQWaETDTpGVRj+xqVrKJZq7FAYNxUUHEicpht2t3Bl6+zYedH220n76cO73bBmq9L74jdeUaaiLTFD1TdI7huyz7Abka0I2T7nqC17ECFSWRQnvLR7R7o+W4ECPVqdkgqdqqjZb1qN9Qnsz7E46rxeJU1C+Fcl1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aL0ImQORSBehKJjKk96hjOhd7n7UrY6SCulCh/qD8SI=;
 b=byJeWjnmy8vFUzxDLqefN2s5Vc75WKIh6KCLpE4jeAOGEH6Sx/a1+w4XF7J3tVRr2mjJcUAqVFr9xJ+L8dV+/qeza1ETE1sraoFRCcsbwoZRQf1IBogfruuasDogE8oM5cZac1dxYpEk+AwObdSQnbrTmmyAEKnUxYccDDTL9fT7K8dmtNcyGQDKV7vMsj5oSLKc9Qvup6x6auAgt0dxUqxZBcO5L6PXTCw7wWERmBq63nE7Isy/QnRIC6crmzjTMlNncsP0h7CXMFnohyx3k3GYi/hVgLw6B2ETzdfZhDA98XEYmN8St4bJ+HLhRQ8DqG3CbE2mUUFJ9laH+rbJsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aL0ImQORSBehKJjKk96hjOhd7n7UrY6SCulCh/qD8SI=;
 b=lVkSOI6OxiySDOg69ylj9+LvbmKWYBnDsORNIXVhl7Zyr8TlQs6ymtCHxM8bEwMeToNddq2kJZb64jiROjmNTtJjsOwLhlzXfXXyotXnNJM8Ca+g/8VajnMin1qM18XCRvYbBGeLbPUrteT5nAJzQ/Le8hCGskb/iw1E8bcmxdo=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SA1PR10MB7856.namprd10.prod.outlook.com (2603:10b6:806:3a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Fri, 2 Aug
 2024 05:30:43 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7828.016; Fri, 2 Aug 2024
 05:30:43 +0000
Date: Fri, 2 Aug 2024 01:30:41 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com,
        kris.van.hees@oracle.com
Subject: Re: [PATCH v2 6/9] build: add a pkg-config file for dtrace
 consumers: use it
Message-ID: <ZqxvAf4/9vBb+Nnv@oracle.com>
References: <20240801132156.286780-1-nick.alcock@oracle.com>
 <20240801132156.286780-7-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801132156.286780-7-nick.alcock@oracle.com>
X-ClientProxiedBy: BLAPR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:208:335::12) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SA1PR10MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e05d272-c223-48fc-2ec5-08dcb2b44113
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vr1xZCaZmj32AeYLZVd5amXmwG2FNGu4LnJDM8ci5rXPH2LygYmMf7ua4snN?=
 =?us-ascii?Q?EiyBNh2EtHpfqGummi9wk4uJil1bZcNfarPSUFkXx5k5Xyh7g4KfYQorxId4?=
 =?us-ascii?Q?TyfdArwZvIfL+OVw+M8atzlH+N47kFYgNw2dX2sygQl0QAobpWud3/5oW8H+?=
 =?us-ascii?Q?bSeshzigVoezEdPKI51qMsT5jundwcioVV5pqmcHt+B2+WYznB5gt9MZ7b45?=
 =?us-ascii?Q?3LpimV2T8dzA0WKrnTBHAhUu7K4uBgd42P882DUOAs92S4n3cisop4jUJpky?=
 =?us-ascii?Q?FMJg/AOnDTT+Rl+k1ph+CuLfrYDfqt2t2opX3lfUb/DfFjZ2GfoYkXyUcIQ7?=
 =?us-ascii?Q?l9hgC5IWDxnmnTp8vosF6zkdEtxXonhJP1VZd2hLK069zYPogvOFfWPWQURA?=
 =?us-ascii?Q?FFk0nFXhIZjMz+rMSrbvxzmzAdnKcA2kGq4VyJmNIeWvocu1BFiNR5nNaTJt?=
 =?us-ascii?Q?W7nLuj6RuFnnqM/hF1Z/O1lBTHhdajqhcRDtFnrGpuzvBoMNWPwUwSO0nsHq?=
 =?us-ascii?Q?t6RXjnFTFqM8OGNi3tyuz36SdnxFwoMfo/hrOB8TpfR6mt/eZNaaWRidY7TK?=
 =?us-ascii?Q?nh+2CvhDGdaXYk8zu6TCKDXbwjplFZL+ytzg77DlRopbkSYU5vWw50X5YO5H?=
 =?us-ascii?Q?voac0IChq5AijjIZV12d+FGNM0hUIy4kvlYXT1G+t+BvXLk/tzWXRobOG2MX?=
 =?us-ascii?Q?F3kE5OJxF3yQLU6g8rhfLsD++v7Df6IZfEe+tCsa+mVqjuNaX8qaLu9lJWn5?=
 =?us-ascii?Q?q65u+NBIKSXx2j0+HSrABeXnTtOF+g41EtECw/OhxNHM4lB3Ki8/hujUXMvr?=
 =?us-ascii?Q?mh2rFVSNJKrCIaT45+3DRnYQ/mlwPGcHyChsiSeLyPtf/MbYhWkkvG+hIGnH?=
 =?us-ascii?Q?lcs/K/wKBL1mof9s3ZMQKKZE/KZQZfmZxVWHxvEZxK2EcYzBpbeYMEcpcD9U?=
 =?us-ascii?Q?uNqgaoc+ljCdgMiqA5E64N6WyNakxRYEmkgFIvfHMbRbHPj9uyzuOL2Xe8fH?=
 =?us-ascii?Q?f4TIpNpvV9CW9LFwFIQJihNj0icmHudQ0H9f4UM2+mp4lSAK/ei3cRmavnkn?=
 =?us-ascii?Q?AsskZiJSiQo4o+tf7tLtWET6hij8LNxroe2XHDmZyfn+kvdJQOG7R76GSC9O?=
 =?us-ascii?Q?s5Wxw2iaOSMXdaxCJ1FEzAfLq3mj3kOt8xeOSW2kFMqyXzugHJ/EMxP7QINw?=
 =?us-ascii?Q?Nn6D5OoR6ViTC1gkKUUAp/StSQVe0JNAQDMySZofC0QMMTqTmbHUarri6DGK?=
 =?us-ascii?Q?Zha8DLnDV4JNpnam1jb2OcA6BNhP4w+CFv3PLzBJnYuiF4ezARwW5qDRDOmQ?=
 =?us-ascii?Q?teMlBbrH8f85Ue//sWuBrHhdSLgEuhB7SsUQJXofTc2jqQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xe+tbFNx5qHjndFMG1Et5j0lfyV7005WQzNyRHZsJ8egBGvd/s5wE3J9nlLf?=
 =?us-ascii?Q?gUqWP6iigPrMzD//PB3MgpoSYu3UEXlByk8G7olQFxCyosfw0HKAWYkbHdjg?=
 =?us-ascii?Q?Q8hGGMEA3QeMClKYt9mwr2PclDERhRV0+9JHahTP/F4iStpfkLZSqbi4oMJZ?=
 =?us-ascii?Q?1QZuvTIGqdtum080WHUXbATTesk+Lho6gM2ov8dPqIXWDa/qb2QY7T3b2UOl?=
 =?us-ascii?Q?9R+kdmqu24grnumWLGNiXkyvTI9LhTmqMpchRWCdiTTya0bsFP9cr33EQl3c?=
 =?us-ascii?Q?PHKZwUndjctIIl8tdHBXCSQ+rmurDeW8EMBcJgzJTxXWyIcVxsBxLz/NhjIz?=
 =?us-ascii?Q?DkfYcDt/D8KBLfUaDZ+S17MXRh2ov4Q4142a2PrdDY+mpNPqeljkQdhblB+K?=
 =?us-ascii?Q?8Q2GfUSWa8Z7B3HNEDK6+ifBYf667Cgab1KMtuynLpRNrSKIjNqlHCD53BNM?=
 =?us-ascii?Q?tQfIkl8XEzoq834LxGzQxQa5C7bdW9ZtOjZllVvT6zCS7JGeujs0+E7ehAuj?=
 =?us-ascii?Q?qVqLEry7VXR+DThA4jq//pHG8yi2fptSqSrzw93OUvCjLb11eEmD1zkXojNF?=
 =?us-ascii?Q?VaBhI7fhHyg1a+vwhqOMSrUipJSTAmgdnIk+UoWvNlCLUSStUXnYenaMfabk?=
 =?us-ascii?Q?2PksorZBMCuQ0H6OY13NYaMDE5GSchfFP8Ijy6lg5Yicv5dn3uCZ75MlyDBB?=
 =?us-ascii?Q?RMh9yBz7ZQ3T6Xp7C0OCel8xM8Vz7lQgGj3JRDGoX8LrXzqqaMIvD6C8W9ru?=
 =?us-ascii?Q?zBXA2abZzXk5bEn7BRDC3ULqG+od6uNWoS7bsHZeEqteSPB5Zw715UDJpCa9?=
 =?us-ascii?Q?Nwz7SGg/PMQ6GZtf0jSvPv+z+SY0wx+IcZsW1FHsuV03EYOAyT6v9CYSS/GL?=
 =?us-ascii?Q?lN7b1i+BQtnnBx8pSDI7tY83SA0Kp+5zKHWM1ArP744MHPEva5zDwnUyeb6X?=
 =?us-ascii?Q?YWvC26Ze/T8CC+A4zUp6/OoE9ouH+78J5drRvdp047+eiRvhZ9G3I1fOU/2V?=
 =?us-ascii?Q?hk+rihA4yQEPbiPr2JDaV40Vbk5X/8ncnyz4urtIf2rY/QrWE8YRQUTv4HGt?=
 =?us-ascii?Q?dS6G/kWZXJIhVVD3A/FJnGD5/hkaM79NIH3cdMW8EiLtBvdqKkbPbfu9KB2s?=
 =?us-ascii?Q?BJq2+tf9wKqAhEWVV+xInqMBPMrxCfLmj3+2r9KNnmLPAjiHwu2E/lIEHYhy?=
 =?us-ascii?Q?br0IwBArznipXzPTC2iCY1BTTNMCGBBwpEkX/UTuWnJqK3PWXwCZ+fciMJtD?=
 =?us-ascii?Q?RswTKXXk2PJrhmDvyOep1L2/fJPitYpYHdU8V804Z6tnhrhi+NRWSIANUQg+?=
 =?us-ascii?Q?3BmmDRcKbitnPddnoHQ5P9u70SKQX6tFb8fNq8ftdtKIBSohhbsSP49BMoUq?=
 =?us-ascii?Q?cTbzc4+k1z9ClbZdZuBmzLzWCi/uErbq9NBh1enp2ReW/ZImGYI7ktoc1/Fx?=
 =?us-ascii?Q?J0GtnEs+V1zBxh64NaSEM3iZSES8CuBuJWpQLRDgh7gSu2CBao48rLpNwdr/?=
 =?us-ascii?Q?cLJm0LBSPiVW6atqxYZzetS1MtqP5rMjxXmDvSJYBncFnLHoxWa1PD9vfCG+?=
 =?us-ascii?Q?oQjYY5CQWSsy7e9SGtzpQNcXEbu7LvOfjfdNUi4e40OtDTE1W1kFhm4E0J7/?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tV388uMZaiog6mcyPNUbh4JXuHo8ogWHlMSMa1jCK7ci2Z5jRqNWM6ZnWZH+kIAXvJpap742aWdVP0BPTuvYQHeMGT9uVp98ezrsmz8F8SQea2fQgEX6ChrCl2FW+l6Csmm4RJGus7niCWRhndcTNgfc6G7hdDiH0WXbdS//WmpDwTI6CLuCYUOEu8HNlhnw1X3ozSr4GWS4XEomAB8oO2bPNwaAato3evm4rt6Wtjey3cv6ujVrtR9O9Rlxhoha836PC93lKyXvm5dBnckWi2G4RfhtKFTjdfCGIo9JT+OBdMEcKx9PnyXKJQ7fCYnbw7gYv8fOyBgZHNDaaRzcxBZshsP5rvr4wgS1Mu3MQIOU5FNqiNpNGvKUSGWz9IvP7BXkYuAzQRK4sTdnFpGqOWBN0cguu3pJhLwDoUFydNIEqgpOw6j7KN69DRj3F80IoSNkX3L3/ttQ+wwfBEAJR5N7cdNBOFu9EGCy+7NKrU3Z+3glC2nzZgMcNUvGcg1ixoicqw0xX63Gdanhdwd86GqY37jRK08M86qY4ktkYhE/vqMq2U+Alk6xx/Qwb/YQGZWIItxOb7kCfezVXgtTkBuhJ+Bj5V0wHmORRdJXN0M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e05d272-c223-48fc-2ec5-08dcb2b44113
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 05:30:43.6116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V1nOWB9zSqAdunlYsjxdcaLDft3uax8GbuwYExFUSNZwi9hmDfZ5FDuevIJEQAE4JmnXs/x+FOsw/ZgLkNXTH1Ikc4x0Bs1FUZfyow31r/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7856
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_02,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408020036
X-Proofpoint-ORIG-GUID: dubPzpTbH_3xOxuAzx-rArOPN_AXvv6B
X-Proofpoint-GUID: dubPzpTbH_3xOxuAzx-rArOPN_AXvv6B

On Thu, Aug 01, 2024 at 02:21:53PM +0100, Nick Alcock wrote:
> This lets you relocate the include path anywhere you like: users of
> <dtrace.h> et al should invoke $(pkg-config --cflags dtrace) and
> $(pkg-config --libs dtrace) to get the dtrace consumer header directory and
> -ldtrace invocation for linking.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  runtest.sh       |  2 +-
>  uts/Build        | 10 ++++++----
>  uts/dtrace.pc.in |  8 ++++++++
>  3 files changed, 15 insertions(+), 5 deletions(-)
>  create mode 100644 uts/dtrace.pc.in
> 
> diff --git a/runtest.sh b/runtest.sh
> index cc9703e12c16..817f4a90487d 100755
> --- a/runtest.sh
> +++ b/runtest.sh
> @@ -579,7 +579,7 @@ else
>      dtrace="/usr/sbin/dtrace"
>      test_libdir="installed"
>      test_ldflags=""
> -    test_cppflags="-DARCH_$arch $(pkg-config --cflags dtrace_sdt)"
> +    test_cppflags="-DARCH_$arch $(pkg-config --cflags dtrace_sdt) $(pkg-config --cflags dtrace)"
>  
>      if [[ ! -x $dtrace ]]; then
>          echo "$dtrace not available." >&2
> diff --git a/uts/Build b/uts/Build
> index feafa21369f2..7948e9f2d084 100644
> --- a/uts/Build
> +++ b/uts/Build
> @@ -22,7 +22,7 @@ PROBE_HEADERS_INSTALL := common/sys/sdt.h \
>  
>  # The pkg-config files undergo a few translations with sed before installation.
>  
> -SHARE_PKG_CONFIG_INSTALL := dtrace_sdt.pc
> +SHARE_PKG_CONFIG_INSTALL := dtrace.pc dtrace_sdt.pc
>  
>  install::
>  	mkdir -p $(INSTINCLUDEDIR)/sys
> @@ -34,7 +34,9 @@ install::
>  	mkdir -p $(INSTPKGCONFIGDIR)
>  	$(call describe-install-target,$(INSTPKGCONFIGDIR),$(SHARE_PKG_CONFIG_INSTALL))
>  	for name in $(SHARE_PKG_CONFIG_INSTALL); do \
> -		cd $(uts_DIR) && \
> -		    sed 's,@SDTINCLUDEDIR@,$(SDTINCLUDEDIR),g; s,@VERSION@,$(VERSION),g' < \
> -			$${name}.in > $(INSTPKGCONFIGDIR)/$$name; \
> +		(cd $(uts_DIR) && \
> +		    sed -e 's,@SDTINCLUDEDIR@,$(SDTINCLUDEDIR),g;' \
> +			-e 's,@INCLUDEDIR@,$(INCLUDEDIR),g;' \
> +			-e 's,@VERSION@,$(VERSION),g' < \
> +			$${name}.in > $(INSTPKGCONFIGDIR)/$$name;) \
>  	done
> diff --git a/uts/dtrace.pc.in b/uts/dtrace.pc.in
> new file mode 100644
> index 000000000000..58aa46fc75c9
> --- /dev/null
> +++ b/uts/dtrace.pc.in
> @@ -0,0 +1,8 @@
> +includedir = @INCLUDEDIR@
> +libdir = @LIBDIR@
> +
> +Name: DTrace
> +Description: DTrace consumer headers
> +Version: @VERSION@
> +Cflags: -I${includedir}
> +Libs: -L${libdir} -ldtrace
> -- 
> 2.46.0.277.ge12b8151ed
