Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811EE1E3DF7
	for <dtrace@lists.linux.dev>; Tue,  3 Dec 2024 11:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733225791; cv=fail; b=VrHT2yNnmOziSBEJQSGMvlxKkArpseZoZi4jkscbsiqZXC5VzquO5z/sDsyeasn6/lhRITanWpPgsgtkpDAtxLPuMQdGyIEAhRm6IMsEYxOlVLwV5fXoAMJAUsCW3xhDeFNkpAdWJ53AhS7Rns6lyimwKbB9kn5UILpwFQwAq+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733225791; c=relaxed/simple;
	bh=/X+4b0erityHbv3i1xHpTYdqZpbdNRc+ShZgIeP/jUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X1R/SMBzlboajRdBkShepwDULzwyybz2Q8cIQRy2pi3XuHerKOppYLaEYC72iWMStvYwS7UkJsB3hkzRLhXf+W9xYlKlpEJReEzbYLU+AloxaV1aUVEi6+FW4rAPwEwi7ENm1C3amXYknWkEAihgITZIPzSppt29/NVK2IVTL+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dRUEPpvD; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wTzf5TIa; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dRUEPpvD";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wTzf5TIa"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B37XZUn005025
	for <dtrace@lists.linux.dev>; Tue, 3 Dec 2024 11:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=WfvhF41l7ai1pPQlC6Dd5l9LZvOuw0InrLRwPCn9lOk=; b=
	dRUEPpvD2XBeTWR+uBHVVfZn8DR2nAUGtYkKrMlQzYy5UtN1PAXYPZB9mDxf+2l0
	f1up3SeGLrLT7CMh13jkCK4/Pylmabrz0Hr/87j/ASiqKm+VI0UmA49lKekTGc9a
	F7P8NLrYkHBODuN1kyQuN0v+1CSqoodun1PNPbgo0NabOkHDGB/O4fu492AgDD6R
	PApd/Y5dX9F8Z4ieX/s9nBzSsc3/kjtBK+TnGujFJwwqdNblrATg4+478g0d9ruS
	TGdiAa7pQPgI+TVVlO8vZnqqIDu3+idc05dArlBaIk9BtKe/0ea8hfvPgv4oCaD9
	q5xUUtEfnlkqB/UVvck8iw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437sg25vv8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Dec 2024 11:36:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3BV4Tb037333
	for <dtrace@lists.linux.dev>; Tue, 3 Dec 2024 11:36:26 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 437s58ad2m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Dec 2024 11:36:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZTRVjCkYPRD2VbpeeeLgypoLgnX07RpphtfENhQAE1LY8Cq0Anqxv1Q/yknvwKdmLBZ1TRKNEW9P6R7GOVe4ty8sRw0L2CucOxuKRSuYa5T26ZYkht7Em/ktP27LzevcjvxrnVquKdi6HnfIyDLG9N1kYoDStxyLHXOwImQB0YgUqm7nfNG08eqBfH0cttHRFePnGh2HXLh0pagO3DePoL/CnDC2j7orcc3zXJj4atr1+ySoy+KN0Gb4nmv7I57CWvpDanxjY3rPT4ZIFE1zC4pmjh7MZR0tbUMTXIfwguCkS8082Usi/Ez0PYm+2MaJoG1U/AM08ySlJD5106Oi1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WfvhF41l7ai1pPQlC6Dd5l9LZvOuw0InrLRwPCn9lOk=;
 b=sudG8dygItMEeeCuXppa7P2KOh0s9GHrfDaI2JMrT0hNwFNivKsmNw9ONV9YTO4CQRQjMrngdwoRP3n5vx6qbsN/QQX+vyghMwsQVF+VrO65K7WfbllqXqQwcHPG9XiKFPgITEilVJBSKiwy3zBmqqkCOOTSkMJj7r/Lps3+PqGl3ZjX0To6zY/2eo5awKr5IVizJoFbWkeO4ji8ck7FkLAEK+xL5W2xB4DtRJoPSEVm5btuG65RzmBKu60Rvnk3xJzDMR2FF3U6rN/auNJrHJ9DtLQLsi54i/4MDRZmgPNf3RXnbB0yhXMJzVBERtGS2c4rzH9z/q2da07h9I01dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfvhF41l7ai1pPQlC6Dd5l9LZvOuw0InrLRwPCn9lOk=;
 b=wTzf5TIatWO4TtWZYhzweheVC+Nzkzd/iQUux82YN91Eg3GwwNF4erydBWai9DMVIYodv2ai5zgx/QbFkR1eI9y/PxWQeQTxTqzJ0n7S6UIW9f5cWYQMI/jgSJCIJGVFXqfZr9QWL4WK2sDbAxUQuhmcQXhSGNTSLMYN3/NR/gY=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by LV3PR10MB8177.namprd10.prod.outlook.com (2603:10b6:408:289::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 11:36:24 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%3]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 11:36:24 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: eugene.loh@oracle.com
Subject: [PATCH 4/5] libproc: guard against Puntrace() of terminated processes
Date: Tue,  3 Dec 2024 11:36:09 +0000
Message-ID: <20241203113610.75104-5-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.47.1.279.g84c5f4e78e
In-Reply-To: <20241203113610.75104-1-nick.alcock@oracle.com>
References: <20241203113610.75104-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0265.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::17) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|LV3PR10MB8177:EE_
X-MS-Office365-Filtering-Correlation-Id: 93ca38b8-d442-4922-8374-08dd138eb7ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wUU8+jBxGrSWf58LTQh1IBnH8R3E7ELmRCMC0sLP7DtmU+BaVQh30rqwdd7z?=
 =?us-ascii?Q?+tyjZZjX262dIZYn5OWiDmkmRpfUbFA/NwqrUCKtZpclzVMyGSmTyEFKbC2B?=
 =?us-ascii?Q?tC5Y3vuXoq3kKp4YDSxxsvpNFl4J7cmExJ3nKvRw5n5h2PztcVULfEtq1Zu1?=
 =?us-ascii?Q?npyy6B9zO8Fj+gBs3XR5Dj2Tb2dxXLzoNouVEp72gCg1dXA6m/TdsNSgvqWA?=
 =?us-ascii?Q?mN0jNbfWaJe+9wClru8qh4IuvZhUs6KSKRjucw/wlKkUj3D4eSyq9GZQ/naB?=
 =?us-ascii?Q?/mAtFl0fVVcSHkGMngjApJytoZ0DV6rSkI6rKwrW7fJMI5sjvGNITCjm7S0I?=
 =?us-ascii?Q?GdkFS3l2cPyhRYi3kPau3QhqzkXo95KBoYQzNmtlUDPekHXAO1Kgn6z2RAd8?=
 =?us-ascii?Q?eSNoDNi4exO0ftJJYiL4Fu5tQb7dTUxxgDs99vsCJOzlvs8HF21UuFlfC8Hz?=
 =?us-ascii?Q?0YC8a/W3vDoBvFjeppt+Ab4HKhFu0g86EggMaczEdvvNDemHbi1e5D5x40XT?=
 =?us-ascii?Q?eXPfnB55+IEXqXxAXEh/SlhS+7RosSGjf+Z8XDNkaB8RxQHwWd6J0r6S2FMr?=
 =?us-ascii?Q?P67ZFLIj/Sy9JA4r/rYb84LXZWiuP3xySIQG5Rtfm1Q/j/pB8Q9XL2Nq1I+j?=
 =?us-ascii?Q?HgHjAbfu0u52oODvoOt9SLsEliVkTpXBXyGUGB2zhAcZoz8SekPeyx4FddJi?=
 =?us-ascii?Q?dowHRTLQhP9xVroWrs7LM6To/eK/92EnzJGVS/DVrHdpOXlD+Rbpv+go8NWy?=
 =?us-ascii?Q?3cAHJszt/cfzo54J2NonafkVItJr7jBjc0V+Lg4iff5JdoPLFH2ke6ToSx/W?=
 =?us-ascii?Q?esMQsGDdGx7s3aHCVd5/Z9X8T8St0cv2VjP7+1Kf9uJT3rqnT+25pXxWTbKQ?=
 =?us-ascii?Q?tnHgmkNUYv097fnYcxq9p3eLFPxo2xskag9Rrbi9RftO6qmlBceqpkH+Z3fI?=
 =?us-ascii?Q?yAJjenRKqkqQnASnXR3IJHu6dHh7GBOOCsf6Z5i/0cAXV+xMUq6kj9O1/Zdn?=
 =?us-ascii?Q?jKRiPdI62aK4gn36LUheveQvssWzM+SXYseDgjoMfoIc3jfrM82ayTbOB4CW?=
 =?us-ascii?Q?Fp5Zh2DqpBVn9apDe2zNnqKJbHRQWlWkXwCKHG5lQ0WZr8+04OnVzZf26w6+?=
 =?us-ascii?Q?83skCG6gAfHBsWGo7wGX/Xfl7ilIQlREZNoRM1chqMJJLSaLjha545rLKNp3?=
 =?us-ascii?Q?fFJKcrDV6SPJuOyWMmsFuWwf3wHmGz6U41TQ0Q6QxTUUxlJ/lvpyqiI35RD3?=
 =?us-ascii?Q?ya1msIcT5txVYwfrXkfKfVUzLwN/Z97H26H+xz2E7B9zVGZFU8nnrAY8IaRK?=
 =?us-ascii?Q?63L9OiAoslT6Ap+sYw37l5bOjIFyENGJyG5vNtaie9uSMw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ll670cQkM+nIF9tmM0K+RbE3OjOcP52LKsqe98T+GS06Q5Z3Fh60JtqfnrLq?=
 =?us-ascii?Q?pKtek/Q/vofnZCJ/cpRH8LmpkuKMF/k6MqQaMvvZw9HkTyB+bLzphBt30OTg?=
 =?us-ascii?Q?WsyQYfxk9xC62YKQwSMxMl3+1OIe6Im7zUvTMRznqw1qZM5A3EUEV7oqrdt9?=
 =?us-ascii?Q?vjW1CxNc6owO76NFb3py3kTbuggB++9omfP2phBOsDG9bxasvRdeOsCdWVv+?=
 =?us-ascii?Q?ZCmAG+/PO8G47ecKkMxGDYorNlDE9CHauvN2gJOU5HfsIa5cVq0KRherRKx6?=
 =?us-ascii?Q?I1+ZKCCa0O5QzJh6AuzE2qx2oxbymuPK9/+XyMV0a8CQJld32MWF984iJt0U?=
 =?us-ascii?Q?csrv2gt8XGApJYztDcr0kPrfXW5k6UailvlTx0o/ba9nlucKXjv7rdXl8uYS?=
 =?us-ascii?Q?1LSCX/IbREtNiIL9iWOkjYsKSBOuRXSBopH49GsiLdcUfDCTkEmH3sqN92TG?=
 =?us-ascii?Q?j85D0gaXCe4nwp3RTE8p4oOO50/rVvm4WPx/bSAhp+8qF3CCKHK5XOHM4OWe?=
 =?us-ascii?Q?aSI9J0ZiLXV29FXC6bhP5nbxH7eXG1EWaBtb/ch7YKfjoj5+oSk0+yCpM6yF?=
 =?us-ascii?Q?rYiP9UH2VK3gACiISR+M9niL1EP8sflDSJFsf5AOTYmWWcAVc7zEtfIkP7Bq?=
 =?us-ascii?Q?jwceunusjZBqvLQKi0GhysR5ON8zDqcNuqnA1ExoAAlpH9di2kHkv9l8dZRi?=
 =?us-ascii?Q?HIFzgB/j22r+lwHimBIUijqW9wpLhsZhxL/uD3N5IFV7CXYJ/TN07+Zxx+Yd?=
 =?us-ascii?Q?/B3o31yW/P7Nn5ASihDLhpD9YtHVQoTEOXNWTPC0hmJJjXG9Faujziubq/CD?=
 =?us-ascii?Q?IV3Ht+gQA2Eco4K7P/o13nrb71Vd5/bioC2aqhLp2zfCPr0VVCdsUHS+YsHz?=
 =?us-ascii?Q?LVTvweb7z17dwKmHwK720A+pu1RMt2tcn4uSOm0qE8mkzJjtpIBnPh7304tE?=
 =?us-ascii?Q?J5QEc4xO2vJ9ooGIWfR/Ojq4Pd0PpI7OgYmfqW0oAyqi3bSv+0dT7BgfwDZn?=
 =?us-ascii?Q?s0fgMdv3Ym/rDbMmTjd3X7u7DrZCBoYy0l8NIvEAlCD5pFRBdQ8aq0hulL2u?=
 =?us-ascii?Q?TDZkD/d2z31v6IThoSG5g8owZS81A31yDe2vDPKbHX4AYO+boECn2xRRXwne?=
 =?us-ascii?Q?CfyRE1hXk8buKEEkM7+LcM9IBqIRi4BytSfBYfpXDhikJYTdecUlgo/AP7ou?=
 =?us-ascii?Q?8tp0xUPLZrCLfq7X+4yYVG17fAMFSUalT/NbR2hu35g18nr3uZ6h4SuBobKW?=
 =?us-ascii?Q?SmOPfbnAjCKZhVEjAOIr05jw4+9O759LaXVP2ha4SmcsJFVGGb5jJSCyrgZc?=
 =?us-ascii?Q?J2tEM0Tv2OdtlGhvS08OrE5nqsNJHlB6O6yNuMMiUKKB8kAv/ojiYnfoWBw5?=
 =?us-ascii?Q?GHGOv8DIaMFW1R/OmCAei8D4oTfwhm0wg8BpMtSLGHD+osaC53Oe+Msue41k?=
 =?us-ascii?Q?p7PB4jlEDGjP50PSuN12Mj0d2Tf6DcZ5JKH5d8DoE1rb6qWBqu+FSzfdBjxY?=
 =?us-ascii?Q?huGs4KBxAC7Rs7abxY+QWGSZwt+r9dZPMVUjyNgseGwKh3TjTnPNaGmnrQZz?=
 =?us-ascii?Q?p2pR3Lcf/NCKCqtKAQ491w1N7WNLkYo2/UV4PvGg3ojkIWS7eqRJ12XxC8Z+?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Hiqn7IguXPDzQCJqo4t/rk9i09AX9oigayJjFxv0kN9HD1pZb8CmKatWsn8Wu3zYOybntfeZl1GOfT2RqwGFeVVS0Xr+W5I4OeoRMzgY+IHSOeCpOlE3bxiQO/LWXZHbVsJeNLzHcLTuz4gaq3n5cygra8nDXse6rrCx4I17dTm6nivM0escrqgq02HW5J6jTBmOwLxfTPPkqobblB22c8PjeomMDztQp60MIuf5EsDv6/Epp5DxSTBv00dTrCESOIy95LjE1X/24ovE3ut588X4iB189lK48R/LK7AO9+4NGK7ebMOSQN0DNebOlDcvlXDPB8KoQN5kgVHFU7mhNjX+80tz7Jkq1z3WejFzcABOskQlPK0IaKEOdGpdNEotNHyrzCmhkNzvQDbtUlM84uengUQgDCXRw0Q0aCYVZSuZzCmvjxqRxU+XUy7QVW1OpGbG5TaSflP+r8oN/a9epW9kzTYqMPuiRXUf+wIL7L+41ko/pD/PXBK16mHN9SerhUBYVmkafxghnfjIfYad4gfWDgHRVQ3eRuSzvX9x6TzyPCllNq++GBa6GAztKDsqzAatafvygxTn3rhF9BUNNQD+FwFZsHn7mWB8rCkQ8zk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93ca38b8-d442-4922-8374-08dd138eb7ab
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 11:36:24.6283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dqzBxEAPOe7YhQscjlckuNwgrE0nadHoikoA/U/bOr/Qcd/udPRySIprTTZutwaLj/VmX/5NkyLuHn6Gq+2Ehw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8177
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-02_14,2024-12-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412030100
X-Proofpoint-ORIG-GUID: acNeDwHCZYluIMvwSowwg9JbkUzniuAb
X-Proofpoint-GUID: acNeDwHCZYluIMvwSowwg9JbkUzniuAb

If processes terminate while the main dtrace thread is doing something in
libproc, the process-control thread will clean up, releasing all resources,
including cancelling all ptraces.  Unfortunately if the main thread is in
the middle of a Ptrace()-related operation at the time, it will finish off
by doing a balancing Puntrace().  This is of course now unbalanced, because
the process cleanup did all the Puntrace()s for us; it will then try to pop
a state vector that has already been freed, yielding a crash that looks like
this:

    at libproc/rtld_db.c:1934
    at libdtrace/dt_pid.c:987
    at libdtrace/dt_pid.c:1265
    rfunc=0x40419e <chewrec>, arg=0x0) at libdtrace/dt_work.c:377

(This can also kick in when DTrace erroneously considers a process dead even
though it isn't, which is actually what happened here: we fix that in a
later commit.)

Fixed by simply checking to see if the process has been Prelease()d in
Puntrace(), and returning early.  The process is released and all
Puntrace()s have already been done: there is nothing left to do.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libproc/Pcontrol.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/libproc/Pcontrol.c b/libproc/Pcontrol.c
index a32a362eaa1fb..6a454ef86bc3b 100644
--- a/libproc/Pcontrol.c
+++ b/libproc/Pcontrol.c
@@ -1455,12 +1455,22 @@ Puntrace(struct ps_prochandle *P, int leave_stopped)
 	int prev_state;
 
 	/*
-	 * Protect against unbalanced Ptrace()/Puntrace().
+	 * Protect against unbalanced Ptrace()/Puntrace() and already-
+	 * terminated processes; operations interrupted by process termination
+	 * might reasonably do a Puntrace() to balance out a previous Ptrace(),
+	 * but everything is freed and we just want to drop out after balancing
+	 * the ptrace() count.
 	 */
 	if ((!P->ptraced) || (P->ptrace_count == 0))
 		return;
 
 	P->ptrace_count--;
+
+	if (P->released) {
+		_dprintf("%i: Puntrace(): early return, process is released\n", P->pid);
+		return;
+	}
+
 	prev_state = Ppop_state(P);
 
 	/*
-- 
2.47.1.279.g84c5f4e78e

