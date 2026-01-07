Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3368623BCF3
	for <dtrace@lists.linux.dev>; Wed,  7 Jan 2026 02:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767752570; cv=fail; b=F45C98DlEuy2pNZUOL4yntIBQeDolk9feDHNKZhMFoVdifzfLJpGhnlUAHCxNfh1C9veqvwbpu10ESl9FOtVb5lQEqLX2JZecxRSXeVXC+MB2pxTkTRuQCn5crYyjrZPpvav6TjyRWXnuYVnhVJGOKkDVhxZNd06CX6/G4r2eIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767752570; c=relaxed/simple;
	bh=SW9ON0en1VICLNYiu835ispz2KaEfomnCQgPGeMGIdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sQiysDn4yVFvM79cssgr8qnTI/w6l1D8yAOmeWMv5jxjAeWS8K13UW13JwuJpAJZxvDS5VoTaMbIBzrckdB6cS+3l1uHZFYS+FrQr+FSI86PDgZd8VWrmaXkjs7yX3BZdxzACN5lI4KehroOoRBw26Pz+5KVnQZwb+eFUk5lmVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=f6bpNLVI; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lLEmz005 reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="f6bpNLVI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lLEmz005"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606NQTKT689241
	for <dtrace@lists.linux.dev>; Wed, 7 Jan 2026 02:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=lRKZPVM/X24uZUufzx6Tw2YSsioyMfNvmop3ZNuzCuk=; b=
	f6bpNLVIw+bcIaHXcqvOMJfKzDpchACxyDKUgWpbAia5+fFAD7S4IDOwxS1iqaSW
	Bb2vvMlfp99NfBbLOz2/HPUBmjOu35wvgK1q2Uh+VnCPOxg2sKb2U/Pi9sR7BW7u
	jiGQYFlOVRgH53oh0HDdJAoDe1Y5dQdiVBS64C6XwYk3dMj2pG9svg6PGnSDsQ8g
	I4J55InfTu3yyTo/uFJX+DlzZhfRWeWqMNxHsfx+oQeWILS6Tyx9xekUM6YSBBQh
	aXbeTGlsZZikPl7ijQo9eGB/z1Yydwo1n5/OqE8kzxXr/kmyWz801Hqjdi2RfwRY
	KhsYXh7QYHKDqqwv0U8nuw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bhc2fr483-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 07 Jan 2026 02:22:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60702UWS030752
	for <dtrace@lists.linux.dev>; Wed, 7 Jan 2026 02:22:45 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013037.outbound.protection.outlook.com [40.93.196.37])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4besjdb592-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 07 Jan 2026 02:22:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BcQqULJHWYij6lenxT5Tta23LSthnXqephgowfGPX/Tx191XbwUmJcbCV5qkqSRoMSgJddaQsALLVY0SOJ0GBjg6tnD61DYtgYHFqeZQcvC9zEZbBI18WgUdO+Ki2z0ye8THfsirznybHrab062Vb3t/Km6bCltq0WEwFRwuGKj31Cft1hbR0vIOdoMvRCKGxMuIqhZfaZiCqs3nP0OmfO88uOn89UEw0D4+Z/GinTCO+JH+VZTvhQ7EzOJL7DmAVN0oIYr1UohLosbe4a+Uz5Bd1tPnVq1nyiEd7xOPUXAbMOXlCwCxk1bCpUdnK7FwEOyo6HNZGtm++R4Mhntevw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHil7lR1qXmSlUCl7Ty44YLZe05DWDoG/kWy/ADJTUk=;
 b=WGM5HkzmUNuXAMmvsXfd2b69AiYjGKFkj5jtl13ex/V8ZMIutEUCrA67nxv39Nl2R6JgRUIPhjwFta19FBmtfQGdeW6xIlopbjO8hyzaGgaGD4e1rOvqTYYg26Eo2bgOwlo9ttKwnND6cfa4JJYkT0/kdQhLDRUrntQs3q+eBn7cnHcufq2i8NTbTG2SzivBC4dyuue7nmd7smqdsai5r5J81X0GWZQ1+g7K2kpPMptFUKVlv+0O2evB6HaG7NBnYyJ9oa5BnBQg4XZvfPkrSPnahGh2Bxzd9TYY/Nk16RkW+qAtPDAsx7CFxXpBQt/idfRoTvGVjjoly36EAQUU+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHil7lR1qXmSlUCl7Ty44YLZe05DWDoG/kWy/ADJTUk=;
 b=lLEmz005CHwF3UCB17lcu0BLvE0E/GTHIogbFtntg5w6D7iOkm2H6ycHL3LIUlMNkNeuQy5siuIwaSqmzKX1O5z6zKAQh26rK2f7KIbD2aWwC9/x5gZF7+VtfbE6HbnFwb5V7pCk0VP2B+ol6+5K9eCc/EwE0f8edxriYErbCXM=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by LV3PR10MB7865.namprd10.prod.outlook.com (2603:10b6:408:1b8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 02:22:42 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9478.004; Wed, 7 Jan 2026
 02:22:42 +0000
Date: Tue, 6 Jan 2026 21:22:40 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2 2/4] test: correct file permissions
Message-ID: <aV3DcDB9SGJ0acqD@oracle.com>
References: <DS0PR10MB7522B2CF26246FD7189562CFC2A9A@DS0PR10MB7522.namprd10.prod.outlook.com>
 <e872e514-608f-9e06-d05d-146284b27fca@oracle.com>
 <aVyjs1kIbPaulblX@oracle.com>
 <c2a055f2-ab8d-7d8a-5038-354708cdb19a@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c2a055f2-ab8d-7d8a-5038-354708cdb19a@oracle.com>
X-ClientProxiedBy: BLAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:36e::15) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|LV3PR10MB7865:EE_
X-MS-Office365-Filtering-Correlation-Id: be3db71a-4ef0-46a4-ac0b-08de4d93a2ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?qU+LnEgoCj5I2yeXAqCCCHkn1cujjLJCEI6WZLkFnbTe3mFDS7F/G5PKN6?=
 =?iso-8859-1?Q?hiZcwVIlFMqhTUKKCak86iqkidRVvERflzK1uc444AVIqvOvOe8AGu1SKt?=
 =?iso-8859-1?Q?njuvvDrYcsHJ0ogdyrYbvkJ0zyLWCbwMlq3cDUggly9ewdMkEw6AVXOKmf?=
 =?iso-8859-1?Q?OUpEV9XxYYWF9HRNQqTrrn9kbSnAoC0RdfDsnDj1vRC3iL5h3bqzug2PPT?=
 =?iso-8859-1?Q?2c9LcAFgIdBnrtQNbmtiGw+vkiwLNURK2M19zuhlmFdam3KzmFpSgW03DQ?=
 =?iso-8859-1?Q?HIU2fMhKwe7+q6tXN8QAzgdmy+qFfBREXqxQ3bcyheX/RLCoswXqXpb6Qt?=
 =?iso-8859-1?Q?t7u8uiXrBsLbJ/F8waNK4qWGeRc/k0VAHvoDEv/7tPTw2O4SECUDUyLR+V?=
 =?iso-8859-1?Q?yr9ryPOyylz3b7VMDruxBjGerKGogi0aRTmzmtEYN9C77CjJbwfHyX7s2d?=
 =?iso-8859-1?Q?Bkei39MC8zRb6VXvqwTGsCQXM7neD7EID96mbuAQq7te19t7+nwngSTa2o?=
 =?iso-8859-1?Q?b5zL3WR0q4g0TpsbsvGGRQNPicR78VY3aWkdOBjZcNstTwdJQ0exG2fCCU?=
 =?iso-8859-1?Q?tFRi0xjHzuftdk5l7i/eomH4H3nPUcepoygRXgYV6NLLy8M5qn0rx/gPN7?=
 =?iso-8859-1?Q?C0DgWV7bGNJFC2q2dmUALLegX7UZHylaPk0sUiAhUpy8ur3kDW6CDImcom?=
 =?iso-8859-1?Q?r68CtNdcZifkM433GkatJfJfomPJlXfPQ48eD9Mkm05Nkvetvu0bdFETLe?=
 =?iso-8859-1?Q?S2h891Zkn74pvZtvT5XiMl4JjAAxSjzbhtm5nnZgAwQiHhWmKiGWfgxlCF?=
 =?iso-8859-1?Q?g+sPdJGo8HjJvlRyCrlcMtFacpbUGE93tc/bLSBRjICUXLYYRZWXEBfBWM?=
 =?iso-8859-1?Q?/5Q7rMhSOK2TrpQDUEzmwM5hUarIqrBhh+tjdDYy4QwhiEUl5ftlyAF693?=
 =?iso-8859-1?Q?reM+uUO7ESMh968G2yokT2xwUkxCula1uLEwQBdLhMIfWEM8Go0lGFSwYA?=
 =?iso-8859-1?Q?mTZGu4nGQDL8/5094FwXDh+xpD/szcN0p4wJX7QVZeYT2Ol+2HAWtjbh77?=
 =?iso-8859-1?Q?G+0u4nRMxM5envzL8H6QJVPJRXmtO7L8qw6cb1FaiV2JKAY1iV3bxoAP5i?=
 =?iso-8859-1?Q?guryLJvB+U3V9NcT8WG+HcikBTlhJG0fszUn4lniNfprTuwHhdevPgc0ZG?=
 =?iso-8859-1?Q?BwTe1OJThg+t3pglem6FWR5A+/kfVEo07Jw7OWrYcAYoy8zLApl8Ltflqq?=
 =?iso-8859-1?Q?G2bmwt20hlSChBZHCfQdG5eg2pc9TCY1E6bqQroIGnAay+/jb/De4Hd32x?=
 =?iso-8859-1?Q?DMRKpaeaOx8hLR+b7uozseoTzfbJszYj2AGqKzM4hI/pLWOTBctK/9Q42g?=
 =?iso-8859-1?Q?XyI/J/VutC2aXfoJeSdfGGvZqKNIWUdn8X0Hs1iV4sD/eErvtBGCv0vSiq?=
 =?iso-8859-1?Q?9VZwFs8rYSGpZT9X0L1eUsqjncQUFi60owQ48SKkunAn3o3AWBDobosgL2?=
 =?iso-8859-1?Q?T7Xz8jNw5Tk6FFbYKewGHH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?hApFfuxI9fmh4GKvVpgdymCzhLj4tVMPXGTO6KnNAlj6N8FVVQ1sYt6wrJ?=
 =?iso-8859-1?Q?9kT/2UUb9pAFfO8xy6Wm9q7/rkqXMxEDlbKGKzF3WHTXKJbDe1cSUb1rZe?=
 =?iso-8859-1?Q?jp8uHg/xH0H4T9eioY4RRo8V8bKL7xzfZukPSQUYv0NeUP9xgtvjGwzL6B?=
 =?iso-8859-1?Q?w/WfI0tzZbMLcViGhgWzuo89B9TQwNBA448ddCZx/5PCoO0KBidwpOkS3v?=
 =?iso-8859-1?Q?gFnqthGAFaXDyVNvzZK7AyWMCbL2eJzgDXkDquFiz1JHwUro1TWEcgHEq/?=
 =?iso-8859-1?Q?8ib9B5LAIf/o4Urm+NoHGTjcbWDFHBVEnGMY8sRDDq+s6E5qZFI47IJKTH?=
 =?iso-8859-1?Q?fnvuTKF7SA9Rd2E6Ere2llsmgugizx1EaX5v9NZCNl/7QajAoDyv0Ep2tc?=
 =?iso-8859-1?Q?QwRrR2s/+0H1/YjuktYL0Zbg3n8/FY/pV2YalERZUhqz3rvwKU3OZ+sSsY?=
 =?iso-8859-1?Q?uxj2wO98Ga91H8cBrCtN1QaEROa1iKNRNBT7M2WYjTs6/gYsb0i4v7x5eh?=
 =?iso-8859-1?Q?S3vKJs/Xd6Azd75utSKYeYxj1PZN8VnG07sh1hdZuHTMi7hCg4116KO0Rw?=
 =?iso-8859-1?Q?nE8RKyAyAyRYgOQa8BVKKHKN3g0jcrMmySKN5kCYeiCGvc5Jk0293Jb907?=
 =?iso-8859-1?Q?bIPKAfebCMHNhyAXRnveI/uvmOT7b5IDzenvLZpyqxYUvHBGj+Pr/MoH1X?=
 =?iso-8859-1?Q?JB1qgZRxWeJlXKKzi1nhBrDl1z4pdf0S+T9kplOsTnPf1cC3CCc17aeGEF?=
 =?iso-8859-1?Q?lDFomcN3K7OKTZTGONIy7nFaiJUTgtx1Y0AxxBfUVKPXZZYVY9471ufXVi?=
 =?iso-8859-1?Q?11Q6tRkC+/s606lvd4/cRo8qRX/QlBUYT0PlA3ws6vm91WJN3kRRC2yrTY?=
 =?iso-8859-1?Q?zjM2QBbWjMyafoZ0HWNb8vweX6mfR/qU0T5vp8x0s/ZugNKqHW7g9amw2L?=
 =?iso-8859-1?Q?gQ/3Waczb8toX2v06m0tCMALHPXZopUpZd+BF9xt5fWpFPvRbcb6ErtT64?=
 =?iso-8859-1?Q?K6/RUY4qtBUSaiCjz9b9+BRRpGuiXu4WZ0b7mMYp6vKWsiADVfXGq0aiXd?=
 =?iso-8859-1?Q?iIsrS65hCGSMPU5oYQxFp+LPdColP63WFLmXHEECSebxi0iJyaR4hpN1nX?=
 =?iso-8859-1?Q?1PWNBL1JGXtHmK4H2PbD0dsVyqbHXP9H3gm7wDJjUQepSlYWnhsQdUp5Ql?=
 =?iso-8859-1?Q?nL1hNjOHTyAaTZVv6iolBhG5cLI+VjH+9T68kuadrsORYfH5btzxGLDx/q?=
 =?iso-8859-1?Q?nH2rZDdJKrDgKnkSyp7JQPJqoHbdCvHtBpMSi3o5EeA/XKFB3uGiYYyA3N?=
 =?iso-8859-1?Q?XTRkuFDcIdC4yHiVHPPScX3F+SvXr7N4jWS2Druj61PuOZKxaQ9NdiM/Uj?=
 =?iso-8859-1?Q?fNBy0CS8LKzTbNHR/m4+RpDsGHOyltiKoUGHuitnsc10mYBVpPkOQ6bZKw?=
 =?iso-8859-1?Q?Y6pNYmlRkYXtLQwikCo6UdHr/IAc4ncHZRK8grSbIIfhCSNTC8feyI1wfd?=
 =?iso-8859-1?Q?1JixevdfzsVt5Wbz5VZZ/t9gKOBsnTsdNcrQo6Vx/xkDZybdxXo7zxDo8a?=
 =?iso-8859-1?Q?IZjJ9tPUTyhsrOSdrYoAVuRLcFXExjS1hoLRcZiZUjK2FLAtOOyaAD894R?=
 =?iso-8859-1?Q?VLoP8C7WyvnjGss+Qw7tY0ZtfTGSp1dlVwGQHGROzkiBibOmY242JztxWb?=
 =?iso-8859-1?Q?Zzv68pRLYhibZX+EOr6WHiH8NTpmXMAAww6nWebmyMPGYG088IxKBZewFT?=
 =?iso-8859-1?Q?dmpBwwWrbO4Xvtxmzlai9HkXzD1XwGmtR9xa0SnuDsQd+9Dp31y3rdYrN1?=
 =?iso-8859-1?Q?k4PXBq6NtA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5tSyIM3p3vOKcjUEjfnoTBNQkzKXxr22m+EiCrOATp8WresCOWBFwkS3nA7cO8yeOCVLvAEw+5nYuLN0WrJMu7ZOKysrWRDmrYJvp+JDmx2KiW3FkYyvy++fjpEt4XOeNtTf6t7t369pUGKTXJ4/VyCGnenVXr1qxu7ZLpuyJq1U2Y2Sxz7bAxGPOwhrHsZ+scHTseep+xYZh91KZ9WROVd5iXh2RWVbp4ueizOnCq0yjcxktOrWlWnlA42pScrTnkuAfPpZWVzuq5FE+lcnlSFYS0LBNz4hx0csJJakFJXI4T7x9M2aNB75yoBaJw21reKMriHkQK/nZ4hgbud2u6Jk2KHWGUrXg9vgNbT0iawBlWGrs6uNRvdWRsLivhzfpSesGi1uUtyJxIoGa24z7ZZ1TxrSOfYwc+V7yDjUQxI8xIjdVlMmFl38RRWwBYXer/UwKvsF0XVSOzcBZCwIMtxo6BQeKn9kQTIBg1e3ErFWnLMDB6oDE7EiPsASPTlhYiWocZtn36lh4P0pkJWoqjqpssWAiPsq8XYC/UjoICK0cfM5OIPvamxgxgXL47MxxHb7ptWq1qj8xd0CoT4cGjAsoCRKhNaZuJ2L0Xjyxfk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be3db71a-4ef0-46a4-ac0b-08de4d93a2ff
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 02:22:42.5072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vPBKFvtPJGdUqNitX+LtW9PyuegwcOXmT1j/o8vvS1BPRaxEn/wLF6aAorpdPCKKIb1ynBHltutd3qDpfPMMaNXAk3TCRS2DjPaugnjyx+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7865
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601070017
X-Proofpoint-GUID: 1kM53LfNobackhpE5e8vJXOplfF8of5V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDAxOCBTYWx0ZWRfX4BUQS+Z5Q+fB
 EC9XrVJ6WU4Nnp/AAaVR8LVzSgJyz3UrVl9vLWRJNaWGN/3CAeyg2UDSu/xfiXAkyWACoJt6GD2
 9ePhJW4gzAz5eYpJTbhIQIYFPpYUbzajULYIq0kdOYLQHqZ295stahSZGDI1dG8fjn2xPytBye5
 QZJYIQxfJOgCFS7hLochVmsqWNq31zl0qAwkSLnpMgMsyJ6kE9TyAQpj159NhYECrq9iOc/VPZF
 nFgg7mdtZyx10rZ+OEx8kMsPRRwPgI6cirQ8R8MebCTCac0Y3PTOc76yTGx08TeSE0j/VN4qFMj
 vW9FKhFlBYSxrhQX3JSj4oD7Ak5mjrcgGG/EDZHfzIhNPFJI16jSt2NMTKPRZN9/Ze5qXFHdOXI
 GxOQ5NmiCLqCL+J2pTg6FVPPFQTg8PB+Kkmil0UbnZVMFOCrgEutsrYMPXw5xYYA+t/3RlJvHNF
 lSBbWa2FtllkE+Pq9tX5pc+vd9qMgE2ijC0IqAic=
X-Authority-Analysis: v=2.4 cv=KtVAGGWN c=1 sm=1 tr=0 ts=695dc375 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=cVnXRXl-5jiRYNPI2x4A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf
 awl=host:13654
X-Proofpoint-ORIG-GUID: 1kM53LfNobackhpE5e8vJXOplfF8of5V

On Tue, Jan 06, 2026 at 08:20:10PM -0500, Eugene Loh wrote:
> On 1/6/26 00:54, Kris Van Hees wrote:
> 
> > On Mon, Jan 05, 2026 at 11:50:53PM -0500, Eugene Loh wrote:
> > > The patch otherwise reads right to me.  The tests, however, are not happy.
> > > The following tests fail intermittently:
> > > 
> > >      test/demo/script/interp.d
> > >      test/demo/script/tracewrite.d
> > >      test/unittest/lockstat/tst.lockstat-summary.d
> > >      test/unittest/scripting/tst.arg0.d
> > >      test/unittest/scripting/tst.basic.d
> > >      test/unittest/scripting/tst.trace.d
> > > 
> > > These tests fail consistently:
> > >      test/unittest/scripting/tst.assign.d
> > >      test/unittest/scripting/tst.pgid.d
> > >      test/unittest/scripting/tst.pid.d
> > > The problem for these tests is
> > >      -#!/usr/sbin/dtrace -qs
> > >      +#!dtrace -qs
> > > Since these files used to be invoked as scripts, the -q was ignored.  The .r
> > > files relied on that.  So the interpreter files should drop the -q.  That
> > > does not fix them entirely;  it simply makes their failures intermittent.
> > Yes, I caught (I think) all of the opposite cases where I added a pragma to
> > ensure that the -q behaviour was retained, but I don't think I considered the
> > case where the script was not invoked using the #! and that therefore the -q
> > was not actually effective.
> > 
> > > I'll look more at the intermittent failures, but there may be more than one
> > > thing going on there.  (lockstat-summary looks different)
> > Thanks.
> 
> The intermittent failures were weird, but that lockstat-summary.d should
> also fail is just plain insane.  The problem actually appears to be with a
> different patch.  So, I'm withdrawing the "intermittent failure" complaint
> about this patch, which should be ready for a final version.  Elsewhere,
> I'll report on what's really going on.

Yes, I believe it is due to:
	[3/4] bpf: allocate the buffers BPF map to fit highest CPU id

I must have introduced a bug in that patch.
