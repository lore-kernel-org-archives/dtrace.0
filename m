Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3DE149DE8
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749825226; cv=fail; b=FUQ+wcxs/ubVosbLicM1nhiQtAY4KvDsdLSe9Mid7BOHp0jIVbeENDYmys7WKAv8USBVCfh0kd+zRBCi59dH0GtfvJ9RW71iMv9uuOlYSUcvLSAdXpGGcg0ZMuE2jYSQ8ycdkD4LNUa52sC+qi5MuL/8Bq3i4x7FwLnTIV9KHcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749825226; c=relaxed/simple;
	bh=Q5h6/hV0ePNRntkmBsK7JTPJW5ACRA3B2eLk2UbUpcU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=HfywywSv4st/eyTzT57J+wIxoRcQkmZPTaD8L6sKmW7CLP0Oe/6JbNmWQf/aKnTM39UACvTB1uuhWF6u/rTS8LS8hiv1V2Tq5bdxJiJWJ1aoYglmtsUjW95y3J+Wnd4uaLkAhFSiKv7cIsKun2+OyAVgUDf8TbK5EKiQRd/B1Qc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OTivz4ju; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=A8EXEYEH; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OTivz4ju";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="A8EXEYEH"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DCtaeh032176
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ymHfpSNmFZJWFgcm/9
	t8IfQYR+c0ZDeqwB6l1Dslrto=; b=OTivz4juQiSQdz9EhQqk2kNCFac9TVas1M
	uC3U/W+KgdIZERVs70AggaE1+mTn90Dh4i9nFr8EyjpnfoCuK2B7dMuv9V/8lDC4
	eRCn2Xr1cE0Tz27H/ULxLZ5BZCjRPT2zdo/zYP1Yl2K6NR/aF9LO3fIkBTOCyFXy
	ZLOyH6v/svuah9/n/X5Vt4NCQnqeXS3POATE2mIWB0HUDpwekD+yQM7Ma3sH7MRP
	Ur9lAieqMAxWwDTyU9Narlzx3xwN+abs/jUK7C7abV7lELAJQjEKR1iPyDhneiOM
	nM70MrtVKT7ZLg5SzsO31Fq6gFuFtRidnqGVZOXPGitK+4D/LCIQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c753qj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:33:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55DD6M75013420
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:33:42 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bvcr2e2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:33:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSTH29dYZxEDqVjxhk7V8HM4f9pQ5PJ9TTWv25s7FGvNzIqtXQDWX5JYZKkL6OFwTgHOnTRuxdCMBIMY+Aafh+RXRRp1FZH3h1ArTqxcv/SdKoXCYjTKlCywQ4w8jHfUmURxwO+T7jRO62CTlfWpBySxaNtrRA7gzxSEUZSoKRU7yGOMWd0wh3lMgYPM633tmlNd36CpnUJtmnk5UhdgWbrYOaSmMA/+BBzwJ5TssJ/ZeluxH1MLKoosNIIE6BSpmqFr/wLTxLCrjdBuDYGqtmhSF4ZZDhD0BCZ/5UIWatSwvTihT3HClaupdP+ARaXXuRgeLqUxMdb2bIF+okGE0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymHfpSNmFZJWFgcm/9t8IfQYR+c0ZDeqwB6l1Dslrto=;
 b=Kbu5G+6OuyHRnvCvECSdlKmWp4ilr7jEB964lcKJSs6jizNmowVc1UlEMl7G4VpzGo4TsuYwZEFeAnAqQgxnvpX/S9WoKYUaLF9kPbyffdEUrxyYhWWIgYO5e+nef58qmXRjs2XlVWA9OarCIxU02588hgZELSyhpBqKRY1qcy9znq1zIYe781x8wyfffyzyZsOLjhWQFFRjCJ3ntPdQb/r5JRCuYM46jBG6rs5kra+XOtmm2MAcCQegCNQmLrvSU2OejkodILmQhP3lcnTBVOrukCuufe5RN5w4+d+LsAJu1acViGD8YUuc2GkLkjOaymZwFcRFJ+g+eAV4JrY5RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymHfpSNmFZJWFgcm/9t8IfQYR+c0ZDeqwB6l1Dslrto=;
 b=A8EXEYEHcKiDTbFRJAQSoTiJcsXGxxFBZh+TTBEvFYYEce1nCcspa5udIUIyCWrguLUtsKe4h5O2wJtSZYOQTN0PZ3qVqtk1Y7topjrF8/eaoeuHOTNbO6y1UFx2HRORIzAwHgvxqUu4/2MzOFUUpCNwWtAqitxuwymDRMFevp4=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by MW4PR10MB6463.namprd10.prod.outlook.com (2603:10b6:303:220::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Fri, 13 Jun
 2025 14:33:38 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 14:33:38 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 01/14] Fix stack-skip counts for caller and stackdepth
References: <20250522180118.27343-1-eugene.loh@oracle.com>
Emacs: because one operating system isn't enough.
Date: Fri, 13 Jun 2025 15:33:33 +0100
In-Reply-To: <20250522180118.27343-1-eugene.loh@oracle.com> (eugene loh's
	message of "Thu, 22 May 2025 14:01:05 -0400")
Message-ID: <87sek3d83m.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::10) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|MW4PR10MB6463:EE_
X-MS-Office365-Filtering-Correlation-Id: a7d4da82-b9e5-47d7-e154-08ddaa874961
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LV2qrYevTh4LsoxWUHIcGVOH6zCGTk4VjskNUnbd21fP7Q/ClwlTdnWvn4Rd?=
 =?us-ascii?Q?oeXG/Px7Ao9jFYwLKLrHtP3NCMA1G6YLJ+AaBr6wS3TLs9ejHTY6rmHS+z2A?=
 =?us-ascii?Q?AMlkCo0RQ7RLrzaz/ZXA/WFYFQiPKRLikPbaHqJXCWRZBhbC4WCNCrOBbGBV?=
 =?us-ascii?Q?TMYjC0LmDnqX0h5ck84/QdPU7tR6w+GO6fT+CYPcWd7JIW+712Au7D18xpj1?=
 =?us-ascii?Q?3ZYWdIyI+N2gUDxhTWxFZ8IDS92KN3kICgKYXROYenSnMN4xaO4ye7F/5HAu?=
 =?us-ascii?Q?M6ehL6+kfwO8nnbN2kTSekSOtbApwWvVMaI384yanN7haKjD5lTWq70DqH+Y?=
 =?us-ascii?Q?ig1BMTuUgI67NwOkYfynPKjfzuYA2w+q0G94PEOyStNlqOm2Y1YoR8In+fTc?=
 =?us-ascii?Q?TwMWr0b8WIiG3fzWC0Aa/unrzgcvjv0QqySUGmru8ti+/APchlOK6w4VSQOv?=
 =?us-ascii?Q?4DJwipusnRBnZUJ+zbvyVNhMDQbzW9/ijaJ6Z8h3m9k76oVpLrVc81+0gOaR?=
 =?us-ascii?Q?mN1lJAKaQszuZJ6PvGktG4YVjVBfahzYpmL4tfVVK9jBAy0N/HFRm/zr9VLo?=
 =?us-ascii?Q?L8kpnklDxAHw3PqASe4fOKHf1Zhb8j29EE+WPKFKi2XBj3gTdeWfgqp/7vnt?=
 =?us-ascii?Q?e5T5t1uSJBHwMlT+Vn0Ax19AAPyAmErk/d4XOsCMxSRJYdT/vK4uKAY0p5N6?=
 =?us-ascii?Q?dfvZnnEXuKwS03PaPcfS++l6kKFRXDRf+IzI/Ufylp5iLjOqLdG/rVlJPe/s?=
 =?us-ascii?Q?VA4+vtZcdJU5y/6cURxpaYKO7yq0qedwS5G27Fushi6zR65aQ/ipwNbCdUTI?=
 =?us-ascii?Q?tCaykyYpbIGKX0XmVNwHUfaaUefes71UZ7Mzk+TkIvkkE2vYuDFYcVGlMvcf?=
 =?us-ascii?Q?UGCb1dUL5MPhY5n/LItoS9ro7bcREi6/rWkhl2yJYoZmE/x6Y5G5ccqXsUD0?=
 =?us-ascii?Q?1VLQeXV/zo/+8Dvq0nnAcqMeylovsC8Kbn0bdAbefcJroKuVcskcCglLc+X5?=
 =?us-ascii?Q?APngiNkOeRh1J2EOr2rzGkHVZAeQj6DZKU7oW3USliX172ZV6+3v5nu0uNmb?=
 =?us-ascii?Q?UpLgkAK8sKOhO0n3F+NZlVLf//W6j6LT9TNpR7o9YGTdf/7d0t+fiIwUKFt0?=
 =?us-ascii?Q?Nmfhmi4bnsPO7KhKon3dqWEb6fROPrI36gtiC+1MoK3aFG5H3PdW6DAuVRw/?=
 =?us-ascii?Q?IIEXUXNUyb+PEyIW3djr70cjKs2DEq4wPDTWDQ6mRRZCziR+GKhTwP7Mgd2k?=
 =?us-ascii?Q?GGVjYs3SUlk//JSjAKbKEO833uRmHtEXGTFFmN6+eyqzBiNy4Zd5S/uWMwKc?=
 =?us-ascii?Q?Jex1DnF/ntRSm1tjPfprkPgZGBYb1VFHXWOsUGO+qsxWFmcW4b2EIKXgqLSs?=
 =?us-ascii?Q?C4HE0ay9jfhCcxdIBtCZSTPJpZ8WroQgwaIc4znFTo1z1eN9Ahe84qRDl5Wb?=
 =?us-ascii?Q?n27PUzz/ce8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kr3/czFOWauZayc1FBbHPrg7GEHsuVwVQGKbOpUIfg73TDishHbjZ+kb7Pgz?=
 =?us-ascii?Q?9XabmGo309+NY3zgCNXND+sjwKrAYLbTydlmd04DKhAxmS/OJVs6OeSkmKjn?=
 =?us-ascii?Q?CuAEQjGMgLBUp0wVOwzT5WPQedGJznzBvnMja/qvs0dw4Vq/G9BL38m90nr4?=
 =?us-ascii?Q?c7j72VAO/CfFg2ajfjVj+17xd7MDCA2R5bhXl9ALeswafQU/0cAId9TtoVO+?=
 =?us-ascii?Q?w7j81LEpV7xEmE3w38YgqkjaYgC/BDVldNy47jAQd8yCjLe6BtN/d0/1jXN/?=
 =?us-ascii?Q?ddCJ+z2g3MJR3CtCb4WvcAzNCTQD390PoR8VunGmWN6xzmMwWJcw4ixJVxoi?=
 =?us-ascii?Q?FiTod1I6I9KrNK54SP5Rd222eXPtYNavyAya+txhPoFXXmDNKFDldnt6EiiE?=
 =?us-ascii?Q?C4i4Url6H/mBJM8C/bLKtJAwX0AUi3cpoAXzwAqPOZ7Wbe9necb8DFzlKJh1?=
 =?us-ascii?Q?UenS11Vn25hKUCFUrJ5mUfhtOFxnX6vIZxj3RzDIpLTLrxBJNd0/OfdcGq7q?=
 =?us-ascii?Q?5L5plvQTmUS6sJdQQMcHPdsaGfFCxcctMKOvYxSnky1+7suYTuIGqK1sJoZ8?=
 =?us-ascii?Q?GqREeQReyiZGJJFGVrnrkbJkzeBWEjKDyKq7rB6VA3zJFoL6fG/UaDnKK8Ui?=
 =?us-ascii?Q?8yUutaIPwnElW5yPNSQcIbV4aHlw9LbUeEFaXiYWhse/n8QMYzOGTGSK8tJu?=
 =?us-ascii?Q?y5cBngE2XNXeo4z/u9yYEI8coC/lK77b71GP9GrfshwcMMsmQXCRAZzULMQS?=
 =?us-ascii?Q?O8oV+xvkMbq8+E4SP2wB2eiBh9F1EO+eMlsJtMdAUppl70gxjQlYdebmToi4?=
 =?us-ascii?Q?T6bJxSII8ao0D2lfXZgVpfnTeTA6xw3W2VC2ZXFBNPgyZbR4kQeRn3WzrXUA?=
 =?us-ascii?Q?D4hVeR2ig0rVdviVIVMzcj44tIjSthfvFslcLhIv4/7P+P8gLkGzVyPB8Ien?=
 =?us-ascii?Q?saAvvfksqNLa9jGuHD7653hfMog9DqMpSyQ4r0qknofNn9ggfzYmksC0GCij?=
 =?us-ascii?Q?/nfkpltq+K0HiH/bZPP6qn6g6yvVR6dNSeR/Wlbq7qDOdxlVNRbRh760SoZ+?=
 =?us-ascii?Q?RlEdr3Ra1yxuqTI+TRifmBrTaKm3AovfvFBlFveuE8sWyU+xKL1EDDPcvumI?=
 =?us-ascii?Q?dxDWU8KLgNl0o5ZVh63AtGzTedH90zCSw0XJl1GwmXwSSidJakArRcyXHaKO?=
 =?us-ascii?Q?/tBFJoj/CxMPcj/TP+RmAgeCgJhiPd+O0JL0QueOxsrP8JteE2ZrZOr5YNHU?=
 =?us-ascii?Q?O2Tm6k8tHUOH50U59gKMiBpI7wPwuV8ftAYCC/zbVDBk3O4Pc1D+EkqsZFnt?=
 =?us-ascii?Q?NfERvh5wcymiaDC69A0BM8gl4IE2NnIr6BO09mnO0MczlHnSw2DBqzNfQ0Cf?=
 =?us-ascii?Q?Nw2SDTHea5cQvIhBv+5YnKwVtrKeI+FfQsevcjPWcZpvf8CkaAYQhFkfZS7Z?=
 =?us-ascii?Q?PMmuafrEAnIorDkVmO9amuE2N3g6uPfknGvouUuokcbziBfD3kJWwv/RLrO4?=
 =?us-ascii?Q?ot46J1kaP7MHLMRaCVJGnUsPQ6A+dkgFdEM53h3+oV6A0E6aCp3LLkDPMniM?=
 =?us-ascii?Q?u2K7gV2ifdR+N0ZzU3h9GPSbf+BSlDEq1AXfxVUfpdIOb+18PpuCW24Iblf+?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	73aw7/nNzZ6txPaj48iwryafcxCTFDCOr6iDnEUkSlbC4JSjugedFG0zD7N1EUtrv/nKyaDZ1BoaRqvvi0SDk+VY4WJrg4qoMpEEeDyL1U6WGNExGWs0GyZk6V6UAqWj9MpNPSLTRt8cZE7t9j3gDjUl+JeQtr9WGFnaSwJbJiTGGoksAdem33gwehw0AiZIkvwQmFrwy5bbZqwknOZIGf9NqPU3/+9cPakMQnx8HG80hB4fBTeoVuib86Tp3IzFbp6u1E6XmlEyPJb2/VAkFqIE5DNtEx0U+1d835oic9KgVrJKi1H6l0x0gvUSee00Wny5iVlODdvL8HuR2BYInKo4sxTVmVpHbGejRSfF3/VS2PkdtEiq/ejBPiB4bCxUEWxhCDLSOZVJrpCPC867YS9Hkvm+Pv2J/7/6HolnOVDmYWFmzmyH2Pon3Ko7wj2g6Mr5dTL2EUqD7NK5fCZI3g2ip9RoUQQWDWwkxDHlKp8YJuUT5AChfg7aIw4Ud4X4RNQRR+3wMXjrZv22qHtx3YJpByx5bYBXdVD5zkOSsD1VN3h+imEcyeGiPOtNvrW0KxMCwX/O4VKYff+bhjIK/lNUpOklucANkVGSTg4i3WU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d4da82-b9e5-47d7-e154-08ddaa874961
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:33:38.7575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zTMXP7SJnlhbommeSP6XRJ+UcU79J+arQbgJujuSFgq6CA3IUUrUTSQS/sl0nBBH9wpZm3emxggUi8KZ9YeLXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6463
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506130106
X-Authority-Analysis: v=2.4 cv=LIpmQIW9 c=1 sm=1 tr=0 ts=684c36c7 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=WfWFm9nlYvnXhhTMIfkA:9
X-Proofpoint-ORIG-GUID: 6WO_bCFKoJ1xDfw9hY8hsAKOSHlbO0fK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwNiBTYWx0ZWRfX+ewQ1ivJHcVV uju3VshUd7ZZtCdwH51niEgAapdwBRagNpjbxHZqEjcmK0NsVHmqJi8Dxe4T6le/jl3oMjEtW62 L0uoV6nhFIdcsA5fTo9kAsDkx7rYcbxNs1SYLdGBZkaVLAKuhW2xDBTJwVAJDVCIIiuZcpx4X6T
 oGeXQeTNYcEfbd9Mc/JvJ9K1gnnXTDAElGHVDHen7V3/qw6xYZ7jzUNYHmSzILC2qntPCl0HfQD Zfd6Qdcim1YXTWHlJt8V9Qxm2Z8TqrJbNAbstGInx2YL8NGsNiKWnr17y8O6bK3fvXrRkOx5Maz 4DJkL7tD0rVoiNXbViCSqvkV6r50h1+YqsgkxFLeq2BnzQ0RyfpajLkYQjOhQ56I/OSgTEcGxW2
 hTZX99xaeFXYYKkO1N2Wnv43/VZTn8CALAkifZo3cx06Ku+eMnfC1IeEleyez8XesTYGCBx+
X-Proofpoint-GUID: 6WO_bCFKoJ1xDfw9hY8hsAKOSHlbO0fK

On 22 May 2025, eugene loh told this:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> Apparently, when we call the BPF get_stack() helper function,
> it generally knows how many frames to skip to get the real kernel
> stack.  For fentry/fexit, however, this is apparently not the case,
> and commit bc65cb44d
> ("cg: allow providers to specify a skip count for stack retrieval")
> added the ability to skip frames for fentry/fexit probes.
>
> When this "skip" is needed, however, it must must be even deeper
> when we descend further frames, such as when we call dt_bpf_*()
> precompiled functions.

Ack.

> Add this support for dt_bpf_caller() and dt_bpf_stackdepth().
> That is, if there are stack-skip frames, skip yet one more frame
> when inside a bpf/get_bvar.c function.

The general approach here seems sound, but this confuses me. Is the
assumption that if the skip is not needed, get_stack() will itself know
how many frames to skip, and will skip dt_dt_bvar_caller() for you?

(So a zero skip is actually a "the system knows", and a nonzero skip
causes the system to not skip anything, so you have to do all the
skipping yourself?

This behaviour is not documented in bpf_get_stack()'s documentation,
which absolutely does not mean it doesn't do it...)

> Note that we declare the skip count volatile.  The compiler might
> optimize code that uses the STACK_SKIP value, but we will subsequently
> perform relocations that adjust this value.

... why doesn't this apply to every other extern global variable in
get_bvar()? They're all similarly relocated...

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  bpf/get_bvar.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
> index 9625e764e..99a6503d5 100644
> --- a/bpf/get_bvar.c
> +++ b/bpf/get_bvar.c
> @@ -53,12 +53,17 @@ noinline uint64_t dt_bvar_args(const dt_dctx_t *dctx, uint32_t idx)
>  
>  noinline uint64_t dt_bvar_caller(const dt_dctx_t *dctx)
>  {
> -	uint64_t	buf[2] = { 0, };
> +	uint64_t	buf[3] = { 0, };
> +	volatile uint64_t
> +			skip = (uint64_t)(&STACK_SKIP);
>  
>  	if (bpf_get_stack(dctx->ctx, buf, sizeof(buf),
> -			  (uint64_t)(&STACK_SKIP) & BPF_F_SKIP_FIELD_MASK) < 0)
> +			  skip & BPF_F_SKIP_FIELD_MASK) < 0)
>  		return 0;
>  
> +	/* If we had to skip any frames, account for the dt_bvar_caller() frame. */
> +	if (skip)
> +		return buf[2];
>  	return buf[1];
>  }
>  
> @@ -203,9 +208,11 @@ noinline uint64_t dt_bvar_stackdepth(const dt_dctx_t *dctx)
>  	uint32_t	bufsiz = (uint32_t) (uint64_t) (&STKSIZ);
>  	char		*buf = dctx->mem + (uint64_t)(&STACK_OFF);
>  	uint64_t	retv;
> +	volatile uint64_t
> +			skip = (uint64_t)(&STACK_SKIP);
>  
>  	retv = bpf_get_stack(dctx->ctx, buf, bufsiz,
> -			     (uint64_t)(&STACK_SKIP) & BPF_F_SKIP_FIELD_MASK);
> +			     skip & BPF_F_SKIP_FIELD_MASK);
>  	if (retv < 0)
>  		return error(dctx, DTRACEFLT_BADSTACK, 0 /* FIXME */);
>  
> @@ -217,7 +224,11 @@ noinline uint64_t dt_bvar_stackdepth(const dt_dctx_t *dctx)
>  	 * If retv==bufsiz, presumably the stack is larger than what we
>  	 * can retrieve.  But it's also possible that the buffer was exactly
>  	 * large enough.  So, leave it to the user to interpret the result.
> +	 *
> +	 * If we had to skip any frames, account for the dt_bvar_stackdepth() frame.
>  	 */
> +	if (skip)
> +		return retv / sizeof(uint64_t) - 1;
>  	return retv / sizeof(uint64_t);
>  }

-- 
NULL && (void)
