Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0211F13C9A7
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 11:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714131600; cv=fail; b=Yx6WuNCILags2h2898w3GoEG9efa1tGHchegjAMWi2tnl1wJOfCngBGPy68jfOlm9iCRxH0S24XEZ/3If1vCEGWGhwlignW5Ik1hBM6y5CMfzowDJobzqn74hlVIinS9tqErOk04WhZPcF4+WOBvC5u8FkV03oumiLW6ZDDgbEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714131600; c=relaxed/simple;
	bh=puThMo08534rWJPPoftw9I/w8KcAjL2EQ7GyQiyjPjc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=kdgXUdhC0bbQgVn4fo1355/TuZaOvu3YIEgsSAvXUdcPE7rWJa6f6lXOvXcWCS+51BMoRhQ+TOlJdqpFM9V1d6opdEcYUpONpWLaOMllf7WRX6SskHrbD76R8Fly8N3FW6kS4126ByK/VgS06C9nDKKKAp1x27sdGF8gpkF/eyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=g6t7Lwch; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DVjG49ko; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="g6t7Lwch";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DVjG49ko"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43Q8Tc1N005243
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 11:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : references : date : in-reply-to : message-id : content-type :
 mime-version; s=corp-2023-11-20;
 bh=ywPqVPo2dFiDBg7K+2068zyoJTcCuITfNEzZCsenLnI=;
 b=g6t7Lwchz3CIfsnH4T+SBU/CUVMNaRtv7evrzectd/ApM8N/cSjy63a3LNGxjxbs60nU
 pQQ5g79ZeauSL1fvEtsE1ycVuD6qt7vm/8/Yqx0GUB2jdomVxdxmmu4y2fhkLHWV+VYZ
 l+f0SEWHz9bG/lyXrnD9UIFYbQXz6zmUMjr+IN1HuywCy5yVjguqQzRpduCfYYFXzSNU
 meA8rrBOgAQ1H3KnBXV5iu6RneghSQfbdNKVi9mmV90IeMUhz53MZ6opYzO4u1jGHN33
 r7+kg/XKPats34KWFg2OemDCpf72uK2y1yzzoR45yKYZDdPYcxHpFpxkC/f4eXR9wOGe 5w== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xm68vnts7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 11:39:57 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 43Q9AmS0006169
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 11:39:56 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3xm45bmjhr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 11:39:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0pNk0HxhIC/xw2xWMlEWkeIcmkq+Z6PDQRJqZDHHsO1xu6n6iJIaYOTqKWQbYSq0l4vfsk8Qmx2ZxkyrQjA1RI+vg/awTC8NKv/xsDmmjWYjui3F2u/ccPZJ9KzHFz/uBc3WOA95ib34wJjVe/kvm2QTjCmE5sQR3CTZkC0QcKlqbDH/2gTQmalBJGKUcSANWtro+tNEY+6vN91AM2PPKSnlxCiqXrOHHpOb1uIzr6YlzcZlp6OrywoZWDczbzWhyULvgMZSIfLVgHIDMjpLpXylQT3eU2LwYmJP3XdyReXFoVYNJ0nZmg8QSclD/1zQjlJwVRrini6upVIIEyLWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywPqVPo2dFiDBg7K+2068zyoJTcCuITfNEzZCsenLnI=;
 b=W4UPaLkkI4536wg5LO4JU32p4lKh/nPSPeEjJ5IOPy9oRUW0NzbDldWfYdh774h3LPFhx31E0XZt1CEuRsB6fLzOepJzzdzJAOI2DPOFKzHckK/wyD5cyKn4b556b0XZQX+VN98uJpvpqdhDRJbxTfWvaNbw51zqOA1Jd169LfxI3YKSjR8QzVOxI1d7VpzKbjK6u/w2Lz1XglsL43UbpX34RevmmiSqs7NpqEJLXHFt4ooWhLXuZzw1Hq3a8dsFpxWWjh1s42OWHUO0z6qBzaIsclSTzgW2sOxHSj1FmrQ6pMN47XK6vF29eFc6GOB8uZ+ZXO1ZL7LVefJxMZXbpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywPqVPo2dFiDBg7K+2068zyoJTcCuITfNEzZCsenLnI=;
 b=DVjG49koq8iBOaMIJa3feTOv5VFVK1vVau0VkcBbs8dhPjB26poR7G6gy3k3ax6ZrcMYwDZDrus8/W+3e3WTwTIgZxRZCEUaPXvc3gE3/AbqluGezmNfmLhQNNSKB5N6bSDXGi5aKismwRSiZi+3sis8YoISbxahERw/KIG1ktA=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by SA1PR10MB7738.namprd10.prod.outlook.com (2603:10b6:806:3ac::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.48; Fri, 26 Apr
 2024 11:39:52 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::67a4:9544:7249:7751]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::67a4:9544:7249:7751%7]) with mapi id 15.20.7472.044; Fri, 26 Apr 2024
 11:39:52 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: use a more stable data item
References: <202404260431.43Q4VLTS004320@pps.reinject>
Emacs: if SIGINT doesn't work, try a tranquilizer.
Date: Fri, 26 Apr 2024 12:39:49 +0100
In-Reply-To: <202404260431.43Q4VLTS004320@pps.reinject> (Kris Van Hees's
	message of "Fri, 26 Apr 2024 00:31:20 -0400")
Message-ID: <87wmokl5dm.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0492.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::11) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|SA1PR10MB7738:EE_
X-MS-Office365-Filtering-Correlation-Id: 1776d19c-d027-4f8a-5ec4-08dc65e59682
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BcM6ARaHDAQz8oOHzGHOvJMSjX8gPLn6JAhehxB60e5db8pTaXeQlRDyNqT2?=
 =?us-ascii?Q?SldbP3IrpZuatGb1Ga3j5G4YhSDlvtO5VY7JcT2TH4Nf9TPeKf0yU9kEx710?=
 =?us-ascii?Q?q8IS7LzgohLtXivdLkzasA4IPn6idjjWKqsAEGTDxI3uQCjcukmUKRwS3k+6?=
 =?us-ascii?Q?zE70x1GJuVi32YEVAjUMd7NBl21qe/G4wM2snBVlyFigqapHbes3WtQZoWN/?=
 =?us-ascii?Q?FRkXWiVzboPYjr07xoSbt5SbxMqZ/qhte8W6O8sELz8BjiElPXBpiMuJ4ndW?=
 =?us-ascii?Q?3kqUW94PhbdJ/TWvdFoeeOZhjLAA/BSNMQQT2Rfi1pvc+l6Dg4x9OK6W2V1+?=
 =?us-ascii?Q?VWoVadPA8BQ3g05YBLrb58yS74mwWzg4iojIc5wcO4VzIuHUd9jtp4KS1VsU?=
 =?us-ascii?Q?+AyGptt0LJ0yh3AU64s9suS51wjn9E0tl5iZ9oXwdqXnkYp4Z9uXuFvhCyEw?=
 =?us-ascii?Q?zV40db64xqldxENHOs6+XV9RQTwrmk/a241WkbmejF7Bb2I+DJaIPP1bd7cM?=
 =?us-ascii?Q?ahMZiINc82w0BpmuS4JLJ4eBJ4nl23uRpxMtMaTzUxz/iKSIfF3SwRcmf1ZD?=
 =?us-ascii?Q?i5DTCX9aLwq+550ym8FFwrdONH+JUS9EsEeDnEmPrgjt4N1/F7ji0mfdEWOz?=
 =?us-ascii?Q?Ri8mv2yQ42GbDbr8pAgu4u0LjqB9znJeGHNFmQJmLFWinDDp8X6aGsc/nkU3?=
 =?us-ascii?Q?vVwFigb7ErYcrfboUQBcYjP1hgQP9MPxnItG7K6vopNAg0ugJqf+IGgGkJje?=
 =?us-ascii?Q?ON1ULqfEhG4pIxIOiVwVF8gsdfaIT/3OQGs8FscBo7YpcU/mh7f9oB85lwfs?=
 =?us-ascii?Q?Ss4jww4+HETNvzdaNay8MuH0K+utrdiEALQMtJlk/SbIP9EznUHYLcx+5erT?=
 =?us-ascii?Q?CI8Tylv0e8rIgdi/yj0YKYGFpEpf+f07gyKW1wKL1Z/WoKF2l+g2GzloLmP+?=
 =?us-ascii?Q?mkWL5IE58lbEHkLHzvHLvwvCcDbAol2G1VJ7Pl13f180MNExF+VBsYSjcwkZ?=
 =?us-ascii?Q?vh+GjNOx8nEOtr86uqHPecv7A7LWB5Dba5ZKqaqiOWovHaW+itPoMWj9e9Kn?=
 =?us-ascii?Q?B+j7qrbZ+ZTPGujWQNgVahIb3RFnUyfmTMnUicmWjx/fx1+azey8yBmoyhaG?=
 =?us-ascii?Q?W6Wved1JE8dWP5wfiYe68Y6yCQJEhsl+iIuTXfF1mnojM8GR0clOt7FVJEh+?=
 =?us-ascii?Q?OXipFanEKb9D7blRIhYfIYvBXd+nrBNTxqsH89oWxxVleAbt6Kq8JLlk0ztj?=
 =?us-ascii?Q?o2ZpbWdMrRJVvXvxpts+H4TGBYXZyOb2geWQHTJOUA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OS1EJbOdZKdo1ujPUqvH7lkp0YPNX63qx9KG6eXenmeCivhk9o293ItqUbtt?=
 =?us-ascii?Q?m9o6IatDUob13Kq7aB+UntDfqGuFU0BEJSo5Tl0r7Lz++Akwu7BDDUGsefnE?=
 =?us-ascii?Q?UaPL908l4zHVAzuJdShI/1QSI/+XPngmEbvNonBvPaQ0dXIjfbYouIoIo4Y0?=
 =?us-ascii?Q?ypV3Nog56BGjcsCHBrgx6p1IXIZlxaIVmKBJtBqXNXpqsJ9FDmLGlx+0UXi3?=
 =?us-ascii?Q?qjLFYsXR8S3H6L5z1ICC6n9CKiYWRQhNyYvQwkLsUy0B/1wOAzAcx9mHAP48?=
 =?us-ascii?Q?CWFbhfGxuhfXzqaAs7b0gmYRy1XVR9Vod5V5aV+o+WbbUFIOAhkNvE3R8k+K?=
 =?us-ascii?Q?/OA/fsKunWySSrdNDBYJUs8vm29Q9nBPfHX+t99OY+aEVGVIXbFGCoDFex3C?=
 =?us-ascii?Q?ktShLkTv1SqpzMu/riaM72FJlPQP7ha/Um97nT2OisfCyrxek+s3jtOSJMgE?=
 =?us-ascii?Q?ojJABbQEfoJqGQLK/s1wA/t/v6HzTSfXB31QXxjg5q7wUubh4Zju9+oxwATB?=
 =?us-ascii?Q?wXOQ651KNfuyrAhDAflA9tXydPHgoZovMeOKVzv8N/3sr1PbtE8VO6F9JKj3?=
 =?us-ascii?Q?+jOqDXrhoBt6hkTUO300OC9JO1nbRkKjQzZVgK5iq7akRKQaBSwUvsiQJcaS?=
 =?us-ascii?Q?gDkKJr+6QDW1zM+SL3WGub92hGC0A+Btsk6xhKv9STuHNLfmD3BsXBzvhcnb?=
 =?us-ascii?Q?/CFHc2WYqopITlMU6o1a9fhkpXKoeVUjsd2V9T9S/1d2TQWCvY6SPjjnR9qN?=
 =?us-ascii?Q?MIrtM1CoKVfOCSx59LPtVBeES4WwrztTilx2ZjQqjePLDNdVKTbyKKLT/JHr?=
 =?us-ascii?Q?ubdC9dM/ThbLN4VIpFOG63XCwCrW3UXWvIm5ylqraa6f1QFe8CGPRJSdS9H2?=
 =?us-ascii?Q?AOGWWWwmXpzdD6gt96ToNBjbhWNnui3PRzBD8ve+Gcy3Ny4JP5LXwMBawi5c?=
 =?us-ascii?Q?dOxFGZ1pUp3JYnU7QQIrYVHTTfXOO/uVm5EaH+lBrCA0J8aCSGL5kVyn/WYJ?=
 =?us-ascii?Q?UIi8reUNrTxH8PtHHCdKfynSJFqshJSqYsY05QAHzO6ojJYHHEdowqWz0wKT?=
 =?us-ascii?Q?5fMHYp59eHtjQCRvma3aBdU4YUBEjF3BLOXZqIsXOBjjx4i+0HFR8sppt5vY?=
 =?us-ascii?Q?Sdaa7oqsmmhH67IycClLvuEtHNuX4ShqWNKN775IE8Qi+1PbaiKmd4aX4t0O?=
 =?us-ascii?Q?jqub8wXFqIQ+KCyd+vGAZ//TnIBDlTen4nXF8He4zb09Dr+C/Ft3rcnTf5Wc?=
 =?us-ascii?Q?rpKtcMgLyIpnXMBGafTqnuJFAth9KYck5ED62J1WSEPVhTqZqvgRuFqXkPYl?=
 =?us-ascii?Q?Je8tvJBUExPHCLfn4gIyWl4DrN1U/qKSmaPETwWsnJ9aa6Ux7YZiQQ/R4cUX?=
 =?us-ascii?Q?XgAM0BeX5hekGP0iV1aF/6w5Yomcek4ziNjXNCfQivJ84sC6BQHbxUgGcdZb?=
 =?us-ascii?Q?/E9Ld2mwF98oF4vN7A70AO7j+O6P1+b7bUkZR8j5VfMKxt7iiMFaL4O11giS?=
 =?us-ascii?Q?YGq22dilQvJOTd6K5R4I7pHlLRbPZCZS7zCysATI+f1658vkbHOyn7pXQf32?=
 =?us-ascii?Q?78Hjyb7HYoz6JgXDFZhg7foJ8C5uTq/ok1Mxg8tLL9MGczO5fzCLS/byk1UM?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	gQWzZe5S+qBtT2IW/xu2uSfzGVU3rHd583adZLQZ00p9coZMS9dnT7FyrIdiYXOZVvp39X/kZJ4gQr8VAvhBJ/P33O5pWyO8F+fpCg6slnH2Ewm/uuFO07oSrEFG+6x/URxklHXXjmInBisKdMJvOlF88wroEIDJO+yXI7gmhBXjOmK7sV7fcTc8+yNXQZO1kk7/E55ys6dngpSqRp6P2T2qyieufhng61adRblQca5oMnEu8dqKO0uUgBZh6E7bTe0Ex2aO7BLRO29AoF32NnxisPWjsysTDcHc+Xtl//TDZgmpsY3dBtMjM1scvggXWhtliZcHjjlhyauEMOQNKIghNSU3IDWwMdKUhoOnWJp3jKm/ZUkDIJWiRdliMbbgZ5+djud3Kp4eeBqDjb95TsjjYsX+BKc5BoPoxjl71lYcbA5+p9b9Laq6408EeXhEN/5FqLRx08b+qaHL8UDaAw+miN8rjWEm6s7+FeiapHS+DXWC/NAUPW63QiyfVfI5yuEKeEgLJDhSl7bCpPK/n2lWtPKOsMawS0TlY1q3E14iSHWbjU09cD5Fpzktwl9lmMbrkEMSbCcpYy3IzGDEdjxpQlojmOwwdj5G75ie1UE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1776d19c-d027-4f8a-5ec4-08dc65e59682
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 11:39:52.7557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v11Juhvrhg6aD+J2glogxtEkl7YMYAl9+2jxNVkboD9/+Rtt9IGNGtZWiGhH86/mcdwGV6jBK51ERP/XtnDw+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7738
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_12,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 spamscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404260077
X-Proofpoint-GUID: FdW6TH9eZcKtw3sMj4z7NNa1KlkUZsgs
X-Proofpoint-ORIG-GUID: FdW6TH9eZcKtw3sMj4z7NNa1KlkUZsgs

On 26 Apr 2024, Kris Van Hees said:

> The runtime bounds check exception for dynamically sized arrays in
> kernel structures depended on a kernel symbol that is not quite as
> stable as expected.  Use a member from the mm_struct instead.

Your assumption that it was analyzed in any way for stability is
touching, but inaccurate :P

Pure gut feeling replaced with something a bit more obviously sorta
stable (at least it needs more work to massively change it upstream,
and massive mm changes are fairly rare):

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
