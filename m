Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3697019FA93
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826414; cv=fail; b=qH/uj4fxdgIW1ieFW/dZHAgrSryJnih8qs1XAsYWYYwH4Q8glJ8Go+FQTLC964y1kh5hPJinZx4/e1GxIDVjpnOXldrlX0MYH30VwTmWZXwH8z0+LfaZZnzj1crO/3tLWwzY5/Hx6sdPEazeongAmh2yJDwM1pVl2OZiwkd9wq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826414; c=relaxed/simple;
	bh=0GNF0xcmfPb32q2yl5VTN7QHLvCTPQ/WITHSm2arxok=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=OyVhvZkzhLhtkuKQj/DjskiEiUaWF2pG2vQBX/b5bwWG1vp/UUWEAndDfENw2oEojPxZCUtXJm9Ob60rU/vKmclwVdleN7XWY9pgif+JbYsP2loy+hfGrxJ0KqBqw7laVHl7reT2IELREqA3VDp7vr7cHnPSzW50KWZ5RH6XpOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kWgeHxVV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GPxr64UB; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kWgeHxVV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GPxr64UB"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DCte3E001687
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ukjuitXC2C6fnF1N19
	j1uyNEFd1rpZNz27T04PMkpno=; b=kWgeHxVVZD6z8tvAV6NYCTweSVo77D6ObH
	Jya+q6tlPi4txpAvB0cnLihEiXtkSXoeRyI4k1+HbMafTeZoNhi6gbCyR0E9RA5C
	v6qyjviGjHpg0nWwdKy4552j89dKhGkB3n8XqZpIzkL8Iz/SIP3iepH9hyJOsUcf
	y2JuIjFi4vs8NDgY5mki90P76APAKJIvC4LxXSUgMp0jdakgmWA9ki/ecUIk6xbQ
	HtQwpZeu803lxBOx6d8E7rCX0YLjuohBILdIZf6U4vUua4CScAGJ4XtbiS+ZHCo/
	gNKZOUfqe9Dq2euW6MzzpwEbeMx2hccIaEH49uYUgZ3mMuuOg5RQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c14kqxp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:53:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55DEY20v009247
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:53:29 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvdqhpf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:53:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ue1MI8G2hoIg6hi5OQtSj1U3xga19JFq2JldOvLq5cmXCj8UpkBYf3bhNWPpBYgN/Nr4FTxJktbIY6thj2ay5G/9VlSec6cQ06TPvZn6VIa4kpJjkxR+FhLKaYzNRtqXbaTsNUkHN/83u5l02Dd1b9iiWfrtFpIkIgjcvZ5xQhR8fkaKnfVnJnBXWlc7G0HyNjh4hQo4R+PZDtPOaaZqeDTzhJsbGep/CcLa8NQVhzR3wR+cyf7Td2CKxl7bhqsr+R+1URg+Vp7e2D+dZZekeNlCqhtrllDieE6vvCCK7z6meZdNvMLqD0EbTIrQj5G0Xywcy59+OAZTU7C6+9ALtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukjuitXC2C6fnF1N19j1uyNEFd1rpZNz27T04PMkpno=;
 b=xMs/ZOYxtZbx+cbkrN3UxBe5kK8tutu7TYVthDA+JGPSpeUzze/a+dPCHp2XwKgelsSWviIlbq57P/KelPEDRTRydwRDS7cB4TkCIYVooddkMb/pNHp1qNzvAKhU7vEUZg8HAe/7RtYG+al6eX5Tg2tnmY35cXwk6WqyxLsjLPatTuHRFLAkRgXCQ0wcWS7GZmyM+8qqlu9xqf3gKnLHFyxY7pH5tjEWLqwjGJWmt5mmr71D60+mhwI4yFATOyDl4rolr2q1vLd25ihI11dUfRY8xMxeZQof02FsWZaxVYUVKYY/A0ZrxTlLfJuSKSVvUxAifIZFSAQUyF1/NxE+nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukjuitXC2C6fnF1N19j1uyNEFd1rpZNz27T04PMkpno=;
 b=GPxr64UB2kPoPRcgPlIKpIx1tOeuBwtHP1Y89A4eqGCrDmERM3qNUGGzkpmXcgjPju5jj3CR89xYMzB1sFJL9kREuzBe9jyDfaOpA9/nsEZ4yOuJAFDlVUY6zfZvT9uM2IrKjRoBRpbzd7BzTcoQrGZykNLTmfU1UXDy5991Kxk=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by BY5PR10MB4179.namprd10.prod.outlook.com (2603:10b6:a03:206::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Fri, 13 Jun
 2025 14:53:19 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 14:53:19 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 11/14] Test: caller and stackdepth tests for proc provider
References: <20250522180118.27343-1-eugene.loh@oracle.com>
	<20250522180118.27343-11-eugene.loh@oracle.com>
Emacs: Lovecraft was an optimist.
Date: Fri, 13 Jun 2025 15:53:16 +0100
In-Reply-To: <20250522180118.27343-11-eugene.loh@oracle.com> (eugene loh's
	message of "Thu, 22 May 2025 14:01:15 -0400")
Message-ID: <87ikkzbsmb.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0089.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::22) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|BY5PR10MB4179:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a04d57d-dd5d-4265-e3e6-08ddaa8a0918
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qIageZmpX7p6DW48FgTYEA4SX8ohG76d7hKR9Eg/bOwnC6/397lVLSqiQXqK?=
 =?us-ascii?Q?mmRRHVrjNBNID/RBamxetxef4LSzOdcVzY3KbptviX2Nt5FnWrG+fcA6VD70?=
 =?us-ascii?Q?/w33R8qEQ8GduacKTwqlSiLHIb+sIWXHUOLKvcMcrqV7S468z+js29rXj7lg?=
 =?us-ascii?Q?axvWgqvjI8eqWK7A70QJcIZJave6Z9lwq9jh/9VE9IndtJ/BSGbArlPyN2i7?=
 =?us-ascii?Q?6kJ6mHgPOdP5duDPWcDeW3iW2Zgdb3toLDPgvrb3tlSm8RGxyp9Dxw8uiOuL?=
 =?us-ascii?Q?N3WXfR/BZCNl0YgBUIW4grJD4ywocknMo+ByKy3G0k1vyjuFUxohiK3uV74r?=
 =?us-ascii?Q?b2fx2rLI/bZe8gHOECYfu7KBD5aJ4J1Hp5b6LnMGw99VbCfrITkfNqfUJ4TQ?=
 =?us-ascii?Q?4rLcErMudsaL63Ul+EWYKsEmLyubhZl8QRtIK6qQZsr1q3LZbKwoGxDkzNgR?=
 =?us-ascii?Q?V4SAkiGYGqc/vsy4FEkYYr3xks2vwiHM7LVJJCUQK5XtoUXnsQDzdcB0W5Qm?=
 =?us-ascii?Q?MqcMQ/LzAq89GqVID7xuTy+KikOiidza1T6Avj7gJH15AR7igXT8azKn3JyA?=
 =?us-ascii?Q?zsOEJNsU8i8luJub/mQHFykzRmXdnzCNecsMB0nNznNIuQkmbNZ34KFoPRas?=
 =?us-ascii?Q?EFlZbdIVxHJQdlxkXQzuPRNce3G48bQWYwr4rM9xkGG2R7A4h5Mg7aiwcrRB?=
 =?us-ascii?Q?guvmJpHa1Ul9/C0vUYqIC5QTKsIWxoK1TtC083inCWiFTuvil4oQkFVY643B?=
 =?us-ascii?Q?B1Ib2UoPnVFXn5yyDjPGZv+ejz7Idaul0a2/JfmRzd8wViayGZBMhyQcL9Qt?=
 =?us-ascii?Q?QAwHusvQsWCoBNDzaM0XOINHVp+Ui3Xt86v7CxSUaRVt93Mmg55ZlIGC2Nps?=
 =?us-ascii?Q?0Cm+78ixxqDBalxJtiU3Nn9m13/gxgHJ0vufZlXsgbaphA/KRx9ZMlGtUsij?=
 =?us-ascii?Q?BWK1H8yoCGWLM0PtOT5THwHHWD0zn+l6Ucas0rfSYSl/sMCkmqFV8sbDyVED?=
 =?us-ascii?Q?5fM5U3+p/JpYNQdDW6wsoZ6X0Iiifdxp35iXEWB5hVWMr+X0Hb30/faP+wNI?=
 =?us-ascii?Q?ojfecuGQGYJzn8SfR+IkUftv7VqBnK+4nqxC5WjwHgaJ7h7hU0403v6QXF0H?=
 =?us-ascii?Q?U20iHy9TNkFSa0SU2WZ69R5O8Jnls3cljBDDfF0ks9KaDqGHDYyxpnZB26OC?=
 =?us-ascii?Q?eISFTa/DRMY2/vuGRnNWlAvKbcVVW7aUk7V3Ioy6aG+W0Kf+28HjgnZYgmoF?=
 =?us-ascii?Q?6IekDnJ/DU5DfF6aAvrlxTrIa2KnztKMm+d8Wm4NmbrD05PKXmjwNtDTKaUy?=
 =?us-ascii?Q?QIitYZylELKcYZPNbMJRTpGVi7UQ1+i6xPuHLmDBfJkPl4oOaQzXQkDbIq9f?=
 =?us-ascii?Q?LpKCguAiIld7zo27db8meZDYedPCC/7KtWylSAoORPpnQV4Ngo/m9OBsEhMj?=
 =?us-ascii?Q?UxSd2piMHl4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xkKIJFMUqe7z1dPGzh2XTtmppiTBBKhF9fx4JFo4lVsGd4RoxCi0xX6Sn4Er?=
 =?us-ascii?Q?ZqpeUsyaCikweJnQTlFesT/9aZ+q8mo83e23knYfegdudjEaDRD4BBUqAbIl?=
 =?us-ascii?Q?zwbnFkmwJZMStUtTrJ9PtJVTA4zv7OdfE9qLXCLc+aI/rTbWok49ksPEVhSy?=
 =?us-ascii?Q?U/hNGzRyMp89TSpnkbeIqmCcGTZIjXYMyy9ViwXIwK0tck10uncy18KPLeh4?=
 =?us-ascii?Q?NGTQAxqJtowJhLdo261pSnOZdGlr6flmbo2PxNztNS/MnMH2uP8YJHKElUtL?=
 =?us-ascii?Q?QbkRKAsNf1hVsteYH539E7lBqtHravV02QxxbHtNaPYHijz5DyDtbzk8F65R?=
 =?us-ascii?Q?n+by39fLCQwsevNndwwJALuOj9OUD+S4XtYAF8F0Bl/b2kZcFYG0ZyfRbrgf?=
 =?us-ascii?Q?Eg4Sr6q45omfa+Zm6W2RIxFLtVcIlwnxlQS889Pnr2NV+fv6cxrtoQ+hAeu8?=
 =?us-ascii?Q?md0xJQPkP07nc5RtytTCqAusdyVxVq6CqWXQwldFi64R5C5RoZ75Qjo1GQ+D?=
 =?us-ascii?Q?17lB+A1TZdcdSw6h/c00l7IxjHGFYB8p1qyWzsas2LpHOjS5ZKxRSgt5gVhF?=
 =?us-ascii?Q?g28JHjjWxly5FD3/zhSrIUrAm8zKTIie9cMQ88aOdwSNj+LM0z3ZdcK/laCl?=
 =?us-ascii?Q?QxfV0hvwl7H01E5JXejZgsgfnwHpq6T3vSc1sfDxBsD5+PdERO9mO+epnZn+?=
 =?us-ascii?Q?Z07p8TP1e2HxbCXAFe8VCo9gxLOWE9PUcleTrfT2bt3pHzlybomEdv8kUred?=
 =?us-ascii?Q?kAAvShrd16RaMfhQyQszEbH9+CB6aRFCgiiFmg71MMA7sHujJIu+XBzsorgc?=
 =?us-ascii?Q?VmBjim4aXT0g5M4+p2kPMaKaRI/RURG2uc/etqK6RI4+PZre85eFcYTUjZ7A?=
 =?us-ascii?Q?WhHXzxEwid04tr3PEFnI7q62i++DcwKzRStcjpFyNr18YrsTZCQKqfWVeoCj?=
 =?us-ascii?Q?a7MLzmtkm7pxFHvAiU2LcejCnO6KiDrrLjAu1A2A9wbEKlKcwDhLlMBqRbJ9?=
 =?us-ascii?Q?4iGUxu89tgpSKT4lWcFKihs9Yxy6QaaB1r5kQJ6iJAOi3KATCWhLtcQu5T0G?=
 =?us-ascii?Q?H/0fWZoCtXE0Mw1G/9VPIL0LGeT2+KEjM0ybJdH4/X9UUmISTPMPNMJVq7Y1?=
 =?us-ascii?Q?6h69QcUUZ9bSV5BCss6ssnTM+8uidEx+nkdMbe/Sax5zDJ1wvbwYQaLOGtij?=
 =?us-ascii?Q?o88FTBWsYzkmTRbarZH1yiGy0cNVLozIpPS6r0MvrrCdGu1wadfIRxRgt/Ef?=
 =?us-ascii?Q?Mx2CjHLCSK3roNaJrYisAKUGHvQOlQbacmztBxQRLXDxokjwGGVOiTAGWGQz?=
 =?us-ascii?Q?cu8LVAoSMOESEeRUQFsx1gPKUqMfH2LYdesxsWIA6cuIHObBb99YTAgje1It?=
 =?us-ascii?Q?O6udhKZg+FDmp8X3NeGOkM0CSDvTc16b3PtUZoY0vFXw95oTc2NVeAvQBjub?=
 =?us-ascii?Q?Iw7gS1xcffpOCUxaQcBmAj3EyYrclKRO32s1lvb2Gw7qxf+Y54laQBIRKgt0?=
 =?us-ascii?Q?s1n6PkRNEnJxb2amdFlGEwJLVaMTgPYgmviofX+Az2GzC6+ImSKd+MB6yF/w?=
 =?us-ascii?Q?2RkHLHpt7iTSwtqTro4VzigAImOJzcJpdY8zoCiy0i/tSMzdh02rUtKLgsz1?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vUOBQbJ5V3/29+d1pG3YGjBzXVavQm14nktbStClJ5JASOlyiwbJF+psQKbERrb/3t/ZBGvTK3Y7/1EAMUzOF3WSF3ECEoYSddFHH/oBkwQ64WtpRj1dWjLputLUNugvuu11i0J6eGjuAn1wT9tx9CKjUkLl5b1E2bQlhsORAbO4Ng5wWGi5aA/4UrCFqulqhU2dRpXSS7Svts3zA3HW6MiVKazHhuInWEjK97f8HDu24ZpyP0xPND1OMauVuq6hE8GGkc3Wx+RTsdRz28mW8fI3uqEBLZPSCW2AW4nGFqJFraGptABUHokmYp7rd18oXgxA51C0vg09+5snQHueIbq8goPDsCEZRPKjDVZvDkYSZX9LpsYD24AC4Kz6X01IixeQXmxtZyWPhYC1FKuSz4PBi4yqwRsx2T2SCPza3lcpTexXZT5AiU4+F+cNtIFPh3OAp84Q8WGk8DohtPOMmAMsAFbAXyTg0t7iy/ABQfd/2O82Gc42Z4yT36HJZZpwJxFHc/ik6/4RFYMSupiGzwZkAaDHG8Twz8jWn6wK8aXpA6LXFCVppedXa4+XbWn/LZVaNqg1rPdAsSd5+E2gCprvEbYyTOXZ3vq+E8TSmH4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a04d57d-dd5d-4265-e3e6-08ddaa8a0918
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:53:19.2378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /b+sGGwOnxiFawqLC1EP8DAm5KC38Rfsv8ZweaJZ/Afm8MFYFlaW4L12lZ0XxTsZOatVDvDaRbGF51Ah0E+w1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4179
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506130108
X-Proofpoint-GUID: jAIcz22VxE6EpgT3dL9qIRtNNo1s2P3q
X-Authority-Analysis: v=2.4 cv=GcEXnRXL c=1 sm=1 tr=0 ts=684c3b6c b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=ttqUlfu53Zy3l2AAJ6wA:9 a=bQS9OzEy0soA:10 cc=ntf awl=host:13206
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwNyBTYWx0ZWRfXwcobN63E7N9V AG7Vkkn7s+KdjoVs+uoZTrlg0vuyKQl7LAIS63Uo6udvldttmkqb/uDGhz7B3Ltyxy44xmxm1OO ZCmfoE8/lnytpEFcP3KvZnxe2zY+810gwgKJemCAl5l8+BFx4Uqq863/+M4t8Gcj4uPaoV+Hlt1
 eQ+PWdgub0EJLSinc6X98mBJs1aGp6SSwA5nSVmazuB0KCZh7xb+xQ5FSJZWXECf5OFYsr5wpDn Cx1TDrMNuCpx+HVuVOx08PTXgUqV4UzS64GHujGhVilCBP+9M2Yhc0ASp4I2qnewmKpZpfeoWwf PJlibo+I604ryvWJ7dj5Kg7s68w6MEJltNTzKuCUjeBTn0/KZNHHilPJ8keYHyQSvsCCAe1fEvO
 CDpFOr+G+eyezgPM7I4LsmlQWRFNUUZGRzrfjtTdiAhnmVJ/tBJDL8L2zzcyLvPcf7oam76G
X-Proofpoint-ORIG-GUID: jAIcz22VxE6EpgT3dL9qIRtNNo1s2P3q

On 22 May 2025, eugene loh told this:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

-- 
NULL && (void)
