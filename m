Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A892EAE5
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749825933; cv=fail; b=YJ2uFjbbHmydXp00qKOe8xD1teqExnYaefIKmHD7/RfpblYbS7F0T+svwYpdV/8OM6OnJZUVK56n5oo8RrGNZVOCrnwm0hdaVdA+lBXBLHNcFhTXetb3YSBMxfsaW6r/nhhb4XIzX3K8QgpJQVyXF+jby+FR8ek72MAIy+M3AsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749825933; c=relaxed/simple;
	bh=mpziigvj2e11Cm4oY2dlNF3mo7JmZv4O1xnVECc7tVM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=TTJxLiVE3NGX9nY7BLOmY8Ouq71evS2DsKAAa3o93ERg5sBQ8MZeh55Fx31mJCXW73/4RAsCLSfXR/4nCErYG1XX30v/fP0ibmAAU6FqKbisQ9Zhq9SXvWfyxygkjVwrUZ6c4v1M8sf0B64yP8OAtlw0Kuqozrdwmb/ReGboFjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MjKf8E2J; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UApEotqg; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MjKf8E2J";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UApEotqg"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DCtdMo007824
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:45:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=iyjl5mKls/lTpaqQ1X
	qo40BQl9OH8Ypksn893v3xBy8=; b=MjKf8E2JVyGQIvf+X5dcSAsoCLTNRAqiMQ
	0n2j+ylAGz7UKelszycDUVoEW0qIKeeBk3cur3TjV7jDTHc36JOI5IetMKoStjAn
	KB7Kd6mq2Z787Q61Jmo3dR2mlOgwE/1KdzArQQOi72tHLfXItFfG1BxUtOciZk4S
	f9nphDhWURhHSn0z5UGqOtV2lR1I2KPf5LeJQYu0UNTzxqqgkJqWt+yO9EXHyu0R
	O7mh3GHjh80t3fGz0tVCbM38hLlznFU+Eu+o2eTwBgJ+E3kHTNzb0M0Q3bAYdID0
	O6VRfzFWU3NVTFyQeb5N7Ctf6R1D0aXQ5qc9s1Qk7rhI/1Q8Hpdg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dyx3t7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:45:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55DD1RDv013266
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:45:30 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010068.outbound.protection.outlook.com [52.101.85.68])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bvcrfac-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:45:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fy/Wwy1B/tJRupVi7UMJVVWoWOW3P69KjTkjkkzEziB7ue0Dt9PN9Ej2XGRWkoEyACf4a9h1nNHH9oQ+CPTc3+hfworuMkh5GA6JiAnZeY7z89IRRY4KVB+P3Xmrz62DCdscIeWsE4Hod13oUMkm0oVMMN0H7qXXFNfVI5yPVUA0rol/926g+VtAFlHmqGhyXQ6q4JYZLeYtoOzkw33QYS5rW/kBSuUZd/Lt+Zj3PTPD7vSREUXGkA2MdeRFVeLKvIVbqhfJ8GtvD3hG1gtDqUjzVSKhl8FLhreVD69QPKen9vaP8eIuyqlPKl6KpmMVMtqea3th+pReCYDpa/WAPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iyjl5mKls/lTpaqQ1Xqo40BQl9OH8Ypksn893v3xBy8=;
 b=FHGnAhNaaZ2B+OLiZkcalBz6PMopaevLPwr6SGWAHJkV9+GwN3rBlhxtWy1KJnJdUmATbQ62kfapDIeaMJOmh1rUwEZLuM/NQs0TwHmHH1De9QQw9JB5bLcGlalWTdYJOD6N9rM9Zk7lAvcpr6CzQIvfiaMqyezFeK5UFoTOE47g+0EPeZ5doaULEXpDZ0spQ7f6blT0/yqJnWTeAsWPdsg5NFJQhtx43ZMRXNvGMWiY5UI/rrdEGESM3d9kIfMy08B4zJ8NEi4+Sdql0qKMqpG25s1FgESPS0ldvWzpHFqUezV4x3zrwhmIOxw8KAOlnT+JtcDHJl6vPNEneRQlsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyjl5mKls/lTpaqQ1Xqo40BQl9OH8Ypksn893v3xBy8=;
 b=UApEotqgjgiAGEMcJaQJRHNM2d57bmLhB44C2hdiTgKQrjewukVGaCBr3H4SxHNwmPIOEwcw0/icZuUm2k22FY9aWCt8IAn+KVzR+J0ZgQb6Zbk5YA9B4KC9UGvB4WFBYj/QU4mb8fimruOrIdbviJCxnrNX6FH8hPkyHeihge0=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by DS4PPF8B03CE791.namprd10.prod.outlook.com (2603:10b6:f:fc00::d30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Fri, 13 Jun
 2025 14:45:25 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 14:45:25 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 06/14] Test: caller and stackdepth tests for rawtp provider
References: <20250522180118.27343-1-eugene.loh@oracle.com>
	<20250522180118.27343-6-eugene.loh@oracle.com>
Emacs: well, why *shouldn't* you pay property taxes on your editor?
Date: Fri, 13 Jun 2025 15:45:23 +0100
In-Reply-To: <20250522180118.27343-6-eugene.loh@oracle.com> (eugene loh's
	message of "Thu, 22 May 2025 14:01:10 -0400")
Message-ID: <874iwjd7jw.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0072.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::21) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|DS4PPF8B03CE791:EE_
X-MS-Office365-Filtering-Correlation-Id: 986eb8ad-1dea-415a-df53-08ddaa88eea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?i/gMIn3oh4z+ictO9f77o2gmdBRpLE2yS+4fUKuvik7jD8UzSFAssS3AX+GM?=
 =?us-ascii?Q?PoYBmhLeGDtvUT0o9sCI15J8SjTzc2+fAwhJyGC+nYDOsrYEGouIfX+nr8Ns?=
 =?us-ascii?Q?BiATt5hcloWWL04c95n2oB0xN0L34mrz3EAcvSBtulGQiH+TUTmzQs5c5ycj?=
 =?us-ascii?Q?+PSoW9tEMGKgAXiFHVEVs/73hXcfGakuind3PzgPM4tJFD1/x0gpcn3O+MSy?=
 =?us-ascii?Q?yBBNh1vFkTlQf1lldASnw1KLjypHsArz92wjC46PnZDofwO46IDmKHalwA2X?=
 =?us-ascii?Q?Hv4U7BU2Ypdqy/2zSKauYkzayC/P1vAkU5Ad38Q8ZXwAa35/3Q6QL+dk6+yu?=
 =?us-ascii?Q?v7TpZF4a+jkzE2GAXeh20ASuwdakId5J86h3OnUEibyUha1vcqwaHSv/w4Tk?=
 =?us-ascii?Q?EfwSNJXygsFg1cmfojs5A1IFHdEvPIOeETDFWfITQ35wI7bcyrlN+0Lr1rBc?=
 =?us-ascii?Q?kipdCZGx899B5dlCK97WIqywrZ9X+tqDk/L+7kdCKgxjgi9N1lK2i9c4lYPe?=
 =?us-ascii?Q?ZXeTKIK/DLbUn3rytDhBuM2C6Ny9vPngM53H3dIvpyGq/KGuZ859huO6c/Zd?=
 =?us-ascii?Q?/v2aWJRyisaUMHqyBCL5Qg14iZ1eHdfGt3gS3gqABSM+IbNhOv2vUje+eSku?=
 =?us-ascii?Q?EZofxrlZQgg9kzAtYHqBVt/YEOajwOI51RCFVbBwvPCea0HZKuwo4DlLIQzQ?=
 =?us-ascii?Q?Q5Nz583feQG8NZEMd+Yv5gBtLZ3sym1LiMenqir+CmbTGRAhqaoMrSSsmRpR?=
 =?us-ascii?Q?sbmrK5LBtLUr5c3eW076q+8L8tcU2Zbr3Hf5wSpQiS6uZvOeZEJ7FY/HUEL4?=
 =?us-ascii?Q?8GmbemtwU+sOE+VEUoUHFxDYyVURfd44ejTiq04+BTsTNBOrQtq0M6jawniN?=
 =?us-ascii?Q?PN1ETJzKt8rC/nCahnEoL2eDpjdVI+I0X5GyzXBO+62OkyllWJAvuWQ2nu5e?=
 =?us-ascii?Q?/sStrZh0DRY0eVXkaNOgJXcMQgdri+ABDBESi1lRZd9VJNm80y+moUKFvNWn?=
 =?us-ascii?Q?hmX1Q69QXI4E7zCRVXBMjpFLw8AAH6HrBBRo9Z4ohlTdZxxRPNBYKMCb1L9F?=
 =?us-ascii?Q?3IdfvOTr4F8RAh0ParDcm1pdpauimZGcGU9W6BTXcol4iSEo3GZSNBQr9Gwt?=
 =?us-ascii?Q?DLbikD6ajLHxqsKSoiAdw94EMYRIHh9BYMqegA3hUGbJhJZg+8l1SX/zCofW?=
 =?us-ascii?Q?7cHlFo0gqnhQeu0BYP8jluSa30XB8KzQQvT1SfKtJ0iF0eJ6iknoWRdYlpg8?=
 =?us-ascii?Q?Tr3UYTAUMYk0ljS1LElKqnmn9HXjqO3MhwY2qsMyIeWD+nWNbco8iVnLKxjD?=
 =?us-ascii?Q?UhzCfouFGo7BNvURCwYwKIk/Li8Mh8L+7+yC9LE7+RRojgPnzcV4VFnekbAN?=
 =?us-ascii?Q?Cm6uf+TBA9niyM6bUJvF44iIDVPBB1Fh6/gQiA5TaP8svu/Y3zuqO9n0gyZz?=
 =?us-ascii?Q?8kBGfHGlaDU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AU3I2jYj0Hb1QOr4CrIO1lzc/4Z6KhEBbZJg7Brk/QoR5cGALePa7Q+PpjAM?=
 =?us-ascii?Q?F6ygcQZLm5hhDFwT4AiYCoR4j2CBb6CuHhkYT54dI8dVdUw43tkszs8IDajx?=
 =?us-ascii?Q?I2H4DS6sDcMXkLxtnmtNmTXSJM8QKBb1QnbJ5iTMkroh+VKb8reDlojsIM19?=
 =?us-ascii?Q?aXmf0ALvu1QCpN3FaFy4IY53BCDSXbapniPTAX2u6B6JcfMn78PnF/CXavJK?=
 =?us-ascii?Q?j8WDZhTVy00Ip+WqVvMb8JXJ54JnMwl1/HETLwi2VmBMnbJSJL+zyzWDz/Dd?=
 =?us-ascii?Q?UMSvwcgeMw6eGgbZHDfbYKWF4vl+Hnl2Iniqd6SZwZ3Q6oj/JPlrMssU1Jpc?=
 =?us-ascii?Q?KTbuKXUJ424x9oz0qBzDgY7tZRdIdIGAduQtqleL8wxBsOZ81Du9jyAka91v?=
 =?us-ascii?Q?yM+ZmiDcJztMg94BOCKATnRVnOM2p43qd2lBbUhREGeF2XtTPYQUIw1WYTDV?=
 =?us-ascii?Q?uzKYt59x5RPS2h3LGYJwe8ryucyEVyX8mmC8k19rhhkyyxs7snaoaOfPj8Nm?=
 =?us-ascii?Q?ttnv1NB0dRcQ+KrYcI/BikBZKWcc2ZR3yj/QOBKe8o7p0OzYgmN9oWeHapts?=
 =?us-ascii?Q?Njc83ghSVl2Uin/0Twv6HBjAt9zcdgIiDV02FxfBBk6/F/cmN8HcRIOtIa/x?=
 =?us-ascii?Q?Dv3VCbsaO9bD6eSQs9luvNlMzSkmg7JAUnN5z/5MxeyTC7eBQTMpV6gcCtXl?=
 =?us-ascii?Q?1pAXRO9/21NCQsqvHwXAVxg+4ILfxRFmjC7HL5wJGM2P0gcoqmhTwmpu5k5C?=
 =?us-ascii?Q?9FhlcWbfMXgbL1IPnKjfsQh+zQbzhrzLsp9JWsBU41gFqFH1vseoGya7MvmU?=
 =?us-ascii?Q?T7uo2CXTZ6DjwYZs/HHUfz6XmbR8pAWV/GUne2tXKT6nG036QtKMWFObUAkL?=
 =?us-ascii?Q?bc6rGKx0gPi7hb4anj2BvVHQzy2gxkZNUvzCHN6NOoDRleitwc/xZdCuVT2x?=
 =?us-ascii?Q?osQtxrxJn1AtgDUIcThonQTt6FH9BfIiVJTvhiz4EZdqP1wrNYmR452HPCQ6?=
 =?us-ascii?Q?PyZmBbaTV3pAqeFrMM9UUT3zQOPYV+6MlxcXcqigy6EEqmZHy8kYoNRUdjeR?=
 =?us-ascii?Q?iD1zIIsui/9/sr5ovppVfggECWj2B2qy/BEJN4+pNSA51vRNIUSz1OL4tw4H?=
 =?us-ascii?Q?j+tooxpvomx4yoYfJj16BFlSNdYqHHauYVoVupTyvvafFWjWQx/mEklO12Jn?=
 =?us-ascii?Q?oHGT/r3AEiz3EaGuSEj3qjnuFanJ41OGVgDJZWzawKrSrr96sjSF0l4vrffL?=
 =?us-ascii?Q?t24zseUVTkP+wiPNcWhWp8vH7eTgfQ+5HTamRr8iun5XFPxv+GNNkY5Ehiwx?=
 =?us-ascii?Q?+f3DLwj4DuutsNoUjaFWm8R3gjTlb4P48OrfpjXgcnc1+rd7DHYC/wq4vNfL?=
 =?us-ascii?Q?n94RAu1M6pC9hbkOlPhZ6Qt7g0ZNE6Pu5g822kgw33W5MeXd4EKUFmZyFX1k?=
 =?us-ascii?Q?MBfg2FZI90iVGlNopmcZe0RZWCLf8uGZMyltHyFz4us6Uf5GKDV4NYgUlQsr?=
 =?us-ascii?Q?mrCqq+ncArYKbu4QqdQI3Nja8qfjsIfyato3Nps3YHZITbvPsLtWWUlGrarg?=
 =?us-ascii?Q?qKDuTnn6oL24qjO2Tww0fyLYa/r3mjVBuXTDcOg5aq7+FSeA1Fe+dCRyEB4/?=
 =?us-ascii?Q?LA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7yLHBLfTPUoF1zq2Z5ONUYamaSu2i7mEnxyWDD6PVc4OxYKJ46hpwnpRvUKsV4QXRkMkmuVO/NVBX/T8gxHLWoDZDmKjjbSqbEnUUvQ4cQIyHUiGBQpYpRKLEwMWdBzSWMNN3uF1oYCN+D8HbpKgFwE7aMF6YMI9O46U95sBZwzsfnDlN9Ow4m8Aw9eAVuGwPgQ0FxEC098iJOzDOBuV/r+eGW/fvPwq16nr1pm+XSOu1RQYihZ4L5LR0VHhuwQCvD64P0HTJAW9O+uEY+XI1+dUfMTUjpQhLD5Dd0ENk+JiYwjnxHTYBebRDcd8HXNRj9d79NkZDYb9D4EPAfeWozXdb/z/QQuljUaul8WngUbiTmNl0oDGOeHfOp6fYkNyUgKf89A+bpzmBtf3YLiOOZYWuawKJujX2svCBTbF+jEKaIwtSeZO3pTcX2abf4fwJnu9xhzYbicPX/IcTYgBEjBO51lEtQXQZsKW4yUQSz9KyhaKs801yW1J4Jblea/2hTlKayEL31JcklIK2nvFAcp5wBnGEIXknVkaXFDNSeeShZ90UErL8p4YXEKNeXnm1wkmjEbhi0KYGJawmv7EGkv2knaG2hYBPBwtkrGVziw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 986eb8ad-1dea-415a-df53-08ddaa88eea8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:45:25.5511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g2F4Rjm/0WH2j5ptTMT0LzcLHAvXpp07v3VAxUazAQjiJoNX4GScNTM9VLaXfeBL5JusgM0v/pzhQgTv87H0CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF8B03CE791
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506130106
X-Authority-Analysis: v=2.4 cv=fdaty1QF c=1 sm=1 tr=0 ts=684c398a cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=0MlRVMDnd599UZ-Dy34A:9
X-Proofpoint-ORIG-GUID: oC6kLC4XBJPYW0npUNUmf0fQ3VSlkZEK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwNiBTYWx0ZWRfXxo6e6fRbemU9 dH5iL6cl0IOmsCM1sUGGAJ5pmGG6HLILOdhFExyFa4/TfTYp5Zj142pZtqdvVlLMQFm505cJlYY iXwRqthCGeM4ICybAZoSq5RvtU+Cu2KxES+hNKqi9ZW2ndRa0i9+DUWCKw2uhuIfFdKVy2luQE6
 H0B7pIGAZ3w6jODKD9pP4Hd4Xv4aYTyPz8WxXLw+ouK7eCXoRt3VBIZtGAsiytVgmW+85QBXbMZ 1NG4zST7F+AyGsGi6L96quC65bas+Wf77DjC0X8tKaRqXMByhC3F55OoO+ofSGWIXgptp+YmbzZ JsYkhYwOhAiJg02Yw7E0rjogggcVB58TjB2fzYTdFuGeq4VNsmE55fHyAZ85D9iNW2xm0CXeQHz
 U+mmyQPHuXaS1hXfICdmha4bXLLpzEv2cnaKLEaQlQ20mUU35nxY24ZNddOdc3V+lXKcq9Ac
X-Proofpoint-GUID: oC6kLC4XBJPYW0npUNUmf0fQ3VSlkZEK

On 22 May 2025, eugene loh uttered the following:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> Also, add skip_rawtp_old.x, to skip rawtp testing on older kernels
> for the reasons described in the file.

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

-- 
NULL && (void)
