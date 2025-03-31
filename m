Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B252921B9FC
	for <dtrace@lists.linux.dev>; Mon, 31 Mar 2025 21:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743457510; cv=fail; b=Mx4nrFIxYXSZ+HT7f+k3H45wyyNEgrZQiNjxeKFnMmflmBxdpj6Do6zqY68CizmS0vO3I0ugO6SALIBLXwQ2rn+zQhczBnf3PflzQyfg5c2byZEvGz2E3xfff4Lv5okSpb66llW15jncXx+BQk+78ZVD8jbxee7Ofd8RBepO+RY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743457510; c=relaxed/simple;
	bh=6yfyGSqAYCC11LuGp64mK1jE7BchF6C938BerRpfbI8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gDB4ee39IwtQWvSIcTBO9TfeMsivHVPZWKglQbazQdmEf/q4WZ8e4zhgmJcs+sot3KUdzzi2t7Yife9Vgi+pRyfuebLhZVonBjgP5JjTRiXSeO0S/7OynH/Va26cntU4xILE7YR1t2o5dSnPI8/jfedj5DahzdGeJ48ZsZFpJvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iqlyLxOp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zOoWPBv0; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iqlyLxOp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zOoWPBv0"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VLBtJc005591
	for <dtrace@lists.linux.dev>; Mon, 31 Mar 2025 21:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=Hl2PiwBADvjOt729Wf
	+Er8vIM+ib/XzgbgBIXn0rM/I=; b=iqlyLxOpZ/hcW5pHnajPJfPc4rqztHCVpf
	zDulDe+7zGBpwJSzE1wpsFuPPcYz4g7vkD29RYBfwjsThI+RKDgDg8rL0yZ1O69R
	XGz7lsoEfHu0IWb5M/X3Li2TAzcQOcID1yul4ozcx8P2O14slFxsvnLlv6oiHeL8
	Z2mw+GmK8q2neAk7b6nvfs85Ja7/W7UyysQS+SX0oXOkpB0aGSAEFf8HiWCSN7EH
	rBC8IJ/Ilh/ZHVhLH7e+FEgia0K/M0ulthOyAq8E5GsLx2eIJ8z6NvI1Ijqh3oQ1
	IY2HPSVnjDUUkBR9Suj47mVwWXFVBSICRHYLrdH6xPWV97pN3A9Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p7n247xe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 31 Mar 2025 21:45:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52VKARcY003379
	for <dtrace@lists.linux.dev>; Mon, 31 Mar 2025 21:45:06 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45p7a86r65-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 31 Mar 2025 21:45:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rwo3hCI+2blr35i5xZeIwdLY8tJK6j22pNKnbDjXvRRP32d0PQIOrwOpnOVkh4Z3VXA/kYglajhZDezB6E/uVF7A/X4TTbTmpvIzomyxeoFxB/eMzcGgHstGQLjRQlMO3dAq8/cc/gTneipB+CitiIPC+LtLrn7onDuGlxO6XnAfSte7mQdQBIgo+gnovvASTfBH2waFiNAZyDmh8aE4pXJ8BMu/UqPTlji9kR8ffQe9mwH6r8FTh1cad5chlhDstIy1LpDJaAK+71qJ7WIaiCwt41cT5gE1uFNVLT/6G4Yzdw5yZowQO+J4YjL4ABwCW8hrizGX4h3cNXzMs1odRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hl2PiwBADvjOt729Wf+Er8vIM+ib/XzgbgBIXn0rM/I=;
 b=qKOD75KwlVAo25RjaKon6r0CDUMgsJJ70VM4zw+ELg/wfhSYBCv91gZ4llp1dFU/8MF0hY4vBauZUknRg4QQKyOY9wxMgrMDz5GFH5QGWzd4v/Am99fRhSnyNpWEshAw2qZ7MhVO1wdlKyRwLuanapX6SkNuy79Y70mlVLDctyN2zun7oXVNqepzV53m89aS6X+mtH+SDklpA5viBHRWQ7Uhfblqssqk6gX3pD5g5B2faMQd1KH95Z6sf85HPOdSWD7RVkUSQZMy8PffSwLX79ph93Fx90cCD4CTMuBboIYFCPBd03ATm0/BDasNJZrF1OXxvVhghUMqACPee8i17Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hl2PiwBADvjOt729Wf+Er8vIM+ib/XzgbgBIXn0rM/I=;
 b=zOoWPBv0nV2M/5bUZCQBAwJ5g5ZBJGMr62AGl18QqgJTtrvHEPM+6/RHcZ5u/1hL+mZb0gpmcuT+uZ31i2EJF1v76GdHsmsJlOJ17vgy89jTrNYTCTvXBWqcmNIrfxzbEZTmZeR6wN84u058zMEkI1hj7Nv4I6LKMFxihAiIj88=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CY8PR10MB6537.namprd10.prod.outlook.com (2603:10b6:930:5b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.38; Mon, 31 Mar
 2025 21:45:04 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 21:45:04 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/2] Clean up sched provider trampoline FIXMEs
Date: Mon, 31 Mar 2025 17:45:01 -0400
Message-Id: <20250331214501.24126-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250331214501.24126-1-eugene.loh@oracle.com>
References: <20250331214501.24126-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0199.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::24) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CY8PR10MB6537:EE_
X-MS-Office365-Filtering-Correlation-Id: 108559fd-5d6a-4e7b-9bdb-08dd709d4bc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rFtBLrW+9ITRp6KB5TIvfziLcIlV5PI6FmACYeKGc1ccm5eF3c6nQU9ABmNn?=
 =?us-ascii?Q?5BQbTcScWon5/BoWW42AS9c9OHBpqPRQusnxpno90gbLI1hg1ZnneF/gnKeH?=
 =?us-ascii?Q?1fWAcLbM1s1+2nZXpTNHcsIkaqbKs7K2KhRmCh60CbjPl2kTGlilzJSi9eDN?=
 =?us-ascii?Q?VUS5M/8IbPApaHFHofwvgTG/U9g7OZ9N+oC2GlilR6apFFRtlVxMsm/IAmQ5?=
 =?us-ascii?Q?HpZdsyULNKCd4NlQZ7YRyUsP1dOrVMOioMCQgRxk/Q+3N7pER7xkR6P/EMzj?=
 =?us-ascii?Q?WpPKn9p+9bDJD7Gb2MtdasLMsku4+qsdM/Caigwxb+KE6sZSrlxgR6CNXk9c?=
 =?us-ascii?Q?rPfcmC3ufr4hnrGRZW8HDqmbnJKmX/e1AY9kJcslrJthjcAcjFsy3qaSlggC?=
 =?us-ascii?Q?6URH9CtVnF5y5UhrFwDgQon4ueVjjwEapWM9G6JO8oAJ+7YufNUHbLpK3gay?=
 =?us-ascii?Q?WhtU9IkpSp7Xp/qbHG/WtyZaRdnezqzMMapYQZFeQh9yirSD6fhIub3hupWn?=
 =?us-ascii?Q?QANOtSBc1+bbq673w3yjLGgiTE7hWytacuhaNRjTwF8YaEBapIc0XuINQTlw?=
 =?us-ascii?Q?rvtSVJtQX+mVgqJgYmJCSwmuprI483CShC9is+s8ZFwQvAh4S75GXuB1MNSw?=
 =?us-ascii?Q?v04jJ2kVLKJS5Lp8xql/BDK095g4tmNbefLSNCAAN+rgjDtPKQ2T6fShQv9R?=
 =?us-ascii?Q?oH7Rs5GFqy4LEPmIRoPJ/CoGToUGz/2s0MiVK+D+GbwGPDIM4mRtNm8+vgQg?=
 =?us-ascii?Q?45/ssIay6rqonWASb0LTOxn7eB36BAxoZ3KNpRMjRdNfN1NdBaD0klyFSy7f?=
 =?us-ascii?Q?/XMuaz1WgYoXc+Qbrh+/Mz+l3BLImLAV4c/bMzeiNDJMH+EyLr9os2JTbyUt?=
 =?us-ascii?Q?HbvoH9/MkPf/cjX4b96Ji78E6ZezCzkbkZoRnkIiWa2NHFS0TlCMfPp4KQIj?=
 =?us-ascii?Q?vxeeOzQHGFMVy5zsT04KblL1dgRh4L85UlWJg/IBa001IcuNZpiVVRZuofld?=
 =?us-ascii?Q?Mhk2hRfDO/1ldzYcJ4Fw9L1HwQ75HLmWsNzgJeutXkPQNWaxl2ootVPYNzJb?=
 =?us-ascii?Q?C6fNxdmVw7hyLE6zgs1I8qzEhKA3bO4tDqAoTVRFj+hPVh8twIawIitNuRzm?=
 =?us-ascii?Q?hTJdPwV6c2bIdkzezMXtB/mheRlcdlMrb2lcXRcqyGNmt6LIkL8o0wy8OXzb?=
 =?us-ascii?Q?MxkYFAbtVPbM5faa+b/IAFqj5ghV8vvcim/4RblMwq/kRqyKR9+alVKlgd2N?=
 =?us-ascii?Q?hoDHvyMNe5QrMh0uArgr5Zyl4wPwe3Y8hE45fIQxgGtZ9LPd3hZBCkD+D7Fl?=
 =?us-ascii?Q?lQlgWVOcJaFeV3Ncde+/8+a0hmOIFrcI4vjgxm/H+avtjkyl1TL3i0YWer1r?=
 =?us-ascii?Q?8DY0pAFD1HAvg7utKIq8TxrPUcO8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u+PEI26qiBFTGKOE6HC7MxlLqbOvbikL2fOBXtqkriR+1rAWjmQQE/ysyAo8?=
 =?us-ascii?Q?xC2D4WYonrXiqIJTTji25IwrW1wBeb8843k9yTZcL7b+4rkWhDXf7XwLg5+6?=
 =?us-ascii?Q?jXmq0akyqsndRRfuyNnRj0RM0zi7swDq5TC0csvNRSVgYu5URgBhpDBX9Sws?=
 =?us-ascii?Q?4HcU1lYLSY0tCz1oSijEbWv3FuHkKMTrOwamkPUa+n7/zGYSoT+tYo67520f?=
 =?us-ascii?Q?TjesaZFwuDyZeVDhk1QUYgSMCaL2brwNtcacpHi0Z70sy4f5ijHMpW3PoPDc?=
 =?us-ascii?Q?o3eJzejzjwP1eAqjdaz/Tb6wPq9W5c3j3vCL/yVwT+qU53F9qztRbJY3nSa1?=
 =?us-ascii?Q?vL71KoZGE85MhAEAZACn8rs2qWvpBYpx8aihbuAZx3sKZJE9NaUVWujT64rp?=
 =?us-ascii?Q?Tc6Lr1W6tnJaDF/4i5MzmhNHUaZWH9yWTidthAhbBMwc4+00TR7z6C56MCCG?=
 =?us-ascii?Q?mpU85hUM9ssvF9AfrAfr0UWD9XpaCJdem3zpaxWlT82OoaueaY7EekTMct5A?=
 =?us-ascii?Q?Lt/IZVdcMRWnjAIVc6niucB5Pj8sJbr1l/ElDNbtaURQkiO/BDzS+nmguHRy?=
 =?us-ascii?Q?vps44qCy3KRs/giCxDRfcqUeNVP7d/w76fJ255MEbBc7Ek06Gtwp9L1I0zfH?=
 =?us-ascii?Q?6dEs8RFjU7i7fUg4k+XZxjfdCvLKt3npc4fW/v88CVP917pPKtrZ0frnptqT?=
 =?us-ascii?Q?nDsBT2BRruD9IF4CK/c8JAUjZ4uddWgucd+WWsneIgkyxUQjtrZBdr7h5M0M?=
 =?us-ascii?Q?X6YLZhq/UbcE0E4TNEdyzcxbQLUK0W6bRKWX7x3+JAVtihmJcz/wozXBQcte?=
 =?us-ascii?Q?WcBAy2vJMaDiYIOCyXd2DQp1MISKE8J78udY62epkqikru1G4jXpWCH7kQIO?=
 =?us-ascii?Q?L4h+l3AJG+uyUiaqwc/RicDo/rOynPFzSnWrhbNRIJGv+3Np0tiymbb6uY7k?=
 =?us-ascii?Q?N4ETe8F08V1qujEglkfFqrWgKYE7Q0fIp5spqrOxlQiLgy7ucGQobd6tm2JT?=
 =?us-ascii?Q?l339ItW/t2d4hZAjxDA6oIVrwPWX2MxPu4yylJlPMvJMAzSbxm7pOaY3Fw1h?=
 =?us-ascii?Q?g+cZRfLRUa5IBvOjh432gjvp9A3tPTwDMW/HkMkLoZUeSUHecCODmY0r4STn?=
 =?us-ascii?Q?LP1hKtDI9WgU2vMPmpe68yX2nXEpmqIml0mjf2xa9JLkSPyGqTpP40sGhuul?=
 =?us-ascii?Q?dwQLE7bxDYfsnvfEdI9edUwpFsm0J5V648HKly9WBlSqaFBRn5DTCYqUNACw?=
 =?us-ascii?Q?pjey6EGaN5fG7iNayeMx5AhDpYwC6YaC1pwZykGrfiATu0yePimUKbOud8xu?=
 =?us-ascii?Q?SeQSGv0xxB0188bgVn5CJ19gW1tayZ932f49wlH2J9KjHlhmFDdZkM8sCJcV?=
 =?us-ascii?Q?/NISDAjsj28GdSyJQtTVRwMKdwQVKdi3rwgZaMO4ccFxYpEpyns7eti5gGKf?=
 =?us-ascii?Q?x4DP+9XR6JDe6xMYtAVwxfRPg8KcA8PcLYDQNhPDM8maiSdJSR1TcNKafT/m?=
 =?us-ascii?Q?Mi3ARDZ50+/V/pHgZomB0AufJo1QmoIHQ0W/eKJ15MuCvW6+vs+t89B3lTOq?=
 =?us-ascii?Q?XkC12ew6MVHofHS4yS+mgLN/nJrO7uzMC6ydZ2Fl?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UQjcNGT1DEt6UKGthGJqkQoHGJ0cjXJTNPuTKKP/ek/maBWJUl2Gh8qr8i9VhM3/EVfrdbF7t9JocJcthYIyjT0RBYFhKww2WeWLd8NCX6zJU2s41cMSMOj57lQ7GQxKmC4G5UL0kYcLukHiTHV0tF4XOC6I0x0oyeGI30ow7f0XhPuqILDbV8p0ck5ACWoLp0s5l69J1w0vnrZGX4owdXWbdAvFy8K7fdkEdn/x5dSskEJGe/wwhfS4b8BjniYeMxuSUrqZ7PYX3iG/kKNONG/1CR4afCRk3V44vwEzzKDqmm82gswzP+IrB/31R1Z8bxN7mMf0LB+Iys9h61+48vyN+GyjTPNiw2QXRD2v3ZiZRViAjFYCjerd7VmCzxusXq37itmJF2LMG1B+01kbhsanp8vRuu55r001+adCl9NCpIyjPAvISs9Tk/XeyfKBuUpziIfsReaJPY1xvh4mhGn5V8D72hwr9Jxl519v3nvazcghLb6/LkgC3a7FX9h8Cj6lah8mfxKQSt7PXtK0Bfh6/M2TZQzlqhbMN4+CHZ8vPEH21EoC5JlHgp+VQy8kC0bxNqzCyZOZPvSlCjgViLZ4InkjiDb+8azM3LHLBEw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 108559fd-5d6a-4e7b-9bdb-08dd709d4bc7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 21:45:04.1930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: za3WMcmbgc/BKuEJdWvAl/V5hgBouCPrJ0gONvoOLLPOoCqAcNz4enz3wZ0T8gkK3O8REyMkuaIMDrpsqZKtVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6537
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_10,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503310149
X-Proofpoint-ORIG-GUID: z_wMPF44jG807QyQoieggS-RwOyJ8UPu
X-Proofpoint-GUID: z_wMPF44jG807QyQoieggS-RwOyJ8UPu

From: Eugene Loh <eugene.loh@oracle.com>

The sched provider trampoline for enqueue and dequeue probes had
pending FIXMEs for providing a cpuinfo_t* for the cpu associated
with the run queue.  Implement the missing code.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_sched.c         | 74 +++++++++++++++++++++++++------
 test/unittest/sched/tst.enqueue.d |  1 -
 2 files changed, 60 insertions(+), 15 deletions(-)

diff --git a/libdtrace/dt_prov_sched.c b/libdtrace/dt_prov_sched.c
index 3a218f3cb..d626b27be 100644
--- a/libdtrace/dt_prov_sched.c
+++ b/libdtrace/dt_prov_sched.c
@@ -84,6 +84,40 @@ static int populate(dtrace_hdl_t *dtp)
 			       probe_args, probes);
 }
 
+/*
+ * Get a pointer to the cpuinfo_t structure for the CPU associated
+ * with the runqueue that is in arg0.
+ *
+ * Clobbers %r1 through %r5
+ * Stores pointer to cpuinfo_t struct in %r0
+ */
+static void get_cpuinfo(dtrace_hdl_t *dtp, dt_irlist_t *dlp, uint_t exitlbl)
+{
+	dt_ident_t	*idp = dt_dlib_get_map(dtp, "cpuinfos");
+
+	assert(idp != NULL);
+
+	/* Put the runqueue pointer from mst->arg0 into %r3. */
+	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(0)));
+
+	/* Turn it into a pointer to its cpu member. */
+	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, dt_cg_ctf_offsetof("struct rq", "cpu", NULL, 1)));
+
+	/* Call bpf_probe_read_kernel(%fp + DT_TRAMP_SP_SLOT[0], sizeof(int), %r3) */
+	emit(dlp, BPF_MOV_IMM(BPF_REG_2, (int) sizeof(int)));
+	emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
+	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_SLOT(0)));
+	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_read_kernel));
+	emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, 0, exitlbl));
+
+	/* Now look up the corresponding cpuinfo_t. */
+	dt_cg_xsetx(dlp, idp, DT_LBL_NONE, BPF_REG_1, idp->di_id);
+	emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
+	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
+	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
+	emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, exitlbl));
+}
+
 /*
  * Generate a BPF trampoline for a SDT probe.
  *
@@ -98,18 +132,39 @@ static int populate(dtrace_hdl_t *dtp)
  */
 static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 {
+	dtrace_hdl_t	*dtp = pcb->pcb_hdl;
 	dt_irlist_t	*dlp = &pcb->pcb_ir;
 	dt_probe_t	*prp = pcb->pcb_probe;
 
 	if (strcmp(prp->desc->prb, "dequeue") == 0) {
-		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(1)));
-		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
 		/*
-		 * FIXME: arg1 should be a pointer to cpuinfo_t for the CPU
-		 *	  associated with the runqueue.
+		 * Get the runqueue from arg0 and place a cpuinfo_t* into %r0.
+		 */
+		get_cpuinfo(dtp, dlp, exitlbl);
+
+		/*
+		 * Copy arg1 into arg0.
 		 */
-		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(1), 0));
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(1)));
+		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_3));
+
+		/* Store the cpuinfo_t* in %r0 into arg1. */
+		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
 	} else if (strcmp(prp->desc->prb, "enqueue") == 0) {
+		/*
+		 * Get the runqueue from arg0 and place a cpuinfo_t* into %r0.
+		 */
+		get_cpuinfo(dtp, dlp, exitlbl);
+
+		/*
+		 * Copy arg1 into arg0.
+		 */
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(1)));
+		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_3));
+
+		/* Store the cpuinfo_t* in %r0 into arg1. */
+		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
+
 /*
  * This is ugly but necessary...  enqueue_task() takes a flags argument and the
  * ENQUEUE_HEAD flag is used to indicate that the task is to be placed at the
@@ -120,15 +175,6 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
  * outside the kernel source tree.
  */
 #define ENQUEUE_HEAD	0x10
-
-		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(1)));
-		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
-		/*
-		 * FIXME: arg1 should be a pointer to cpuinfo_t for the CPU
-		 *	  associated with the runqueue.
-		 */
-		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(1), 0));
-
 		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(2)));
 		emit(dlp, BPF_ALU64_IMM(BPF_AND, BPF_REG_0, ENQUEUE_HEAD));
 		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
diff --git a/test/unittest/sched/tst.enqueue.d b/test/unittest/sched/tst.enqueue.d
index f445ac843..28dcace8c 100644
--- a/test/unittest/sched/tst.enqueue.d
+++ b/test/unittest/sched/tst.enqueue.d
@@ -4,7 +4,6 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
 
 #pragma D option switchrate=100hz
 #pragma D option destructive
-- 
2.43.5

