Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321791DE4E1
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 19:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752606606; cv=fail; b=aTQyxT4CEKG3TjPdgWJmPM2nWzjdq45nZR+J32XsNzBkOxsufPOEuobO/zgO9F63GF6f+zkxEVhXVk5vpGqf6gxUPURubwE2oP7Tg9Lbyv5OtfymHK5BFdy73nPz8/+ACNYztC09oCL4nKkJvL5XFKk/3ZMFiFILM+e0X1Ik7mM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752606606; c=relaxed/simple;
	bh=qk+oESeYhGZRE4+nGepg87YvjTaDlfzju3tR/PRRzvE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HZuQh+OwjxU1jB49xUFhcCyCXWR6oaGwPpEGaGieWhqwwPd3vcBk1X/8td0kzIfftUnM1GHdi+OMzkBImOTNqCHj6r+2VY5+a4OsMoClVnnUSAI6GGScdjwDZoONTGKqE1z1BF/euGv9NtrnJHBQBO5cX4S7moOk/famZjFu8Q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OtGrdDnK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hU92BOAa; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OtGrdDnK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hU92BOAa"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FDZG5U017700
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 19:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=WtbcL1QOSvTczmJ16CYF+s3roaLdzIQ3a845LL3LCAQ=; b=
	OtGrdDnKwC0Z9Vzbqe4P45+C2GU20s/b+eo8qSJa97ZiNlcrXJUCsjM0xZfl+e1x
	aoQGY226iLx7RV39Q9QnRbwI5pqVru6JkqC39U5lR3tlh+1Hn6/1+G9QuIQobXBN
	RS3xgGQEVMIfzUF66Ir8LAfrBZxrWNpcOcCybgAfl+8lQAvITNGqd60YoJuv4hQv
	j9cjdhQ+Pt56jlL0VugaYuR/TwgAK/pfLTMkawPY9DqebJ1xOt3ALhbdaymHcWQq
	Yat49jU8wbqGUFtdGnArcEezJUHEmDhEyGMLkKLK5Fs4+UBh1HEYYM7scq6PwUCh
	slP24unQkyBXdZ64QqT19g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uk66y61d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 19:10:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56FHYNPm040456
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 19:10:01 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5ae739-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 19:10:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qEwZwM39Lk2GFjcHWs235ZcGszn6ooOnZxKCj1mpGk7x4vtmYY9d1VC07KmehN8Q2VN2onNLgM4oO0hbK0mw3RMXM/bJmJMVmw+27ROghOatfgq6slrsZYX/Ivd9/6J18VSEVmXg5Znebcb/qcuNXAGFaBILlLDvH2l8x8NWcuTlhDmka218DE7yxByHpyekZ3rsXf+9ReDNahpkVGRxSYosTDVIxvSXi/SPhHjW0+MurkZfgNMR3O/LSUDLHN3V4ZrbvA4EcSZLCQiTBrq576yBcdl9LP76DIbS/uCi2czY6BeCIhQvlIwqFE0buv5WMb3OSVAToTUDZX5wCwI2Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtbcL1QOSvTczmJ16CYF+s3roaLdzIQ3a845LL3LCAQ=;
 b=Ve2nb5RLktUlVwdtlzzbK5wyALJOzmOzh4l4tpxj1HSgYfI7D9wi45n1px5Sbc2ktzqS5nD+WBdIGhcDRPk3YAhvrfI/LijzBb+qE/ddtbwUjopmn7py4b32kpXblJI6a5AzDQlmv72WjJTc5pAvqvqIogA7J2vWv97ocxoZF7FJ4vkUGMwLfW8ZrEatc2xreTuUziLHDjOXNGXIn5tTXf3gJCsiaNuL8BioTDI/qPdVSm/wtgz/gn25EwjOUqTVOBb4lnf+4pzO5trseApqkETowigs5wwllv23xqTODQcilPmJ3Hy4fwjHW4zGuTpPLc02iWLnEhJZQ33ptX67iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtbcL1QOSvTczmJ16CYF+s3roaLdzIQ3a845LL3LCAQ=;
 b=hU92BOAah3jwgY4IIZPL2WAa5v9uDtywVqfo55DvwR0P8ZXFu/6HCiaXYqG3hfdUL23h5UvKgM65Ip9l7ESZ67fmmfqo630Ns9sVhEU6J68t8g6JP9VkyrBdcdyBqgvqf8m4nmRPLII32+Xt36+6QIW+1F3bUdij3o3KzVxRL2w=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by DS0PR10MB7904.namprd10.prod.outlook.com (2603:10b6:8:1b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Tue, 15 Jul
 2025 19:09:58 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8901.021; Tue, 15 Jul 2025
 19:09:58 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] libproc: make Psystem_daemon() detect modern systemd properly
Date: Tue, 15 Jul 2025 20:09:55 +0100
Message-ID: <20250715190955.346459-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.48.1.283.g18c60a128c
In-Reply-To: <87ms986rrm.fsf@esperi.org.uk>
References: <87ms986rrm.fsf@esperi.org.uk>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0084.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::17) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|DS0PR10MB7904:EE_
X-MS-Office365-Filtering-Correlation-Id: c8c87c98-7316-4594-5d38-08ddc3d33102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MsJp5PdxSfjFV1rmncIe+0zFuZpirkXHuZtOvDU31UhDf9hc7rP9zp4V4vqN?=
 =?us-ascii?Q?hhx+fBwgAWanxTMVPsLleo9EE/1Wb2e/KWAd2y5h9CVaVnOJkZcv4qyzjEZm?=
 =?us-ascii?Q?2xBNh8htsR8NGwNGLVkTTPrxVNcB44HrJgmHKrMXIalGVMZcsAto4ZnJy350?=
 =?us-ascii?Q?GcflisUH3XOfyYyWCRUsXoa/I+9EEDeyWylpJiU/H6epi+euFBEgsjCaa+ff?=
 =?us-ascii?Q?HO/Rir/2TKvYXWvjAWr0d5bvEsr2Pv5zVUt0E1NWPACHg63+dXeGMh4ZNxvE?=
 =?us-ascii?Q?2jm1Zu2YXI02oZ24oGvUrOWK/dxlCiQzCTHZSBrYTcHoKIoJFx4udcIKmf19?=
 =?us-ascii?Q?5pe8qTmrlywJhMrexHQnF3EV2vthdFbaD8KucrDS6yulIkhees5/SjdtZaV+?=
 =?us-ascii?Q?ijahIZRoCU2/yOr+4qPc4RWlZbWN3yg1fnTxxwfC3Sh5Ghp0RzeHiNRFi2RT?=
 =?us-ascii?Q?+vSDW8rUk0TVaFI8cn8SGdiYgQi+WPA82eMzGrIx1S1JUcQ6s9fknhPQ+9JV?=
 =?us-ascii?Q?YXWEdbRqeMIdCGWcudhYYggkxNS7i83PFuABLVXFL8pMExLgt4HMxC6k+/i1?=
 =?us-ascii?Q?+1d6aTqtO4SD/1LZNO2kd/i3GZu3HVxIWph8UtwC+WExQXxnnrIfuNBwY48+?=
 =?us-ascii?Q?ASVA+EuU95HFqJ8CG04eaZQtwogt4iMvu5J6joDNHeZCgCs2FgZ+dQ3H+wMR?=
 =?us-ascii?Q?gPzSZxL+LRv8I2CZrg6DYhju9Lhq5pRS14eQu9VE+7ccUdakPFlXBlCQa7Ta?=
 =?us-ascii?Q?/ZheNJ01TzTWRZGslZxvSNsRR4FYp38Y3jXJAxaRhlNFOc2jEiVcKC9BKkLi?=
 =?us-ascii?Q?hrItGstNaVROLcF4hHizChZWlqJlnKZqjDDDk2q6i0Dm4CtdOhwC6G4oetKH?=
 =?us-ascii?Q?WlGIlLbC682tn0ASLzu5G9Hs9CnpGNXhg8YhtdYQj63eiL4PE7GcMeqg9pwA?=
 =?us-ascii?Q?CStwnyyCt7ru1ftJ4CMhH+Ub5OryamrjsDg6auMF6EGqWqFGDt21pGp8T6+D?=
 =?us-ascii?Q?BPF1M/NIy3deTOP7YrA+0ZSgYr065X418IPwxYrBtYeJr8EURbkzGBK41iCO?=
 =?us-ascii?Q?41k0mwroUf/x/Vl/GM6CtmRSohe7BCMiMi/9nbWElRG2/IyPeKLigB9FHmlX?=
 =?us-ascii?Q?sJ7eJaFa7HthyeH7EnWiGs6xDcROIrJRc5WqKHL9C/LNjM5Kt/EGRPYS6msY?=
 =?us-ascii?Q?GziKSZTCSmWl4CcHJHDVTDFWI3+/QnW6iswnOD7VcTbxy7J40v1f6K3Bhkyb?=
 =?us-ascii?Q?zrJ3qYBbipQVKAwFLoOWm5lwup4zvcTWtF2O0KTTyb8BiwvFpKR9GaPuunlu?=
 =?us-ascii?Q?JYZJ9CgPR7560mpRDeQmTAcTMBwUUgq6K460NoovK3APW5w63/H97HtFdEE+?=
 =?us-ascii?Q?P1tBIpqDi1nCsfR24AFJjBxivZR7KAi8TIMKXzmMNaUovn+NmVLJTo+OevG4?=
 =?us-ascii?Q?BfW/bQ0+14w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QAUxEOzgk9y/XJdNu7mteQt3QCs7vcJA5X9VZmsy+Nov3uZWdMwyIvSQ67kg?=
 =?us-ascii?Q?rS4eYmDAV7ZGwnjy9qTLIC3ps97/XhtgYEnHRBzZ3GPHrWmr3g3AhGCBoFqB?=
 =?us-ascii?Q?Lmu2YjMEqXyk901oQdi3gdggac5M2r9fKR6DUHw4jY6/SUE5oaUAjyMmYlW4?=
 =?us-ascii?Q?mC3sIEtZPvQt6CmRQIM8jxYMxfFpVrTDg9RYkQO+hmCchMGaxc654ZDjwgSd?=
 =?us-ascii?Q?KPevM0LACxccO9Z05SurWLshjumpN6YiDmofGsScaODVxbI2heYt0rXINY6B?=
 =?us-ascii?Q?5VryCaNGTtqVTiAnbJS7Ap3B/bpTmZofbS67Xx4kzz+UxqXHLnVlwQnnMK8c?=
 =?us-ascii?Q?qwQBQXseBlnZOdoQBIyjv4Rx5mra0aMptCmJd4Yq9ajNNnEpR68O6+jCbvoo?=
 =?us-ascii?Q?Z5cibCJb0ijAGvr7KKUeMwcRYjuY6BYt+eBE8B1NJydFpIg+GzZjjjD8H5b1?=
 =?us-ascii?Q?uTAVm3yZSYOY1f6WmF5jE+8QcKi/pggvW8A4mG8bI29IbClpcLIYrjwzpy08?=
 =?us-ascii?Q?S+67J+mptjkThoNiX/cVNX+gwDt823Fx/XzRBkF/4yKp+weaBsYtdfjgCd9b?=
 =?us-ascii?Q?5/3iDIbIBCC1in0LEuE2UcwvVpUns764Jj1EzltEcvf33TnkKtx/so55ekpH?=
 =?us-ascii?Q?rparRKL3L5raJFOuA0qczytzJAfxVTsi4EaoPgHD2TmDTsXGJlsLD4tKmYCq?=
 =?us-ascii?Q?6t7QTJTwHTaKmgLEXzZVe0JS3LDjo7JV+vcOvITazVyD8perY0LxXoUnhpjE?=
 =?us-ascii?Q?AQc+/khUCJ0/laj+9p99AOf6t+A9JT0HB/bViIzNM7m4IkV1/Q8JEiB0Ekdp?=
 =?us-ascii?Q?qDmH02vVjMHArI5cfZCFq0OBIoX0BxJ6vtBjSZwtq28RicLi1tSFOVgrTGZD?=
 =?us-ascii?Q?NoAdmjceIxWo1Z1/F8VQ5F8k3ilHQ6p9DWfJeldLuAzRAzrgy4bEAn7R57HB?=
 =?us-ascii?Q?f1ZGxFjkFSYuNa8x8e1bK+NZNVQShPJzHm+NSeaV/N5HxWMgHbRbT5Jl4e24?=
 =?us-ascii?Q?0Umddi/vKZ8glp2728Js2D7FWOq7hfeyNtgkIgElHxBRojXPnAFYPZW9xnH7?=
 =?us-ascii?Q?sWKKZ18157vq78l5CfocF3Ae1+hFL8PunT8ILy4cW93BbOWvWkNlwdK7KfNH?=
 =?us-ascii?Q?OPBfAKhjZJuWw7lS38qhTCUGueNueB9HeL8RE5RQT/Q7RV26TxgqbbFZGvgs?=
 =?us-ascii?Q?m6bUhrHKgi4v5ckbqQWL2LYLJK0m4z5DO5qEPlVmLYaTekBAIj6vaW1JQkMO?=
 =?us-ascii?Q?lYlnPNfmwWXKTnc3Deq8ZVf+V9qNQPXydoT2TxhYPYv2A1LORLNeAAVhSbEE?=
 =?us-ascii?Q?BqtgVZ3QhFjC567PlCE3+fMrZ6f3vNO+Gn+bLwQfCN41dgBcI8LmaNgA6lG5?=
 =?us-ascii?Q?fN5z7M+kxl618JI36nQrcR6nNFXFMSVeZZ5yLYdTa7ozbXzGN8K+yW7PSpzy?=
 =?us-ascii?Q?OtLPrltYDqKb5WVW8yek9KxDbBLf0pXmHiAmVv9IDatexejoPsEfWZEzRFdW?=
 =?us-ascii?Q?LmK+A0PKkVyu17DEFplZm0o/t3sjwFzQfQljwGM/rhJGCaMYeWy3thV1vCTV?=
 =?us-ascii?Q?7NL2PruKMec34Jw7DyCrlVIj+j4PpWm06bv91NuSFVUF3wZTMuMk5ZVbL4bL?=
 =?us-ascii?Q?4g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QblIbZybq48mzN5L2qO3DeGV106LabfSXC0p8wAdgupgOzsNB0mlZ+w7hVTRaoFkGsbF/B0c3N69Vp3wzg6EFEVsZksdi/EpvbmLEkH5OUJQS/iQpImvUDV5deFCKW0O0PwoUQfg+JsmhL33FFwbfZBZbs1BZDyCoJS/NtVyz9ut+gI0cvzVnj8avj9s+wiULJ+YMbkbnew8lOLO7Xat+672vt/P+geOdkvRGJlKIzx2OV9FmL2GCTI4qxBBcHilfkg4bFEx2B9N0nr12oHLYXLsVSVQ425ROxFjQhuwmlI/hHHKa1Lq3G/o/1RwISw5O/s+WOtMH8svTcg5SFLkZ5nccdcjNcRqSVo41NQQD6LsfhuJcN8pefk6OZGqsMKSe1JElJT8mkoixdEXRf8+wMCYiAc+6Z1Jj6/y1VZOjAyKmf9lzxqKNMxxsT50CrlzFxKvQL7pbmsnQDoJwcOG2A+lVEmBbK4bRjeztUB7aguFERnJRI4U96R+HcbcD9siP6Fwju2FbmCYtfKXFeGHn7Jxl4INXtnGIJFP3VjQ1ID1N9bvQ5Vlyk8JOIqWKDYFvQCGnWivOf8E4+gIXFGFF2S9LeINYeCFdj95WXnsysA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c87c98-7316-4594-5d38-08ddc3d33102
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 19:09:58.6539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TYDLBlrI1psDdqaE+bj/FrLBtLqG+DnPINLpB+5HPKoGBYGdwsFX+7WwxVgH0HGNsYkCm6Hk5iZv7XakBqyfew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7904
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507150176
X-Proofpoint-ORIG-GUID: URNhuTfFj9gRfQFFlKCrgG357qrzT7XE
X-Authority-Analysis: v=2.4 cv=AZGxH2XG c=1 sm=1 tr=0 ts=6876a78a b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=8Hqci_Nc1OM4S2AmlaIA:9 cc=ntf awl=host:13600
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE3NiBTYWx0ZWRfX6p1ud7/P6jsh 1VRT+9lcuuX+kq8twnpGSDi7PYMNUZJAvmjgG69gTwvfQTyy/30nGWgfHfoD1Qv0+5lgCKVYfA0 Toy4XcXDpUBNbIxwhYMtaIJNCm9/GtrzrCzoKx33bG8rlrPgPPnBaO4AyUK3iMINZVvgYeL+0Iq
 cSGlsnrNKK9c7PUJb1nCQztzv1VeWekZzyHvxHbGRA1LZkdLKOBSqOZlcgnSR0nvM3yDoV1I5nY 9LvV7T93D/97t4asE/sn6ihUUq20kG1IW9vN1aCSQHPyrahT+TQ3k/0qiXYUGwRdLeFN70qeC6t NiiRXtdmxOOUbjoM72dYF5jZJxDjRDu/Mrve75P/UOYgSK8C1M+OygdGB1rGGyAFfQKiS87PYtA
 pRgQsV5U/F9/waYro/PRed+SHca1hkHsJMB5Tiok1uDZOgNg4MN8ZfY3RDOKkH8aOMrfo0R9
X-Proofpoint-GUID: URNhuTfFj9gRfQFFlKCrgG357qrzT7XE

Psystem_daemon() is used when carrying out shortlived grabs to detect
whether a process is too risky to carry out invasive grabs of (you wouldn't
usually want to stop syslogd or, God forbid, try to ptrace PID 1, unless
explicitly requested via -p: the process just coming up in routine probe
firing is not enough).

This has two code paths: a reliable one for systemd systems (which checks to
see if the process is in the system slice, which contains precisely and only
system daemons), and an unreliable one for other systems (which does the old
Unix approach of consdering anything in the user uid range or with a TTY or
with open standard FDs to TTYs to be not system daemons, and everything else
to possibly be one).

We were checking to see if a system was systemd by looking for the systemd
cgroup hierarchy name in any of the victim process's cgroups.  This was
reliable back in the days of cgroups v1, but alas in v2 where systemd runs
all the cgroups if it runs any and there are no longer multiple hierarchies,
systemd no longer names its cgroups this way and the test fails, causing us
to fall back to the unreliable pre-systemd approach.

Use a more reliable approach to detect systemd, the same approach used by
sd_booted() in libsystemd; check for the existence of the
/run/systemd/system directory.  Fix slice detection to work in the absence
of a systemd hierarchy name (but keep it working when a hierarchy name
*is* present, for older systems), and everything else works unchanged.

We also arrange to fall back to the old code for any processes that are
entirely outside of systemd management: this covers kernel threads,
the occasional process that is part of systemd itself, and also processes
running using Delegate= to give over their subtree's cgroup management to
something else.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libproc/Pcontrol.c | 101 +++++++++++++++++++++++++++++++--------------
 1 file changed, 70 insertions(+), 31 deletions(-)

OK, this doesn't regress with stdin coming from /dev/null on any systemd
platform I've tried it on, old (cgroups v1) or new.  (Non-systemd, we will
of course mistake most of the tests for system daemons and fail.  Don't
run the testsuite noninteractively on such systems.)

diff --git a/libproc/Pcontrol.c b/libproc/Pcontrol.c
index 7d9b5055f8201..b5c4e27ef9d29 100644
--- a/libproc/Pcontrol.c
+++ b/libproc/Pcontrol.c
@@ -2927,10 +2927,26 @@ Psystem_daemon(pid_t pid, uid_t useruid, const char *sysslice)
 	int fd;
 
 	/*
-	 * If this is a system running systemd, or we don't know yet, dig out
-	 * the systemd cgroup line from /proc/$pid/cgroup.
+	 * If we don't know if this systemd is running systemd, find out.
 	 */
-	if (systemd_system != 0) {
+	if (systemd_system < 0) {
+		struct stat st;
+
+		if (stat("/run/systemd/system", &st) < 0 ||
+		    !S_ISDIR(st.st_mode))
+			systemd_system = 0;
+		else
+			systemd_system = 1;
+		_dprintf("systemd system.\n");
+	}
+
+	/*
+	 * If this is a system running systemd, dig out the systemd cgroup line
+	 * from /proc/$pid/cgroup.
+	 */
+	if (systemd_system) {
+		int found = 0;
+
 		snprintf(procname, sizeof(procname), "%s/%d/cgroup",
 		    procfs_path, pid);
 
@@ -2941,47 +2957,70 @@ Psystem_daemon(pid_t pid, uid_t useruid, const char *sysslice)
 		}
 
 		while (getline(&buf, &n, fp) >= 0) {
+			/*
+			 * cgroups v2: only one line, 0::-prepended, slice
+			 * name always on that line.
+			 */
+
+			if (strncmp(buf, "0::", strlen ("0::")) == 0 &&
+			    strstr(buf, ".slice/") != NULL) {
+				found = 1;
+				break;
+			}
+
+			/*
+			 * cgroups v1: find the line with the name=systemd
+			 * controller notation.
+			 */
 			if (strstr(buf, ":name=systemd:") != NULL) {
-				systemd_system = 1;
+				found = 1;
 				break;
 			}
 		}
 		fclose(fp);
-		if (systemd_system < 0)
-			systemd_system = 0;
-	}
 
-	/*
-	 * We have the systemd cgroup line in buf.  Look at our slice name.
-	 */
-	if (systemd_system) {
-		char *colon = strchr(buf, ':');
-		if (colon)
-			colon = strchr(colon + 1, ':');
+		/*
+		 * We have our slice's cgroup line in buf.  Extract the slice
+		 * name, skipping over the hierarchy number and controller
+		 * fields.
+		 */
+		if (found) {
+			char *colon = strchr(buf, ':');
+			if (colon)
+				colon = strchr(colon + 1, ':');
 
-		_dprintf("systemd system: sysslice: %s; colon: %s\n",
-		    sysslice, colon ? colon : "(not found)");
-		if (colon &&
-		    (strncmp(colon, sysslice, strlen(sysslice)) == 0)) {
+			_dprintf("systemd system: sysslice: %s; colon: %s\n",
+				 sysslice, colon ? colon : "(not found)");
+			if (colon &&
+			    (strncmp(colon, sysslice, strlen(sysslice)) == 0)) {
+				free(buf);
+				_dprintf("%i is a system daemon process.\n", pid);
+				return 1;
+			}
 			free(buf);
-			_dprintf("%i is a system daemon process.\n", pid);
-			return 1;
+			return 0;
 		}
-		free(buf);
-		return 0;
+		/*
+		 * No idea: this is probably a kernel thread or something
+		 * else entirely outside of systemd management or delegated
+		 * via Delegate=: at any rate, a system daemon.  We can fall
+		 * back to the old mechanism in this situation.
+		 */
+		_dprintf("%i: probably non-systemd: delegated?\n", pid);
 	}
 	free(buf);
 
 	/*
-	 * This is not a systemd system -- we have to guess by looking at the
-	 * process's UID, controlling terminal, and the TTYness and/or location
-	 * of the files pointed to by its stdin/out/err.  (i.e. we first
-	 * consider whether something may be a system daemon by consulting its
-	 * uid range and controlling TTY, then try to rule it out by looking for
-	 * open fds to TTYs and regular files outside particular subtrees.)  (As
-	 * a consequence of these rules, a process with no standard streams at
-	 * all is considered a system daemon -- this is a cheap way of catching
-	 * kernel threads.)
+	 * This is not a systemd system, or we can't extract the relevant
+	 * slice info from it -- we have to guess by looking at the
+	 * process's UID, controlling terminal, and the TTYness and/or
+	 * location of the files pointed to by its stdin/out/err.  (i.e. we
+	 * first consider whether something may be a system daemon by
+	 * consulting its uid range and controlling TTY, then try to rule it
+	 * out by looking for open fds to TTYs and regular files outside
+	 * particular subtrees.)  (As a consequence of these rules, a
+	 * process with no standard streams at all is considered a system
+	 * daemon -- this is a cheap way of catching kernel threads.)
 	 */
 	if ((Puid(pid) > useruid) || Phastty(pid))
 		return 0;
-- 
2.48.1.283.g18c60a128c

