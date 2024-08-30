Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC30D1B8EB0
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 16:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725033906; cv=fail; b=l64hBskkGMufxSTkOhRMIKiJaRkb9dKqYo5O7Syp5TRXrLr64oGnrcrsADGEuITIdHqVUv1hkke4i6x3e2MVI7pMvXoYRh8JejMxkVYkwOTVK7cbVyqAHhRiAI00jxAhimsrb/2/QLhlCydyzmcbBRB81yZHvJdQNj8GM7TAbaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725033906; c=relaxed/simple;
	bh=spe13qojzmpW2PmrqSYQl2Uz4WGaLE1+qSP32RMIdcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aRoOsFTwz4pBzWL2H8+atVqgZOfjwK0+VVXy+EmeEN1c3p6Efs68moA2W5ZcHwaum2NRnRCICPt4a7YIuO/+vCkpzHmyLv0A2jkn2lsNyAG7oZY3g2baNpZIzPsj9/yeaaWjbQBAon5X7obGo+sc0EcvGodhcPyy5Hu6pu1Vvtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GIulx6ER; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Pj7KJVI0 reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GIulx6ER";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Pj7KJVI0"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47UE0Wea018959
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 16:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=S6wCqqcE2RhAuCM/GgnqCosFrZ0noW2CCamMqDfqbDQ=; b=
	GIulx6ERjNNcvIhcNDkuaO/lFhSo04dzOiIFIZl0qis+cyIgfoYPCc9pym5F8HNW
	tJPPnZ41Hil5O1GTbQjRjNNh0g9AStXCnzxeqCR4qDcJVR+fZ3LM70Z6FiPj7F1X
	u3WytPJg3eYzOgyehSkdzrAZBMjOEhHKAUMtu2TpTgq9U/6lrLaIAvkf2ILbmXcS
	qhYz8zi14ny2yqmaHDWgI1hX9S5ylkGvXdAKkb1F04bvNlBopx3ezxAkTsCIXYat
	JuKgovTifAEF+IVpkyd6n0KjOh1jfHBW1yHEy3U/QXDtBd0e3T43fadsHt69VjW8
	ZVQ2lIbaqEaXLSOeW5qKHg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pugy4k2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 16:05:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47UFZNtJ031876
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 16:05:02 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 418a0y89vh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 16:05:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yEGtKz1Vg81fqGwsNOtlVg4dLcrVzcQQvP1yt4qbQbZ6/NdYZpBlUNtgbQsA/POouHplYriYPu5mF5PmjganMVOJ2bRooA6XTgckjZgixMXPQ0DHZWyPEKbPy0MhSY4Z3KqmMIKmdX3Dk3dI9S0ve5Qfp5SB+Jit9XfeyHarXjwfhWkdRB9uDgokBymMAEQKoXE4OL36FRYqxki9j1uk6C2hkGUwuwdcsbXLmPE/BCdwULqIeKGEWRE4xOMhdvAP3TvGe7Ta1DTx7scgdH+wHqBBnLbr6FNHH9Arcyhzb5lQKiZG/Rb5HxmqOHpOExeQYERn8oTYGm3aSilmV5/YsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwCnmYL4O5M0fG7quBJWuQKphQCkA/EIZ/VVy8Fo7No=;
 b=XbeUNgS6mEpQN79+Uf/d0/KzWK5G3lw3QCfcXDeXg4mwcGQPz04NOCS2MDhVTLeF8u3dxUM6YvvnP7Y6/ccuxTNcdq0GS/KTINctIuZBb/GAt69tu0wGv6xUD6Ig+auOMJVFIwz+nPzf6JfCjivj8lithEdeUpDEb9lIKXAle9kBBH6yCydHV9pLmasCMM9owuwak5Y12VBALU1/5z//oMCIsrr8twpZFowFkeLpUbyutgy8Ztgo74z51mHfeuuTRbSCO+TZsmWpkTx6FhXJc9p4aVC7LuJZG7TwTDx0UEvSOtiW+uMALEeOTR9KBhRKdfArcuSm1Rzb9O3PGy8T/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwCnmYL4O5M0fG7quBJWuQKphQCkA/EIZ/VVy8Fo7No=;
 b=Pj7KJVI03gZ1Kf+X+BmkXwZsSp6gOyCjZ58xH2rkv7BLrLPCXiKZMbosRe4Hk2pymfvNQZ/ygReN4nR8C3cQ00D2C/uCfKTEZqPfy9z2pMu+cli3hdmjrm+L3/w41jIClaiLsiUnmBr+CAO13QMndKIEFnsBWQzxBqP5rR5k7x4=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SJ0PR10MB4639.namprd10.prod.outlook.com (2603:10b6:a03:2db::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 16:04:59 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%5]) with mapi id 15.20.7918.012; Fri, 30 Aug 2024
 16:04:58 +0000
Date: Fri, 30 Aug 2024 12:04:56 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 01/22] test: Handle dtrace:::ERROR arg3 specially
Message-ID: <ZtHtqBicqmflEWjP@oracle.com>
References: <20240829221819.10237-1-eugene.loh@oracle.com>
 <ZtE7hV2L86TaG6M1@oracle.com>
 <ZtE93QS+vPcbeq7W@oracle.com>
 <90a6753b-12b0-27d1-4895-35a959b4c5a6@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90a6753b-12b0-27d1-4895-35a959b4c5a6@oracle.com>
X-ClientProxiedBy: BL1PR13CA0235.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::30) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SJ0PR10MB4639:EE_
X-MS-Office365-Filtering-Correlation-Id: ac6f758d-2092-49fa-43f5-08dcc90d7f50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?CL2ZOlbED8iwfWQnu2zIDB/pZ768OovhgboBO3Yyc1ZsRbUgpjfnUAl30K?=
 =?iso-8859-1?Q?dUqyLYiFXbnzASp9dcwe6TwYhM1h1O5jpOQBbnvD7qrr2zF4hZFs1//+Bk?=
 =?iso-8859-1?Q?afAjmwPjF7WgHqityV/nqA6kR1tXfL788BZ8lQkKcwosb8T20AAMtjkyiA?=
 =?iso-8859-1?Q?2NMMPasxO/PVrbd5IfGQFwYqETYokxsY2246rZCAojH8ScpVnRlAyPRwxP?=
 =?iso-8859-1?Q?2WvEH714vFUcPOorcBVAFKSrl3Y/W+v8Ez71+b14v97PVFxQC4LgQATHI+?=
 =?iso-8859-1?Q?exmC63rtEoc8QABkCvzsYLvYu/n3xb4JoGF57mHUvTfDevSaDyycbU+Atz?=
 =?iso-8859-1?Q?xR4NNQHsksvp5GwY/0NK+At0hQ5Hl9X5O6Hj3Sv0yVaT6DtvYyQxCVI8e8?=
 =?iso-8859-1?Q?UTUnb/YUR/81Akeu8we5DEJmMV6daDhoQY2MJxvGidevOfslMwSb3jLABC?=
 =?iso-8859-1?Q?2t1vKWl2zd5OyuJ3+2NbJQtinwd5uN8eN/1xSCh0eAObJWgKMKCYEsChX4?=
 =?iso-8859-1?Q?xKde2YaHjoscvnbDbERItLo7ZwAKgyX3XVHVmygNIFQpsB9JsBUJjR6c8Y?=
 =?iso-8859-1?Q?SarYwjrBrP8E+8hivQxYh3ZT8nyvaqI2/GAttnlzSuD3242hOslHIyPMRc?=
 =?iso-8859-1?Q?dzg3+ed2GH/uxVL7A/m3GJbyGaTp0PJPSjITllsQsZ1ivaRN391mihVBNh?=
 =?iso-8859-1?Q?l0d2rF4n2PyRMoxOc7fNI9W/NlmF50Vhyk1GEFt5CTZ7r1Yyu5hUBkOmQg?=
 =?iso-8859-1?Q?sz6zvPhmUCZSWd4l7DpIP8wFmSMt8Jr5AxQWR/I2emLvH7dvuGvi8SE3vB?=
 =?iso-8859-1?Q?4rC2sxtLzKkYkZK2AJZjvI/u1/DYhlwCBl0ycC6VvB73F6Uy3GkUSDarYq?=
 =?iso-8859-1?Q?L4MetNdBFrKL6Ly4k5G0fM4OFJ2eNlWiQ00QlCXRD9pNS+5NvRaYflw47/?=
 =?iso-8859-1?Q?D5Rz6cNW6c7+iug4JCUama7ymwYZfVaE/QLElPcYVfbiP+VYx2LxZNXNeh?=
 =?iso-8859-1?Q?cMQJC8Ckz2/1BbdoZ80Gl/ELPTUKkw8LFbqEtLNEFB4+gF8WXnymToVdCK?=
 =?iso-8859-1?Q?Yb3AdYH0fSnj5KrggtPGQqQR7cziuxLXYdugDsXwobiWOg3W+T6s97prLo?=
 =?iso-8859-1?Q?Ic3U/V0vrjBkk59i/wP25VOHUb5BEFgtpgCVBtzbF+J8IRrya5cc08wTpO?=
 =?iso-8859-1?Q?PHZNW3tawtt+MaagdpamENEF/rW/7KlhdbDVokOX0QIMDU4qewLbTAqF0M?=
 =?iso-8859-1?Q?pR1CQq0MkUkZhw/lyTmF1+WyuhX3/Don9Qd/s/M1Se7VP7o3i8JOSVEjIK?=
 =?iso-8859-1?Q?jrS62QnKlb8OIpVzIi2wzXj8ODUAfNiGFnwj+/KOPN+XI0SORFiOy3mnZO?=
 =?iso-8859-1?Q?ukeRCRyza17IbOECPpupl/L5SOs5HejE9iYYOuDOWhcI0VTE7PiZs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?G9DaBcbEA6l1Jwf+Z7sp548jJB5hRy6uOdLF1x6zInUsU9SBeSBpDFd8fg?=
 =?iso-8859-1?Q?RGJbovdHWMGmzBaCxG7wJQOdJgeTv7jq3ujJ/azhEr9023uDZthDyKlP2y?=
 =?iso-8859-1?Q?xgx/Hcv18g3QaM5ZEtAdZXqF1HtPty85jFxUO8UoPasde6pGj8ZX1Ijaim?=
 =?iso-8859-1?Q?7xbTF/ZbKBTWMFGCufxUxjsJFnvyW8aHuQNnsWaLgG54o8tP+elsNoBIC6?=
 =?iso-8859-1?Q?dito57mMq8jy6Eka/i+gLr/UkGfWEkTbtB9YPDlRkuGoA2qLGYSwPXNU86?=
 =?iso-8859-1?Q?oG1XIzyuxqbmNelWLBs3hLyjdWl0gzGW39BJRloKoClPL9YPDa2Veykg0x?=
 =?iso-8859-1?Q?2AgUFLKfVipvZ3MjFPPDBIbA8mhQXpZvnHW8qaDjHtfIH8ivMmNNG888NS?=
 =?iso-8859-1?Q?DZOXWgYBV8aLYob2Nbmtw4/usH196xiu+34aXzDovI2IU2fqNGu/LKOoh3?=
 =?iso-8859-1?Q?MIPy5W+Dz6k9ONWvNM1vYBm1av7EgOtUpf24yfWvj4pAJj2n8+E/tyIL9a?=
 =?iso-8859-1?Q?oz9H36Yj4szzRIOvUBp4jhk0RfC8fPBdKygvlBFwPL3KmCP9Er/cWow8iu?=
 =?iso-8859-1?Q?PFkwXK/dCHsJqUskrM9s1R+4uN+KL7fAZ4RS1wZj5WdHhbXtiqT3GCnk1n?=
 =?iso-8859-1?Q?vhO332SJ/Rja/jZXJ2QhX7sFH9RadZGycGMdaPUO2W/PSrOH33UZDC82vL?=
 =?iso-8859-1?Q?xTPiCQYdJHA3SQbxwuQQ+mSr0DDrXG1342qvAjhXxEGiKYSNDj8/OhexVt?=
 =?iso-8859-1?Q?dChdJv1cHAOxvR4ilRg5ikZb5DeYkFBGU0rzTMFhLK9q5S40C0CPUJalRa?=
 =?iso-8859-1?Q?NhsaHJ0TBz5pYqCW20CBkPQUGju0EDWyN46IfOjGb6N6XqJzfWoIGP/tGX?=
 =?iso-8859-1?Q?2CrUCQSvhpZrt8gD3ZNtnS5CQPes9tYlJYkrDIgnRLV3ii6ahMGWyPYRi9?=
 =?iso-8859-1?Q?GcDu07KBtWG8NI6r1kT/6zsWP9S/v86v7C6diJZk9UmckSFLeeRzN3uja/?=
 =?iso-8859-1?Q?OyL1kEL+9mFAPOkAdgls3G5bz4fyTwWWONwbFb3YmMQXCYMb7Tx2+WLa6g?=
 =?iso-8859-1?Q?HlM2mwqeJNMMttjjTL2CB0dJxSCvHsrXd1omoZv0F06064D/hywVfswNcr?=
 =?iso-8859-1?Q?vOaMLD0t6lqfJOREnYLCjMkBfKofFvR9A05ZDTiA9My/CpwWOLNoT/S1i7?=
 =?iso-8859-1?Q?dtmI+vniMLa0qRzaH1frMxkJiex8jR9WV3l+o8RvcQhc7f4IYa7aARelX9?=
 =?iso-8859-1?Q?w0YbaNsF4pTrAFybd3GdsjgDPqDBfJzfFzWL4ZZ8jB2a9IP3ew9HpnXY1x?=
 =?iso-8859-1?Q?3sRnneg2zs6jd9Fg5waEcSZvU3sXL93yrbLB1In7OUpEJXR85t2TYLqrb+?=
 =?iso-8859-1?Q?liQ6LTpFxfMZw8NStHihE246Itv6V7kyfHIqc1KzW5Yw0Tn5sozAv+GHbB?=
 =?iso-8859-1?Q?gDdLSFpRPq6U3j8+onuZBMjrbsajYt4zTx4Woje+vvIhs13X4pWTwGvlbi?=
 =?iso-8859-1?Q?dpB96vva3R2i/T66M4K9Wy8D0SyPSv7BawS9TqnRj1ZepQM1ixwka8RHcR?=
 =?iso-8859-1?Q?ERHgxLdU3OwqSLlwG0gDhkY2iAsEhWa7zDMaA2kFaIaTz6FuYipsJzEdJw?=
 =?iso-8859-1?Q?3f1guI6rViQ7a4KbAesB1FlrkaTG7oPCeDtOf42hIcwr+7l9iO/S4FhA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/l9E/umCgke7bwnz4cxvSxSJc78nB+z2yXgcpyVXDYJtwzKuvDifv3H//9H5VVkU2QM/Cm1/w5pR2j5Ft8KiY+752rIr4UdS+dt4mj3iRNAwtUBvoQX6u2hAybWxt3jMxSXK9qmzMcoPu93HoNUTMiDfZiZOh2wJtvwolbVD6W4TDzY4rdrHBBE8bdtR1NWWfPdBttyMu0DM6vqz5wVwV2k67vpItg2+GF679z3dLbHPu3b7jH5JrXC3Vu5g8f7mwH4YuMWuxdELKLiu0Ephh/wAE8LXJB3pDEpnwdZ7PPK9Zxt1qheIJq+TFtRornUD9l1eAdwKrtFDUMSo5bjT1HJw9wnajOC/OEGeA4HqUF0bROIVfe45w2ux31mcFQK3YT9YZOBDMS5jsH+FWA6YXPW2eKoRPvXIezOdcL4UUivLdzTdfqyd1Z2A1s74HfLRYnYL3jk74SnMTPtom6F03txUQG/T/52i7tQMWUyBy8rhg9beSQRWdXeC6beqoaSbeENrasTJ0PS6asOSOdlBzn9uKsLKovDah+jPGTkuSWpsAPqUEkWkRDdr96tqab1VATTYXDMH1rGU0IBGNEdV53yY3lhyBL7+wTJ/fyyHl18=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac6f758d-2092-49fa-43f5-08dcc90d7f50
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 16:04:58.8842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1vHUD7DJ8m+HCOAv8kTimoF/Ap3FIBgkNgm9WNNnUzII9PsYX3NdHIZF2zjEHBsm9Y8NtrqL52qV7OHndrYO9XEicf1jdz8yMSJRbn2dU/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4639
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_10,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408300123
X-Proofpoint-GUID: ejs4ilm1_0faXs5L0hMafHAALZ-ztAXB
X-Proofpoint-ORIG-GUID: ejs4ilm1_0faXs5L0hMafHAALZ-ztAXB

On Fri, Aug 30, 2024 at 01:28:37AM -0400, Eugene Loh wrote:
> I don't get it.  The patch was supposed to be about testing ERROR arg3.  The
> "ASSERTION" in the test still claims this, and the name of the test does
> too.  But the test doesn't have an ERROR probe nor does it access arg3. 
> So...?

DTrace provides a default ERROR probe to handle error conditions, which is
what prints the default error message, accessing the arg1..arg5 values.  So
there is no need to explicitly include an ERROR probe.  That default ERROR
probe clause is defined in dt_handle.c.

> Also, the test checks fewer things than does the version in the patch.  You
> say that's sufficient.  Maybe it is and maybe it isn't.  I'd vote for the
> more stringent test.  Tests can check for bugs that we anticipate, but I
> think better testing improves our chances of catching bugs we do not
> anticipate.  Certainly checking that a PC matches at least one of the
> dt_probe_error() sites is a better sanity check than what was in the v1 of
> this patch, but it's not checking that the arg3 value is correct.  Given
> that we now (with v2) have a test that checks correctness, I don't see why
> we'd switch to a test that checks less.
> 
> I'm not sure how "ready" or final the code is supposed to be, but it also
> has some small variations from the bulk of the test suite.  Not necessarily
> anything monumental, but I think it's nice to keep boilerplate stuff as
> uniform as possible.  The "rm $DIRNAME" and the missing blank "#" line after
> "licenses" seem to be uncommon practices in our test suite.  Again, not a
> big deal, but seems like stuff that should be boringly regular from one test
> to the next.

It is a sample alternative simpler test.

> Anyhow, my vote is for a test that checks ERROR and arg3 and correctness.

I appreciate the detail in your test to extract very specific information,
and the way it is done.  But that makes it also more fragile in view of any
changes in the disassembler output, error message output, code genertion of
the clauses that will trigger the errors (e.g. that there will be one and only
one dt_probe_error prior to the one you are looking for, ...  That makes for
a lot of potential things that can change and cause the test to fail without
ERROR's arg3 being wrong.

I think you just end up depending (and essentially testing) way too many other
things that could lead to a failure without the thing being tested actually
being broken.

> On 8/29/24 23:34, Kris Van Hees wrote:
> > Attachment did not work apparently...  Inlining...
> > 
> > #!/bin/bash
> > #
> > # Oracle Linux DTrace.
> > # Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> > # Licensed under the Universal Permissive License v 1.0 as shown at
> > # http://oss.oracle.com/licenses/upl.
> > 
> > ##
> > # ASSERTION: The ERROR arg3 value reports the correct PC value.
> > #
> > # SECTION: Variables/Built-in Variables/arg3
> > ##
> > 
> > dtrace=$1
> > 
> > DIRNAME="$tmpdir/arg3-ERROR.$$.$RANDOM"
> > mkdir -p $DIRNAME
> > cd $DIRNAME
> > 
> > $dtrace $dt_flags -xdisasm=8 -Sqs /dev/stdin << EOT &> D.out
> > BEGIN
> > {
> > 	x = (int *)64;
> > 	y = *x;                       /* 1st ERROR */
> > }
> > 
> > BEGIN
> > {
> > 	x = (int *)64;
> > 	y = *x;                       /* 2nd ERROR */
> > }
> > 
> > BEGIN
> > {
> > 	x = (int *)64;
> > 	y = *x;                       /* 3rd ERROR */
> > }
> > 
> > BEGIN
> > {
> > 	x = (int *)64;
> > 	y = *x;                       /* 4th ERROR */
> > }
> > 
> > BEGIN
> > {
> > 	exit(0);
> > }
> > EOT
> > 
> > awk '/call dt_probe_error/ {
> > 	sites[int($1)] = 1;
> > 	next;
> >       }
> > 
> >       /error on enabled probe/ {
> > 	if (!($NF in sites)) {
> > 	    print;
> > 	    print "  No call to dt_probe_error found at PC " $NF;
> > 	} else
> > 	    ok++;
> >       }
> > 
> >       END {
> > 	if (ok != 4) {
> > 	    print "\nFound " ok " valid calls to dt_probe_error, expected 4";
> > 	    exit 1;
> > 	}
> > 
> > 	print "OK";
> > 	exit 0;
> >       }' D.out
> > 
> > rc=$?
> > 
> > [ $rc -ne 0 ] && cat D.out
> > 
> > rm -rf $DIRNAME
> > 
> > exit $rc
> > 
> > On Thu, Aug 29, 2024 at 11:24:53PM -0400, Kris Van Hees wrote:
> > > How about something a bit simpler like the attached?  We don't really need to
> > > get too specific because as long as the reported PC in the ERROR reporting
> > > matches a dt_probe_error call site, we know that the reported PC is valid.
> > > 
> > > I think that would be sufficient as a test for the arg3 value.
> > > 
> > > On Thu, Aug 29, 2024 at 06:18:19PM -0400, eugene.loh@oracle.com wrote:
> > > > From: Eugene Loh <eugene.loh@oracle.com>
> > > > 
> > > > The ERROR probe's arg3 reports the culprit PC, whose value can vary
> > > > with minor implementation changes.  On the one hand, we do not want
> > > > tests to be overly sensitive to this value.  On the other hand, we
> > > > do want to check the value is correct.
> > > > 
> > > > Therefore:
> > > > 
> > > > *)  Change tests that dump ERROR's args to omit arg3.
> > > > 
> > > > *)  Add a new test that checks that ERROR's arg3 is correct.
> > > > 
> > > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > > > ---
> > > >   test/unittest/error/tst.DTRACEFLT_UNKNOWN.d   |   6 +-
> > > >   test/unittest/error/tst.DTRACEFLT_UNKNOWN.r   |   2 +-
> > > >   .../regression/tst.DTRACEFLT_BADADDR.d_path.d |   8 +-
> > > >   .../regression/tst.DTRACEFLT_BADADDR.d_path.r |   2 +-
> > > >   .../unittest/variables/bvar/tst.arg3-ERROR.sh | 172 ++++++++++++++++++
> > > >   5 files changed, 181 insertions(+), 9 deletions(-)
> > > >   create mode 100755 test/unittest/variables/bvar/tst.arg3-ERROR.sh
> > > > 
> > > > diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
> > > > index 001903ff..bfc77bf5 100644
> > > > --- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
> > > > +++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
> > > > @@ -1,6 +1,6 @@
> > > >   /*
> > > >    * Oracle Linux DTrace.
> > > > - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> > > > + * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
> > > >    * Licensed under the Universal Permissive License v 1.0 as shown at
> > > >    * http://oss.oracle.com/licenses/upl.
> > > >    */
> > > > @@ -19,8 +19,8 @@
> > > >   ERROR
> > > >   {
> > > > -	printf("The arguments are %u %u %u %u %u\n",
> > > > -		arg1, arg2, arg3, arg4, arg5);
> > > > +	printf("The arguments are %u %u PC %u %u\n",
> > > > +		arg1, arg2, arg4, arg5);
> > > >   	printf("The value of arg4 = %u\n", DTRACEFLT_UNKNOWN);
> > > >   	exit(0);
> > > >   }
> > > > diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
> > > > index b11f6c99..3e7caac4 100644
> > > > --- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
> > > > +++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
> > > > @@ -1,4 +1,4 @@
> > > > -The arguments are 2 2 4 1 64
> > > > +The arguments are 2 2 PC 1 64
> > > >   The value of arg4 = 0
> > > >   -- @@stderr --
> > > > diff --git a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
> > > > index c23f9503..ec519f4f 100644
> > > > --- a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
> > > > +++ b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
> > > > @@ -1,10 +1,10 @@
> > > >   /*
> > > >    * Oracle Linux DTrace.
> > > > - * Copyright (c) 2015, 2020, Oracle and/or its affiliates. All rights reserved.
> > > > + * Copyright (c) 2015, 2024, Oracle and/or its affiliates. All rights reserved.
> > > >    * Licensed under the Universal Permissive License v 1.0 as shown at
> > > >    * http://oss.oracle.com/licenses/upl.
> > > >    */
> > > > -/* @@xfail: dtv2 */
> > > > +/* @@xfail: dtv2 d_path */
> > > >   /*
> > > >    * ASSERTION:
> > > > @@ -18,8 +18,7 @@
> > > >   ERROR
> > > >   {
> > > > -	printf("The arguments are %u %u %u %u %u\n",
> > > > -		arg1, arg2, arg3, arg4, arg5);
> > > > +	printf("The arguments are %u %u PC %u %u\n", arg1, arg2, arg4, arg5);
> > > >   	printf("The value of arg4 should be %u\n", DTRACEFLT_BADADDR);
> > > >   	printf("The value of arg5 should be %u\n", 0x18);
> > > >   	exit(0);
> > > > @@ -29,4 +28,5 @@ BEGIN
> > > >   {
> > > >   	d = d_path((struct path *)0x18);
> > > >   	trace(d);
> > > > +	exit(1);
> > > >   }
> > > > diff --git a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
> > > > index 8c601a43..be1f6d5b 100644
> > > > --- a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
> > > > +++ b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
> > > > @@ -1,4 +1,4 @@
> > > > -The arguments are 2 1 28 1 24
> > > > +The arguments are 2 1 PC 1 24
> > > >   The value of arg4 should be 1
> > > >   The value of arg5 should be 24
> > > > diff --git a/test/unittest/variables/bvar/tst.arg3-ERROR.sh b/test/unittest/variables/bvar/tst.arg3-ERROR.sh
> > > > new file mode 100755
> > > > index 00000000..4b139be2
> > > > --- /dev/null
> > > > +++ b/test/unittest/variables/bvar/tst.arg3-ERROR.sh
> > > > @@ -0,0 +1,172 @@
> > > > +#!/bin/bash
> > > > +#
> > > > +# Oracle Linux DTrace.
> > > > +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> > > > +# Licensed under the Universal Permissive License v 1.0 as shown at
> > > > +# http://oss.oracle.com/licenses/upl.
> > > > +#
> > > > +
> > > > +##
> > > > +# ASSERTION: The 'arg3' variable in the ERROR probe is correct.
> > > > +#
> > > > +# SECTION: Variables/Built-in Variables/arg3
> > > > +##
> > > > +
> > > > +dtrace=$1
> > > > +
> > > > +DIRNAME="$tmpdir/arg3-ERROR.$$.$RANDOM"
> > > > +mkdir -p $DIRNAME
> > > > +cd $DIRNAME
> > > > +
> > > > +function dump_files {
> > > > +	for x in $*; do
> > > > +		echo ==== $x
> > > > +		cat $x
> > > > +	done
> > > > +}
> > > > +
> > > > +# Run DTrace, also collecting disassembly.
> > > > +
> > > > +$dtrace $dt_flags -o D.out -xdisasm=8 -S -qn '
> > > > +BEGIN				/* dt_clause_0 */
> > > > +{
> > > > +	nerrs = 0;
> > > > +}
> > > > +
> > > > +BEGIN				/* dt_clause_1 */
> > > > +{
> > > > +	x = (int *)64;
> > > > +	y = *x;
> > > > +	trace(y);
> > > > +}
> > > > +
> > > > +BEGIN				/* dt_clause_2 */
> > > > +{
> > > > +	x = (int *)64;
> > > > +	y = *x;
> > > > +	trace(y);
> > > > +}
> > > > +
> > > > +BEGIN				/* dt_clause_3 */
> > > > +{
> > > > +	x = (int *)64;
> > > > +	y = *x;
> > > > +	trace(y);
> > > > +}
> > > > +
> > > > +BEGIN				/* dt_clause_4 */
> > > > +{
> > > > +	x = (int *)64;
> > > > +	y = *x;
> > > > +	trace(y);
> > > > +}
> > > > +
> > > > +BEGIN				/* dt_clause_5 */
> > > > +{
> > > > +	exit(0);
> > > > +}
> > > > +
> > > > +ERROR
> > > > +{
> > > > +	/* Report the problematic PC and continue execution. */
> > > > +	printf("Error %d at %x\n", ++nerrs, arg3);
> > > > +}
> > > > +' >& disasm.out
> > > > +if [ $? -ne 0 ]; then
> > > > +	echo DTrace failure
> > > > +	dump_files disasm.out
> > > > +	exit 1
> > > > +fi
> > > > +
> > > > +# Parse the disassembly for start PCs for the dt_clause_n.
> > > > +
> > > > +awk '
> > > > +BEGIN { phase = 0 }
> > > > +
> > > > +# Look for disassembly of dtrace:::BEGIN.
> > > > +phase == 0 && /^Disassembly of final program dtrace:::BEGIN:$/ { phase = 1; next }
> > > > +phase == 0 { next }
> > > > +
> > > > +# Look for a blank line, denoting the start of the variable table.
> > > > +phase == 1 && NF == 0 { phase = 2; next }
> > > > +phase == 1 { next }
> > > > +
> > > > +# Look for a blank line, denoting the start of the BPF relocations.
> > > > +phase == 2 && NF == 0 { phase = 3; next }
> > > > +phase == 2 { next }
> > > > +
> > > > +# Report PC for each "dt_clause_n" (or a blank line to finish).
> > > > +phase == 3 && /dt_clause_/ { print $3, $4; next }
> > > > +phase == 3 && NF == 0 { exit(0) }
> > > > +phase == 3 { next }
> > > > +' disasm.out > dt_clause_start_pcs.txt
> > > > +if [ $? -ne 0 ]; then
> > > > +	echo ERROR: awk
> > > > +	dump_files disasm.out dt_clause_start_pcs.txt
> > > > +	exit 1
> > > > +fi
> > > > +
> > > > +# Confirm that we found expected clauses 0-5.
> > > > +
> > > > +for n in 0 1 2 3 4 5; do
> > > > +	echo dt_clause_$n >> dt_clause_start_pcs.txt.check
> > > > +done
> > > > +if ! awk '{print $2}' dt_clause_start_pcs.txt | diff - dt_clause_start_pcs.txt.check; then
> > > > +	echo ERROR: did not find expected dt_clause_n
> > > > +	dump_files disasm.out dt_clause_start_pcs.txt
> > > > +fi
> > > > +
> > > > +# Dump the error PCs to a file.
> > > > +#
> > > > +# BEGIN has 6 clauses (0-5), but 1-4 have the problematic instructions
> > > > +# we are looking for: "y = *x".  Each time, we check if address x is 0,
> > > > +# calling dt_probe_error() if necessary.  Then we try to dereference x,
> > > > +# again calling dt_probe_error() if necessary.  Since x==64, the second
> > > > +# dt_probe_error() is the problematic one.  We look for those calls.
> > > > +for n in 1 2 3 4; do
> > > > +	# For dt_clause_$n, find the starting PC.
> > > > +	pc=`awk '$2 == "dt_clause_'$n'" { print $1 }' dt_clause_start_pcs.txt`
> > > > +
> > > > +	# Look for the starting PC and then the second dt_probe_error().
> > > > +	awk '
> > > > +	BEGIN { phase = 0 }
> > > > +
> > > > +	# Look for disassembly of dtrace:::BEGIN.
> > > > +	phase == 0 && /^Disassembly of final program dtrace:::BEGIN:$/ { phase = 1; next }
> > > > +	phase == 0 { next }
> > > > +
> > > > +	# Look for the start PC of dt_clause_n.
> > > > +	phase == 1 && ($1 + 0) == '$pc' { phase = 2; next }
> > > > +	phase == 1 { next }
> > > > +
> > > > +	# Look for the first dt_probe_error() call.
> > > > +	phase == 2 && /dt_probe_error/ { phase = 3; next }
> > > > +	phase == 2 { next }
> > > > +
> > > > +	# Look for the second dt_probe_error() call, reporting the PC and quitting.
> > > > +	phase == 3 && /dt_probe_error/ { print $1 + 0; exit(0) }
> > > > +	phase == 3 { next }
> > > > +	' disasm.out >> err_pcs.txt
> > > > +done
> > > > +
> > > > +# Do a sanity check on DTrace's error output.
> > > > +
> > > > +awk '/^dtrace: error on enabled probe ID [0-9]* \(ID 1: dtrace:::BEGIN): invalid address \(0x40) in action #[0-9] at BPF pc [0-9]*$/ { print $NF }' \
> > > > +  disasm.out > err_pcs.txt.chk1
> > > > +if ! diff -q err_pcs.txt err_pcs.txt.chk1; then
> > > > +	echo ERROR: problem with DTrace error output
> > > > +	dump_files disasm.out err_pcs.txt err_pcs.txt.chk1
> > > > +	exit 1
> > > > +fi
> > > > +
> > > > +# Check the D script output... the arg3 values reported by the dtrace:::ERROR probe.
> > > > +
> > > > +if ! awk 'NF != 0 { print strtonum("0x"$NF) }' D.out | diff -q - err_pcs.txt; then
> > > > +	echo ERROR: D script output looks wrong
> > > > +	dump_files D.out err_pcs.txt
> > > > +	exit 1
> > > > +fi
> > > > +
> > > > +echo success
> > > > +
> > > > +exit 0
> > > > -- 
> > > > 2.43.5
> > > > 
