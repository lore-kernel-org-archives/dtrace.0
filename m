Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937581D2796
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730150430; cv=fail; b=sTYjIeFCCWls94EiQXW9rbEOh9C6xnZIDCcy6MZKZEcklUPVsWGnWfNI3Mn1kM7M3yW21CYfoMgMfj7ddg+dNSlT0pxpjxpMCGmXd7o/vbGoHhjbTuG3CPQAZgvvraXKKyy0emDsEi6I8C0MrMvdPb1W3rixUmy3HEyZdTgRKAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730150430; c=relaxed/simple;
	bh=N95hUFRnZP2Svcaq3snm6dd9Ec5T65sYviiMM0om1Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eVykdTXMaN2cZHE6sdHHFU/WMgoEUORcXN7wpFTKto6H0xiH6EX/G0qNuyV/vPdU7UirYZ6+yo9tyju6ISw0PT8ye//J1k60noS9gHO+3jMbay6hiXzhkbUxAGkfRGZVi8Z2iBtuNg7aPKf/1J855q3HDBra93aGHxsEGqfP1MM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gmt7tQ/I; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=M2ecozL5; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gmt7tQ/I";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="M2ecozL5"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKtYuF010202
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=aEyFi1ydnrmhFyXCKd
	GAKZpas2v/coDUuJvuwViXyX4=; b=gmt7tQ/IpkA6C/HA9pwClioFkIS6DR9et3
	N/5+EFMVut+G+HsyYJXt0BSk37/K6PHsc9q0/vHmVFI7B5EtxRXlqzFy0CcFMTHF
	8hTVtZpykSLdJRljUx0NdZiOOpGmen9PfFT3KX3x0iqZ1UndRbYhvrcrjZcXcaw+
	/hUz+OB722I7Zmp00to2ttQYczOvvhQL+ir22aewBRUJpp1fjOUcbGfeBXVO6q8z
	Nd1Ae/Dww0MHuRibXoyi22gAv9SCHKeotPY+yQ3F4zNze4IW+ExoEPjupkE2LzeT
	YHdsm7tO4eoam2bNZE5CTz6Sir8xPzh90fVYOJrw68fh875elgqA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grgmc13s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:20:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKdgLs040628
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:20:25 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hnan38y7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:20:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chv4e9cWAI47aLyqbrBDtdAWjHG2TmLUj+ekJn+7oumVwtGaRnyQGj7ZfYXd2lV/kOtqt792FmSryAWeUf0bFSsPCWoape/II3bQYzOkO3J70rGtWlj8IbjXmx8HHtRiwdWIyUP01zP3ryl1HZxn2jrPBqBe0GWhsYiyPp9ZxPhavTii8Mhpe/Z2EG9vQ/EUoT61USrvCeJOjeVTT1QSGwZR2BWRurITSkxWz6SFkZGvVVzoY3WHIFSnLFTiKKn1qeadBAQLe1tEfDiNFu/Y0QgFEBKnM49Ga6tJUbyN1YrCcXTdFOCHZb07XMs2AR0TwvBvl2D6AVJ7ueSAduLeVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aEyFi1ydnrmhFyXCKdGAKZpas2v/coDUuJvuwViXyX4=;
 b=RmCuqYdmjVrUowOyUXBVAnWtPgRdiYhOJR1JplAaShgyTmTvsZgE0qcriM7unIpzwvG5iCYEABA4fEe0hcJ3akzb493CeyS6BsDFM8hRjuA7elv2pfPsc8LR3i7HTnl2kQDp4PAooULPxTShqwyABHfl17QWLVBogxLtoc7PUxjqw1GUbq6u3TwZtqxpLOfMZkdgaLDcLbIRrx5XAIx7zqcZMjofru/kQHHsToAkcS8g6h+z6HZldvshxqZMIxmVlJT9iAgVx+QWHl2ZWK/07151dBn//LSCDPzhR6Wu/YDhVW16bNZy798P+WnG6GHd8mhFes1BQuPBTYKFqoyZnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEyFi1ydnrmhFyXCKdGAKZpas2v/coDUuJvuwViXyX4=;
 b=M2ecozL5NgvbkYysndNLaA/+y6itu0BixI7+oNT7ru47CD0hmmEI1n2/KnUoVVjsfnGAwPA2vkt32UqsFDN6WXwzucIYwytsGCA4qMFDygJuomAN6oDxMEwMlumkHMNut3IJ9jYPg/5esgRAarMQvci+Gjh72CKzcQACngJDEZo=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by PH7PR10MB6201.namprd10.prod.outlook.com (2603:10b6:510:1f3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 21:20:20 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 21:20:20 +0000
Date: Mon, 28 Oct 2024 17:20:17 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 4/6] cg: add argument remapping in the trampoline
Message-ID: <ZyAAEZHifwPu/1vg@oracle.com>
References: <20241018195808.270688-1-nick.alcock@oracle.com>
 <20241018195808.270688-5-nick.alcock@oracle.com>
 <ZxfkWjbS1c0vXLvn@oracle.com>
 <87plnorxat.fsf@esperi.org.uk>
 <ZxvuWjuWbfweZmgj@oracle.com>
 <87r080oru9.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r080oru9.fsf@esperi.org.uk>
X-ClientProxiedBy: SJ0PR03CA0200.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::25) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|PH7PR10MB6201:EE_
X-MS-Office365-Filtering-Correlation-Id: be92b34d-fc39-4f37-1817-08dcf79653af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Dlos2bpQuC/JQdBxJKDOh0vq88dhs4+fkbjJeNutoleLSzD38xH/5anfeJJO?=
 =?us-ascii?Q?myMyfbygnmsSBzDqjNWrDiCkJmTW86T3KPn3Kn9Q9d24ln4uaw1vL35J9ej/?=
 =?us-ascii?Q?8JNb/mXytgwfdCxEQJin5sdirct/PiWWMZKPlVSxXApT+UzQo/AToAKqrYs6?=
 =?us-ascii?Q?gEfMB25YiN+kS/wGMDCKKsL7JajxA0YnlSPWiLYELWEf+5Rh02Ov8+jnN/ze?=
 =?us-ascii?Q?GtttHzVp1EhUvsKHwKmCt2HbaFOv1+VU6UhkBPiJft5B3Lafb5CVnAqMhgf+?=
 =?us-ascii?Q?dvRIJmHACLPTMjFB4kvrLaBLb402nrcJA8HyAqQkkU1qYUCvcHRuw69oCZ2E?=
 =?us-ascii?Q?5dPOr1hK5d42RslQ5Jku6Z7L9vOhfj4u4MDp7DGJvB7ijEQ9iNcugdNFWzXU?=
 =?us-ascii?Q?uamVngumRzF71qKDFTLe7cR3KxeSNThoWGR6kSq/KLCNK9fDbm91D0OQhRUb?=
 =?us-ascii?Q?Bh3WNR0d5KjjKaMZshVsWO3lpyxH5vVbnU49SyyZpfoBLSPBCi0BGNupgiYm?=
 =?us-ascii?Q?P8EhvoXw/3BB6x7+18RKRlqEna2zW1E67J3iylRq5s+9oL1/Hva4hJSm1lYS?=
 =?us-ascii?Q?hI+5SsZCS1Lfv0p8BwLtTriI/UeHE4UlvuVbAHwBZxqOjIE9ck38Ji65XuFV?=
 =?us-ascii?Q?e/Qx/i2+qmPtv7oK2pB2D5y3MWTr79iY1JqT/LCwVw4rBQYqT4v7JMQV/qBE?=
 =?us-ascii?Q?bKF4Tubq43VIniXhcRMvAemSkqx6CbMMndPCQaS2n84zhIl3mITBkleIcXPC?=
 =?us-ascii?Q?cGFusFI50n0cLVe03BtVy+MxPIbHg9QzKEm04xbq31eTiHzIGGJJSxys/+5j?=
 =?us-ascii?Q?wG5THJdtcUeFYd5hFDT8dAh60NqDP0/lPMhCDnC3Lsi2pT6CmaDqE66jSYEY?=
 =?us-ascii?Q?7oRNCxuhIcLHHxQkrxn0hKsiuuDKeUQHLc1dNw0aShvnIqni1jXR6zZrJn+F?=
 =?us-ascii?Q?GRrI2VNs7Lnp0SgdBeX3+TvjwmQp3lpBzYsMuEXyOYCqCGgwXsxrRKyIxk26?=
 =?us-ascii?Q?KQHDv1aXqHXkW224+gTlS18MLhWNj6JkSH3ERO0l7p5LsKCRPErew8lC3vvU?=
 =?us-ascii?Q?KW3hq6tJs2J+uxdIa+eqbhtWoGot7UydmoIMfzghl0VdRsTzr+tiXMCsZFyu?=
 =?us-ascii?Q?8s3Lv9vPze6d4oCT41CEojoc21Effhy8Cm79VLH+25lEIoMT0fwvt/lCJACq?=
 =?us-ascii?Q?+P9f51PW1YIMdsQpVHk/RFWTMzkCBAzDLZl4uL1gqeGNGhROkSKR35Uxxnf6?=
 =?us-ascii?Q?x7a2mbWx0IWPBTIl/wIEPucKZG7Szzk4RyBUdM/CQqQ3Fx5AmUWK/fcYShDV?=
 =?us-ascii?Q?L/2++VJP6jjCxSO66Qpx6vo3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HBt6KPAUQCf+rDreyLCYjykDrhtoyfHlsledPFa0LAfcgtpz8/vNHAy2NRSW?=
 =?us-ascii?Q?Kdmr/AJoW27AdkymXZUPSrQNjKoSyCh/ApfbWsy4Z2jEtm0Wyhx+ROiQrUkB?=
 =?us-ascii?Q?fibPLRpWNFwzBG4dgMlm6dQ+Q+sJ/dT8TsQ7MA0BzfjgY+bvpPwQB+mj5NP+?=
 =?us-ascii?Q?bLGZzt6EZkSp0wfEypy46+C7yNrzpzaz3VTXuTl3pnuOSSOANMJNzkwmkQzf?=
 =?us-ascii?Q?jb3RFydiZRNAn098sM5WIdGfyZysk1MpoKPoCQuL6QAmJXz/pBGPUd+Fa8AB?=
 =?us-ascii?Q?xCjoBpzVYDoMsTCmp3bGGIJgh/BQo5J9nZkC4kKTSQm6khn4gBdoG65hn8v1?=
 =?us-ascii?Q?y6O+8t0fs9caNb9bOjctaa+16H2TY79G1hx/OegXOUYH/2K826tv05LTk5Mr?=
 =?us-ascii?Q?vbnI8bblqe3fisNtlODgc+cbDIYUK6NbhdMsN5SdOQZe34zgIpn9py8Oqe/o?=
 =?us-ascii?Q?O7ArrLu1fZK+xARdu3e3II/N9CdHY1iDUqFfDVsG0bgeLetCuy8mZ7CrLtQ7?=
 =?us-ascii?Q?fVPNiewIIbIAz1I+UCLWdNut7EnYeYmbc5hUod6Kla+equoVFpoZc+u4SfPD?=
 =?us-ascii?Q?qalMU60hNTmL/3mAfJyGhCDdI6c453LQEfY2lQtRRfs08QKhW4pJP7mo8F8Z?=
 =?us-ascii?Q?uO0ntpacvdlmmaijjdGWeJAwB2YmJbqzXYpyfHmQsW47QDqytTFVlXG4vjQZ?=
 =?us-ascii?Q?YrGQQYhUW92dy0ILFN8fMJ/endxAYuTCD7FRnWA1V9CXXHURau3+26T3qwmG?=
 =?us-ascii?Q?P1LrJVAfP+O0SWEgckQ4w7K9gFhlcqmtacsgxK8yAi8u+AaL8ktIa1DstSAq?=
 =?us-ascii?Q?iZgzbS8f2cd8zuSqJxQDpSO8UkhUfh9EZVSlyRq+yUlGfiQVNqkXn3QyyEyV?=
 =?us-ascii?Q?Rm3HxRTSlgbpKp1z153jbuGpFWjZ/TBsG9Ql3ecnMi1G0VIiMAIAdvx4m+0+?=
 =?us-ascii?Q?XLNMJ4pJxd2O9/zLFB/tSnfFkwVwUm0LmY4JimN0dvP/+51f7r/3qYJOHnU0?=
 =?us-ascii?Q?D5Mf2VnwV/j4Kdy828kXXpMsLSIfgvh1G9qW1iq3JvDu/BQDTwfyefqoMbwh?=
 =?us-ascii?Q?njMzQ+BNYWUJxJvV7uTNX2UV9O1Ns4KeBPnioN3WAAqlzaH9rK9i2J9Kt+Ol?=
 =?us-ascii?Q?ZclZxPB1gJkpfd9Ou9ESdljRSlHwOjT1Ltf9KtlNrl2OKPWqYkV/Qbx9C+lq?=
 =?us-ascii?Q?zSl/MoOdVdwCEmCrr0BurHWz3wYmf1eMjDsaeQplBShh1fwazbDn8klqnCEy?=
 =?us-ascii?Q?pI+CsdRegWrAy+GDYm00e+lJQrCAUq/VTQaBA/Y1HVs8WLgLRya4K/zARuyn?=
 =?us-ascii?Q?Vih55D7NUfUL7AQknZLplS7zJNiMPgQlwjkGUwruwo0OgAOLo5gCGVvk9am1?=
 =?us-ascii?Q?QylY+uVmfj0cvHaC48BPseHFm0KZiIhWC27RnH/R0GPnhG41Jo5P00kBfkbn?=
 =?us-ascii?Q?mrloSBEtrNu0Z+A+OA0ECtljS+OgGk7PsQt1UlqSrhe2PRenmFIXvXzeNiU6?=
 =?us-ascii?Q?/R5Ltl6Szza0xWaCphPhr7c2ZtAxiy3HZPaOtbKsA0NUFts0xtLkhTqBZYL8?=
 =?us-ascii?Q?7/+RZTA7ry5Os2fTyvfmBw0NLteEEoX3Ad2l80ta8t5rehQ7ti/i/E3085ri?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8KaQwZK4eoNCE6Nff8kR3Q2gQyn2FOqts2+czG8Ql5RlIW3g6LfppDFDikVy90SQfj434d+CNcE31y9k07BHwunSctBtH4r/FHvukXBVDlNWgXAflUWVzmZBlOrLVidHaz6+J1HY3MQWsELVd4BTf/9QJD/pa+Digbkt38GY8RxZg58d2Eze5yGjtZ4JcGjAwu7/TvTeKEPDMT+m3AAsGbYHT04rZ0E3/U7pldH/SQK5lCvv+SEVwiiuudNpfJJX/BtKHAiGMNH001inkCU4GZxzxMMefo8+WfG/DdhsXnp1wnGAw8mxl8P6OTt6nKfClWi3rRy1BDRAx2oe9qfB+bSBw02tSIPxda0dsqhnNtjWoczCTOAPtiPq+c2+9lvCz2JaDURSCG3bzU4PA/gndYaoMYAoBqlI1bxysbAYgYAkp1EBarpP1IFxRYsja/d1VEtJaQkMmQWWgF2H4EZOBadcpKyaZyyy3ZXpw8BqgB1Ly37i26XJLoAzy4YaM7qqbjXQMh6/avAfuMlSt18BWgOhE+haMvYmna82rkFWRLxdmn/7zNGTn5QzXgOO39IaJbsiyZ1uLGK3gJWM6U6yv9nAlgz90GVuNjIlqMY0wgk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be92b34d-fc39-4f37-1817-08dcf79653af
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 21:20:20.2577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r/LbZonk4BPCVl1DUMLN0qpg5oEj/Clr5UNAOSTlZQCTiA2Rn9U4V+I1jVUXVyusPhH9sOT8ozF8n9orGnQfZafKBzMJqzNi5H3hDu4cRrw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6201
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_10,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280165
X-Proofpoint-GUID: 1oWR1cm3utb0JbzhTu9tr5klTL6t2kqS
X-Proofpoint-ORIG-GUID: 1oWR1cm3utb0JbzhTu9tr5klTL6t2kqS

Concerning the mapping in the trampoline - yes, as I said before, I believe
the caller (the trampoline) should save the reg, and then the
dt_cg_tramp_map_args() function can use those saved copies to do the mapping.

As I said... caller should save.  I see no reason why dt_cg_tramp_map_args()
cannot depend on that.  You can add a comment before it saying that this is
expected.

On Mon, Oct 28, 2024 at 09:11:42PM +0000, Nick Alcock wrote:
> On 25 Oct 2024, Kris Van Hees verbalised:
> > On Fri, Oct 25, 2024 at 04:56:26PM +0100, Nick Alcock wrote:
> >> > I also disagree that the function performs the saving of arguments itself.
> >> > I think that the caller ought to take care of that, because the caller has a
> >> > much better idea about when/if to save arguments, and when/if to restore them.
> >> 
> >> Well, the reshuffling is *done* by saving arguments and then copying
> >> them out of the saved orig_arg area into the args area, so either it
> >> does the saving itself, or it silently malfunctions if the caller
> >> doesn't save, or it reimplements all the saving infrastructure for no
> >> other reason than to use a *different name* so the caller can save.
> >> 
> >> The latter two options seem, well, entirely terrible, so I went the
> >> former route.
> >
> > The way this has been implemented already for SDT and the design behind that
> > is that the underlying probe saves arguments before overlying probes do
> > anything with them.  The reshuffling is only one of the things that might
> > get done to arguments, and since there may be multiple overlying probes that
> > have different arguments, the caller needs to preserve the arguments it was
> > given in case any of the overlying ones changes them.
> 
> ... that doesn't help me figure out what you want me to do. Can I save
> the args and then pick them out in a reshuffled fashion, or what? I'm
> trying to avoid having to write some sort of nightmarish in-place
> shuffler in raw BPF here, because I'm fairly sure doing so would drive
> me quite mad and take forever. Saving all the args and picking them out
> in the reshuffled order is only a couple of lines. (See below.)
> 
> I still have no idea what's wrong with saving the args in
> dt_cg_tramp_remap_args(): it will only cause trouble if something else
> has saved the args before trampoline() is called, then modified them,
> then expects to restore the originals after the trampoline(). Surely
> nothing does that?
> 
> >> >> The remapping info is still propagated up out of per-provider state so that
> >> >> the parser can use it to tell what types the remapped arguments are and
> >> >> to apply array-op remapping: users of dt_cg_tramp_remap_args() should set
> >> >> the probe remapping to 1:1 and shuffle the native types correspondingly,
> >> >> to match what dt_cg_tramp_remap_args() has done (in effect, calling it has
> >> >> moved the native types around).
> >> >
> >> > I would drop this paragraph.  It is unnecessary and speculative at best about
> >> > what other code should or should not do.
> >> 
> >> Hardly. It's documentation about how other code can get the arg types
> >> right if they are using dt_cg_tramp_remap_args(). Would you prefer I
> >> leave this entirely undescribed?! I could put it in a comment above
> >> dt_cg_tramp_remap_args() (or rather the renamed dt_cg_tramp_map_args())
> >> instead.
> >> 
> >> (Shifted into a comment, for now.)
> >
> > But that is not relevant to this patch, and other code shouldn't be doing this
> > because it is almost certainly wrong that USDT is remapping the arguments in
> > the trampoline because of the argN vs args[N] thng discussed above.
> > 
> > So, let's not add comments or commit message info that might point people to
> > do the wrong thing.
> 
> It's correct *iff* you're using the in-trampoline remapping (the comment
> is above dt_cg_tramp_remap_args). Obviously if we end up removing that
> function, we'll remove the comment too :)
> 
> >> Can we guarantee that trampoline() is only ever invoked once, and that
> >> it's invoked after probe_info is called? If it changes the remapping
> >> array, any subsequent invocation will do the wrong thing. If it's
> >> invoked before probe_info, it becomes impossible for probe_info to
> >> adjust the xlated types appropriately.
> >> 
> >> This all seems like way too much coupling to me. At least done
> >> this way trampoline() is idempotent and doesn't depend on being called
> >> in the right (undocumented) order wrt probe_info.
> >
> > If the actual probe arguments (argN) are being reshuffled (which is what you
> > are doing by shuffling the arguments in the trampoline), then the mapping
> > needs to be updated to become an identity mapping i -> i).
> 
> Yes, the code does exactly that, in probe_info.
> 
> I don't know the relative ordering of the calls to probe_info() versus
> trampoline(), but when probe_info() is called the mapping *must* be
> fixed up, because it's probe_info()s caller that stashes it away -- so
> it's safest to set up that revised mapping there. If I set it up in
> trampoline(), I have no idea whether we'd reliably have the remapping
> worked out by the time probe_info() is called or not. Yes, this means
> there is an implied coupling between trampoline() calling
> dt_cg_tramp_remap_args() and between probe_info() having to change the
> mapping in the args -- but given that you've been suggesting similar
> coupling between parts of *dt_pid* and dt_prov_uprobe, I was assuming
> you'd find such a minor coupling (between, really, trampoline() and
> probe_info() in dt_prov_uprobe) uncontroversial.
> 
> >                                                             Otherwise there
> > could be other code at some point that tries to apply the argument mapping
> > and that would be really bad.
> 
> Well, yes. Is there anything anywhere that documents the order in which
> the dt_provimpl_t callbacks are called? They're invoked from all over
> the place and their call order is distinctly obscure, and deciding
> whether it's safe to play with DTrace-side arg mapping info from
> trampoline() is core to that. (As opposed to merely *generating code*
> that shuffles args. That can obviously be done at any time.)
> 
> >> (Or are you suggesting that dt_cg_tramp_map_args(), or its trampoline()
> >> caller, shuffle the xargs too?! This seems even *further* from anything
> >> a trampoline() function should do to me.)
> >
> > Why would xargs ever be shuffled?  There is nothing in DTrace that does that.
> 
> Good. I thought you were suggesting it, and was rather confused.
> 
> >> >> + * arguments are overwritten (but saved).
> >> >
> >> > Caller should save.
> >> 
> >> As far as I can see this is not implementable without massive disruptive
> >> ugly (or at least pointlessly duplicative) changes, see above. It
> >> doesn't seem to buy us anything, either.
> >
> > How so?  Just put the dt_cg_tramp_save_args() call in the trampoline right
> > before you call dt_cg_tramp_map_args().  How is that a massive disruptive ugly
> > change?
> 
> Here's the code again:
> 
> 	/*
> 	 * Work from saved args so we don't need to worry about overwriting regs
> 	 * we're about to remap.
> 	 */
> 	dt_cg_tramp_save_args(pcb);
> 
> 	for (i = 0; i < nmappings; i++) {
> 		if (mappings[i] != i) {
> 			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ORIG_ARG(mappings[i])));
> 			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
> 		}
> 	}
> 
> i.e. it's *using* the save area. It relies on the args being saved in
> it. Either it does so itself, or it silently relies on callers doing it
> (! ew), or you're asking me to *not use* the save area but instead
> implement arg mapping in some other way (and this is what I thought you
> were asking for, because having dt_cg_tramp_map_args() not save the args
> but nonetheless rely on something else having saved them already is
> horrible, surely you don't mean that).
> 
> At this point I have no idea if you want me to reimplement this in terms
> of something else, add *another* saved arg area just for the sake of arg
> mapping, implement some completely different sort of arg mapping
> algorithm in raw BPF (no thank you), or what.
> 
> >> >> +			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ORIG_ARG(remappings[i])));
> >> >> +			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
> >> >
> >> > I would add:
> >> > 			argmap[i] = i;
> >> > to convert the mapping into a pure i -> i mapping, so no other code will apply
> >> > argument mapping again.
> >> 
> >> I think not: see above.
> >
> > I think so, above also :)
> 
> See above: I have no idea if this is even slightly safe, because I don't
> know the relative order in which trampoline and arg_info are called. I
> at least know what I'm doing now works.
> 
> -- 
> NULL && (void)
