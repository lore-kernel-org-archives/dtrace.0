Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D16021A922
	for <dtrace@lists.linux.dev>; Fri,  6 Dec 2024 21:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733520024; cv=fail; b=OD1N9N2Z0dvCbWVOf4QrW8a2ODuJaIQNJeAKdgyoEXkjErHAkXXBWG292FWY/Rir0Y0eGZhlQTYrwKsIp+szEqtGmKT7v3H5B4BOjJhD7BjTQEKNdeN/XXOCZWXIlNW0nbD6c0wy8rixCdCtyGjbWvEQa8ZI8vpOX4kJVl/Q9H8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733520024; c=relaxed/simple;
	bh=pHJUCT6qOtBTSnqrp4ArBbq33qmxzepnSd9H3xp4Cvc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=lRqlGEzhz2qi60leD8B2UTsVPUyK+EmsWnQlWiDmP/L2FbTIdXaJQcQJ4z7w/59bBY4GxBbWcyrm+oks2tUTf3BFHeyEG5Xd+tpbzpevXgO6aPI3aFpci+sLnEXJcI3lh1//1HG7LK1mofWrG6CQtCa8paEm3JzX9xyw3OTRJmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DIaMWpxA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nzY27QJ3; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DIaMWpxA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nzY27QJ3"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6JMg4r018687
	for <dtrace@lists.linux.dev>; Fri, 6 Dec 2024 21:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=pHJUCT6qOtBTSnqrp4
	ArBbq33qmxzepnSd9H3xp4Cvc=; b=DIaMWpxA2goquOG1NmeKL5B8/lUMZH9ly3
	KkWf9Z25B7gAF8X99P1tPZ6aSGw+x5M63tnVyg8hW6CspXTuUGwMrJWZWSIfP6nL
	tJHFfRbAN3qbsL0noDE7isojSTDajUcKUAhKdY6gIqRQeQB9bN3lEnpw+4AMI/yC
	B1GAddfUZ+VmJAeR4wJ/ELRiBwPgQW7aXE71rQ1KaE5X4ulXoUMGAvlbyGPytHEQ
	zyyIqKBjv8qhfbvqfP4z06d1082M5zzoamonlsApXJZo61IWgbTcHAnQHrI6Wl4g
	l9NnEPM/Eo+of4AFqjdleTNSlzrSwRw9eLr2zgKSwi9xpZNaL+vg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437tase627-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 06 Dec 2024 21:20:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6L89Yn020481
	for <dtrace@lists.linux.dev>; Fri, 6 Dec 2024 21:20:19 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2047.outbound.protection.outlook.com [104.47.57.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 437s5csdcc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 06 Dec 2024 21:20:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e5QgV6pKxZeuRGUN+OWDSw67T/nG48MdhXK5wRmI2yIXlIizbnyl0ttMo10Be35ShMWLnL+nETK1drbpEHK0TXIjywCJAolIEIgvkSl4WNtmCkTl5Yptga3fQZ9TF0TZ4ObeG7bslQZAXh9kaGcbCpFveGAQRuegfHjV8pv5l0j3gOXA1XaqGQ8OL7hEFMYUJ/jVN1PP5oM4V5PGFBKrN9GMusUausB5ksTlbTjqMIQsC6qn7wk+/ztqNUDBnffBWy60GHOzwIIXYPDnJhCbN4/Jb4c2Jv2pZnkLKgUTmc2pjECMZ5u0tCPH3Z9MhiKMyWZBawAWFMp4AzZDgL2Q+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHJUCT6qOtBTSnqrp4ArBbq33qmxzepnSd9H3xp4Cvc=;
 b=lc9xxzZwxzL6Q4+goMWIqlKCN16oRugdHYMMQWPcPfhj6BCnF8aRMsnOsHgRB7rSUhbh58LEXqLeGQREy6ZLjxOjf0I5I0gMxRUml/gyJ5pYJBjCUvgXHPwBwvq5lSsBVFCD1sNOf5NteKH/I67oFzlVTWdso2FVQuk772We8XLF40KFfD4vIOvoQw1fw4GyC20BkyqDf2+4EbbNq6wOqXICbxpzmY917Rsm2NET9EUQ7JAnKnusyJ4NSTK4O0BMEwWU+4Jh0Sgb155/CQRV72aqWJNkpz01Tw/3f71/JVOXSZ5usFlU2lfreFa52xqJ6ZI4kW+N93iJWh+oRL0u4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHJUCT6qOtBTSnqrp4ArBbq33qmxzepnSd9H3xp4Cvc=;
 b=nzY27QJ30pZAZxp3A4ZfE11gP2bKIkRYDTwZgphQkX0OGWw5KBEIRQjl+/sf8fUoQvKmmwQW8cn/YwF3FF31O/A/p78Sr/KZrV2xh+Z+F1bfvIZVB5RJ6q5uao/TbVxl1tRD5rVt5DQN3habJu1oz532hCzmHthN84p69tqIgWk=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by SA6PR10MB8086.namprd10.prod.outlook.com (2603:10b6:806:446::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.24; Fri, 6 Dec
 2024 21:20:17 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%4]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 21:20:17 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] tests: $dt_flags should not be used in .x files
References: <SJ0PR10MB6350AA58DF71BC3D2E4191FDC2312@SJ0PR10MB6350.namprd10.prod.outlook.com>
Emacs: ... it's not just a way of life, it's a text editor!
Date: Fri, 06 Dec 2024 21:20:10 +0000
In-Reply-To: <SJ0PR10MB6350AA58DF71BC3D2E4191FDC2312@SJ0PR10MB6350.namprd10.prod.outlook.com>
	(Kris Van Hees's message of "Fri, 06 Dec 2024 15:51:24 -0500")
Message-ID: <875xnwo6et.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0554.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::9) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|SA6PR10MB8086:EE_
X-MS-Office365-Filtering-Correlation-Id: 857ccd00-3c53-4cf3-59d0-08dd163bc7ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rhbqX8jcKii5AP1seqpFrkovWGzfa6y4/fMMTV8+XOySCh0r1wxTjsgFBtVj?=
 =?us-ascii?Q?bsEHBmWVjDGx6iEgWWVBn8K9yrD0MOT7w0a59OSM9Dx/AtA3nGiIlicA2YEh?=
 =?us-ascii?Q?0i10+PRW+znoMcc+Yk9kKzkHksGFpVSnCo255XOz/Os9Em03fUoYodZiFxDz?=
 =?us-ascii?Q?HC4DXN8qGltOF77YFmG4XRDEZn6Hv+brBMq5jvLxNFa8q4o6loN7WZZkRfVx?=
 =?us-ascii?Q?zmeHN87l/SVPl1tzDtAkjfTgn+NO8u5gDAKbdp+yoOeav/0Hlzcy74opNmwf?=
 =?us-ascii?Q?NwYwFb32AstvqHNVl2xTn02QH7bMGW2fsTToRFJ+TOdtytIWXQvJybjiKo2o?=
 =?us-ascii?Q?sD1u047YgCHMv3qBcCqbhco09yUXvV91t7/Nwc+dPXDzo9pjxHqbg554d68f?=
 =?us-ascii?Q?rQ1dOfCZMs5z5jRvBbUb0PPBhJN61UmjoO/GTNkS3tIahN9hXkCtGcsZTd3E?=
 =?us-ascii?Q?XlnvePXSLNPM4A5Z0XXDeqGllZkjfxUqIsauKhYe3rV/XUN8kc9BerQuS+RB?=
 =?us-ascii?Q?czukTaVEAA2yTHqKeV1CWu8zpK7ra68yV+DTowW3jnSccQSyGyU2F9XIh6Zw?=
 =?us-ascii?Q?0YX/RSNLsx+7FS8Din81uwJ+eKElZsi5V6gAqSquPQwJJbYq8GnMuk04IUgJ?=
 =?us-ascii?Q?U/kPNZUTelY4O3STxFdFcjW9h8BDHLD8DJ/yV1iw1qYt5wyUuAaDq3Awxn+p?=
 =?us-ascii?Q?JX8oe3Mlgd4N3lntXhlkGuEpCKxsFCawAFQIT7Tv21NMM9PEiqfxGN/TissL?=
 =?us-ascii?Q?8lwoCxg6fFrHjDrbgQOQzKM1rdcq8hCE0z5mbQWrVrBY7yu+Wf//QQelDfV9?=
 =?us-ascii?Q?OfmBVsYisKzRk2OLrnA+PE5tSqAml+GR7LPnZ2xud2f14YGfx7yD5vSUlOE/?=
 =?us-ascii?Q?NGLjR5fCe/0QU0A+GTpAVCo5SiBgRIY3xwEEFztY5bCViNkWnfUgQU+Vdyjc?=
 =?us-ascii?Q?hLn2u8N+j3XRrnRJzJtQ2zylAuyAg+A1r6vBA9FOHq7an6B8K6b7mRFiweIN?=
 =?us-ascii?Q?Q2eknvP/FL0JYrr5M4k54O0tvgx0f1+9d1U6xNn3tne4PCCaaeBDL8p1+Q7D?=
 =?us-ascii?Q?SJ9JmLIHjhX7nGRNtG3UG4QmH4+yGatJx9lMv4zi7n2/xSBnHhZfDGcLgerr?=
 =?us-ascii?Q?I+X0Mi1kjFPBGmPKcbnGIyLhxmm5/BJd9lSkuNRCOMVMHqPLFroTCEFVJcG0?=
 =?us-ascii?Q?5VZbEszpU8pb9+pf1/ZQ+KWMdKQRbh7P1WVNzsoflOfFlfw1wIBFmi0lk7D3?=
 =?us-ascii?Q?NsgAFSnYSQuUt7/kkjFaD0duGnEdnaClWFqQR+h6+nvk/Jm3A0Yoz8a4MSv5?=
 =?us-ascii?Q?SoUXiH3rGFktYmYcQ33erzG0mr23cBE31ZWNCkwsBapimXBEkADC4FavzKZD?=
 =?us-ascii?Q?/Y/HQz0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WNXhOLa8m5eoI/A75omZmywQlE4qeGi7r7Vqm5Xhcz3KGbbChWVjkjzLGZnw?=
 =?us-ascii?Q?+cFnZCuuaKALuIFeZdHI9hDLqXHQ92agGYggfXm3yzrM6wmBoZqdXnsir5PN?=
 =?us-ascii?Q?mJmT7OoI+DW+1FIXQ3GLRRT/FmztQjgkfXr5uuf3WeryPpwEMMQ4odf2dtzH?=
 =?us-ascii?Q?jAzyECwAqxqH4GJj/PMQvuaIm9JZ/E0p9wdaZL//3SLdrlYBBG3dCu+i8KqJ?=
 =?us-ascii?Q?04yU/+d6v/SFVA94anAavVCBJbqIB1fJbIU5v+erUMpP0hrHB7iXdnTaMjnS?=
 =?us-ascii?Q?7kItQziWAs6xchbB11qFxsuq5uQLBaz5HilS4TLx7hgDD1hl4MbMjpBzUsfC?=
 =?us-ascii?Q?dCLsjzc2Qvpk6BsD5uhs77MHWzRVzAAcEQwBb2vxYp7MJxpsvwWcCJJ7cjzs?=
 =?us-ascii?Q?ukDuZI/dLYlefYMR6DGtUQZrbUeOti700BI/38E/3DMgjKtn1kbHKLAcLi84?=
 =?us-ascii?Q?1lmY0RWx7k+tY1Snv3sNnkjiO1EvFhXKe7K/50wgBSmwFGkvCFTj40rqf/jj?=
 =?us-ascii?Q?ewQ9/txnsdcrL59R4zZwKq+tDP6fqS+E/K+iaNAyWg3oK7FswB8IOkQX+ezB?=
 =?us-ascii?Q?HYb0a8XypDBW+1KwpNPxYJDu30kPHWJU6KCvDEvRFGcpw3CJ4voOa4vLzg5u?=
 =?us-ascii?Q?ypCuz0uk0XjVwBHB1JXVM35i9FBXJd+bgpIFpUHfXaqFiexLpdwfiDj1r7yD?=
 =?us-ascii?Q?V5b0hlvgh8Mri26s+55NRma1E3M3QP4MsI1A1h9LoBrWfdd1FROhqHVEP1yn?=
 =?us-ascii?Q?aZbk/S2MMpzmQhUjG8V+nl44e3p+ONVDFD07f0KCk6U53NvB1bNQSQ6COGrt?=
 =?us-ascii?Q?Ag1VYPQ6QfNC9XSbLXjXeIaHyiDsqxnp3E5BVgiChVnAz2Xay1WB67ZGxmF8?=
 =?us-ascii?Q?iA3D9uCcxQ4XP28GHd3zeLxxiR9xO1gGydkzfphRJrFmAeVvjf8DwFrgThMz?=
 =?us-ascii?Q?/n3+Y32wymV3aGehjSjRI/rZrGU2YPZ8MlIya4xJImCZ10SjeygtIoxLIr2U?=
 =?us-ascii?Q?J68tYWpJfbsHc/d0fgwxwAdhuT/E+PFqQiB+aWgKgYFC3Ywh1i2nDcmLNKDF?=
 =?us-ascii?Q?XZ6qQlvqZvIcZmbk2ywBygMCo2yVPq3LWbmeqdLoZfzzQwgl6WdMaYsXl7J1?=
 =?us-ascii?Q?BnbGJVXTqrYWYoWorJ6dpulwRFEXoE8DXTMp4c7fBFZ5pQd8NNjmCL0NSK7I?=
 =?us-ascii?Q?ECDsIzHeRdsiU0Cz6t+rRkzkL2ZEk8nJWhNiniqiK4fWUcXzIsvP96P9VSQH?=
 =?us-ascii?Q?/owMnixD9OSeg/vDnDEObtA4ENX0RmWSAD+MRLmVtCgdXhnx6cOOwQkya3WF?=
 =?us-ascii?Q?SVQY2lvqjCIKehUUaN63YvH7/qbP1XvINUoG8g79MoSJpBHoNSHz7Fb6P+Z0?=
 =?us-ascii?Q?72aZEE2F27ZMJ1DmdWUF1J0rbe5GMMZqKVsbUX/0YDY/qalZpT5H5e7suThK?=
 =?us-ascii?Q?YXcu3GndZOYgqtt2GW9m6TUiHolBUjocGO9Ci9f6aehi0AC4N/1LfNf6Uo7H?=
 =?us-ascii?Q?SLrIDmRMHUsUlRS3DFpyNsXB0KDDsh9Gvz5huwWK/B3nCE0LFPCcEqV07w6M?=
 =?us-ascii?Q?cyAB/M+cqpTCNYh4tQO85amY3SOPqRgREkqVVkxPplQe5I71ckVfxksTmSdU?=
 =?us-ascii?Q?bw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SYqQrcRLbxR0NSChIqGUl8fHDlkOpjt5Fp92tJX8LaXCAckpykGpDdgvHByFzvS692hx0RbDAMI4lBYxwlg6bYiI3Ryt17SGa8m+dL7MiE7CdopbO4AL270uav8LbT9g+F/qjuGKh0wrMYmCn7EHLxfYBT3jV4mWFbeQxK0cWoCUH1Xvv4CJuDkn218lL1EhLAm4VJPOWYO1uf0L2FIOnLtACqWLfIBssEsgVS1pSS+iUNNMNZQUUNrE6IoegAach6EaQ1hA7PTywTmz5u5T4DesaTwb+VeHfSvyP1SoIktzfvmmbTc7cpEwSwXzhTzQFpboNLuC8iqFgTcYDoxJ+jueeiWdndvxgx/ImuIs9jODZn2MX/A2ZOoAYtcwHnLiPLbW34Fbw0dOCktjawN2xLXMl28ot61ihAZ0RXqw2jndUkcKGvwzoHs67JP4AEOtty8cIziCrVDct6/p7XoMIIXxrCRQMaCYblUOmM5B+cJNaPlKCb1LzETeSBjqerN4CJ+kKwL7cLrQpp+oGcIJ6Pm0fqBlVhyZStJhUmki6XYtLVRjhWMXhKCMtUlpQt/cr7v83NmVx7OfWC2guap8fR/TvJRtzU4rMxKt2F2u1Lk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 857ccd00-3c53-4cf3-59d0-08dd163bc7ed
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 21:20:17.3327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zvZ6OxSXRYlzRo1KIsc+ZLkWlGl6vW1UUWgJbCpAjVnOhqCpau0GEFIwVsSt+hVUwnxgqO3iY6vNpvaxPU+eZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8086
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-06_14,2024-12-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=932
 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412060161
X-Proofpoint-GUID: Qpey0dsgqiEMufJ5O3rVDpPRl7gqTOnl
X-Proofpoint-ORIG-GUID: Qpey0dsgqiEMufJ5O3rVDpPRl7gqTOnl

On 6 Dec 2024, Kris Van Hees outgrape:

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Sorry, this was me being overzealous adding $dt_flags to everything in
sight. It's only *really* needed for those invocations that need headers
to be found, etc (to avoid picking up the SystemTap ones now ours are in
a subdir located via pkgconfig instead).

These invocations are #include-free, hence safe to drop the dt_flags
from.

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
