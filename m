Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C026A57C9F
	for <dtrace@lists.linux.dev>; Sun, 14 Sep 2025 11:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757848717; cv=fail; b=mTW+J4i58Is7jEpA+Cc4Zyf1DkuyW0QDuXn5HehrYjANtbVg/Wrk2WbAZ4T7ailV/AXdGtict9gir42yGWcmlHR5GKozZrEKLcURkEUXJyPKVvJJwlVaRFlrL0FZU4L6/z6DTXm6jFkVppk+TfiGlQWaRF0wt2m30XZ1UyG7n/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757848717; c=relaxed/simple;
	bh=fU9Q46ZzOFkv3X2NpEpoYX6nDf7Qgsoos01rHVCU9EY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=qiQq7tWcRUxI5wwX/Ft9e/ZiAbCLPMSTEunfavlH6AZyh4RnOldpvIfQY8A9fxaMHvqhCNFcogFML85dDFADXM88DDfr9SBFbkRkfHosLthVi80khQ4I1Yyg35xKZi//pEAMr2t3KoNfFa6e7CY2jPVKZJsBHyaoG91tjFcS2Sg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hGH9E68R; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dRy7ScF2; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hGH9E68R";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dRy7ScF2"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58E8U2tM010724
	for <dtrace@lists.linux.dev>; Sun, 14 Sep 2025 11:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=mej+N+QqT4ar6Acb5JxnOt5q/LXHPti1FXNWBQc3zdY=; b=
	hGH9E68RjuJw4lrrZbG/8fvF1z/487AUDXvRK6IqE1lPByAwX54dmMw7X2MaeeqE
	lUa/C6xS9FQJqt5SmOjnWlSlxAJKor8ISICZ9Lku6I86oE9ut26QG1zwdLrGXCkj
	ssoao4OERJ5FKrAVfOCYSOjhDnOD1XZSxnJia/kiYce+DgBK5Z6RqY9P91o4bCdc
	gdCToafbBSABdZnwfS54OhGFN8OGCq+BLzVeEiJOalktybon0SRD17XwzJ4L3Z7s
	/2yYva96dHXrefbajxvBmfv2qTWG5nnbRnnETGra/JMaSJ1TJtaNrCLtCfY20eMi
	z6Nl/Yzx621RW3NsGfKiOg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49507w0x5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 14 Sep 2025 11:18:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58E7OJmX037393
	for <dtrace@lists.linux.dev>; Sun, 14 Sep 2025 11:18:28 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013049.outbound.protection.outlook.com [40.93.201.49])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 494y2gb1uw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 14 Sep 2025 11:18:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytMA+I+iNV2+CP/dZSSqNal+N4shRAwngscLBsb9v1FFWY0Yr+5jQD3GUrnbqQXiuuKwE9yZNpd6BV+/i9ORl+TNzdtx/4e29MAbbyNwfJrQWtylrbcRtCrLIgge3Q9RrmS1SUqs7MIDnYxWJ5uoiERwMfcZrPqvzjsint+bXVPXGAgCR8aj8Anzl68M3hXmKaUR9WAxv4dAbF+nG//uidBk1hXim2FCs+yDDZBq19n4I1ikuFNt2gNtD434PbOJFlNoZe/K9Z0FK/0grfaWOeY3xJf7oB1621RYQK/6XPDmPRZeFgqexEel7hpCo0tId73GUIat+PBHzqxQPxh+pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mej+N+QqT4ar6Acb5JxnOt5q/LXHPti1FXNWBQc3zdY=;
 b=tzqNktP8tPFkSkGsIUUnRyLPxSJKhD65ZHCtZdxalr2EQy1jQNWE7h5mgaNi/DOETf0EOSFywu8iBbOjuHYkwj+Ko7isKI1ygywg6jbxtCoNMWmO8SEwfTJzStcfDm9L+QDsXBwp/M40vV9CnMHyqsXh6ovp3ow3FHV0UYPO5CxgUChQcscJghQ140H75mC8SifWIbqjivprG+/z2r32MNqmNqGBBJTqoiswEztRkGIe638dKDRM13cAVKQwwknzlRjacstaw6XJ4uJIyNunCo2UqrB2nYOq/6Mx7sVTJE40N2/X+vSM1rjkeOSJgzS3nO3kzMCnVjEliui9xpmjJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mej+N+QqT4ar6Acb5JxnOt5q/LXHPti1FXNWBQc3zdY=;
 b=dRy7ScF2srWoLt4+B+eV7JX4HDvrB9T6xog3F3nnZjhh2oHHlN01YRJztpIkKF+jhXhIWf5I9lPEqKMeX2Oy9oTZaduGYVcxzy1qwFxo8Zzj1RqrmgKAUuCyKnfjzs7tl/fRr9IoQZOPpvXTZni2U8gY4+K/NiEehDv7BThjpSw=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by SN7PR10MB6285.namprd10.prod.outlook.com
 (2603:10b6:806:26f::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Sun, 14 Sep
 2025 11:18:25 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3%8]) with mapi id 15.20.9094.021; Sun, 14 Sep 2025
 11:18:25 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 4/4] test: Do not depend on ext4
References: <20241004044355.25870-1-eugene.loh@oracle.com>
	<20241004044355.25870-4-eugene.loh@oracle.com>
	<ZxwKuCIs1atplKFL@kvh-deb-bpf.us.oracle.com>
	<9c8bfb58-6d34-07d8-243b-691fc62df38f@oracle.com>
Emacs: anything free is worth what you paid for it.
Date: Sun, 14 Sep 2025 12:18:20 +0100
In-Reply-To: <9c8bfb58-6d34-07d8-243b-691fc62df38f@oracle.com> (Eugene Loh's
	message of "Wed, 30 Oct 2024 16:14:54 -0400")
Message-ID: <87348pxoxv.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO2P265CA0467.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::23) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|SN7PR10MB6285:EE_
X-MS-Office365-Filtering-Correlation-Id: f5e2f325-44fb-4e8a-4de2-08ddf3806c44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3IxZ21oZElDT25DQWlneVc5VFozbGJ2VEZMcHgrUGFiNEQ4R2pqbmZZcFpQ?=
 =?utf-8?B?ZzNuTnRwaHBkYWhseUFTVUVLTGJhWXJXTWwvN0J6ZWpnL2p4NXIvZ2pXUVZ3?=
 =?utf-8?B?NUp6d1dhOUc2ODhRQnZyMzQyZkFPTFZ0Y3phYlpmTHkwNHhJSEFTejR0bXlh?=
 =?utf-8?B?Uy9oeVNaYjROOWxCeHZhWmpPeW9VRkJ6QWVpMzlvWUM5SndyQ1dYWmZZNkQ0?=
 =?utf-8?B?dzlZTGtWOXR1eXovZjZxcnNCREwzbld5b1lwSm1TamNEanZQaGlNb3B6dERq?=
 =?utf-8?B?a2NHMm91d0VjRDlqZVJFdklNQlFQTVZOQXcrU0N2ZFlWT3ROSTd6SXorVVd0?=
 =?utf-8?B?MDBabkRrK2RBYnJ2UkI2eVZGajkxQjhRakMzcVZWdDUrcllLRGJyWDFsZTJQ?=
 =?utf-8?B?RWhBcHJaTCtnZW1aNVEwdVZYcXFyQUcxSFZoVGdjeHhJeEVmVngyZCszdkFE?=
 =?utf-8?B?VmU4Zy9ETUd1cXFVMFRvTnRuSFFUSDN2Zi9jVkYwUnpzWUV2TGRiRnRXTjJF?=
 =?utf-8?B?NkpLRDBieitIRGhTOHBrQXdSWEN1LzExNWpGL2cveUNVeTVzT3VKblRvOWk5?=
 =?utf-8?B?a1Y3WmdzSGl4TXNEMC9zVzF4Z3ZLN0xPaHlYRlI0ZGJsVzhWREZLT1pweFV5?=
 =?utf-8?B?c0hTWjllNEJ6OXFEamp0a1hnT0hZcEVtMVU0TFNsSXNRUTZIVW1IQzdhMUoy?=
 =?utf-8?B?RnVRS2xwNFppK2U0bThzTWNNdkMwc05DWE51ME9uSy9YY2R6dHVoWXBZNXZh?=
 =?utf-8?B?THh5VjhDdzdLZEJ4Z3h0SU9iR1B0Zi9MQ2YwbUxNc0VENk45WGduTVBySThh?=
 =?utf-8?B?MHRoNmhqVjZrTHNweXlyTysreGN3NlIwWlNlTUl6RVV2SnpGTEtaZ3NuV090?=
 =?utf-8?B?VUl4Rjc5blJ0RzlCQWpLM0pZa2VjVllpR25BK2U5MWM4RkxyMWpUNTNkajVN?=
 =?utf-8?B?MVpRVnZHSXhtT01RTTNtTENlUDlGWjA2ekgwQUs1bGd5UnQzb1doYmN2QzFT?=
 =?utf-8?B?MUNIbmNHdGkvQ2tQVWtOWGtGd3dRSjZ5ZnczYUlUTXZPOFc2a2IrYXNUTlRH?=
 =?utf-8?B?WEZyTHZmUG1IemFDajI3Vm40UmhvUFVHWVhtaHloSEJSdXNQaXR3Rk13WWRn?=
 =?utf-8?B?bkovZG1kekdtUldvbGViem1rVE5qdVJjWXFiaDZSVjRjUHA4MG81TjI5aUlQ?=
 =?utf-8?B?STFvRkJRSTlrTTQxR2xOMjF6YzQzSC9XTWMwZ3hRbzdnRmFUMUE2TVE0YW1Y?=
 =?utf-8?B?cVRqOXROeTFmMHMwWmc4Wk1aYjI5NUJNbUZ6Qy8vbDhwN1FCWHZvMUZtTFdt?=
 =?utf-8?B?K1R1aU44T2tOSEhUMGkwWWRSUHJjcmNEeXhjcmdZSDUvTmRzcytOMUVyWmZS?=
 =?utf-8?B?NUpVeHdCSUE2Um1SR3p3YjgvMEt2WWlpQkdiL1U4KzNkL0JIRkFoS3REc1Q3?=
 =?utf-8?B?SXpoVmJJbHVpaDRlRzUxQ0V4aFJZdkhNNlNSY1VoaktVcnBtMGRuZTNyL1o2?=
 =?utf-8?B?eWdMd1F1RzdnODlrTjdUTXN0RXBUK2hORUlUQUtkYWdlSGVWTGFhV1BnNitJ?=
 =?utf-8?B?Z2pLZTU2S0xQVERmTXpvT1JadlVqVzlMWWN5b2NWL05rOFJKMTljUlMrV3RD?=
 =?utf-8?B?L2lSdFk5SkVNWlJBSEtKbEdwOUt1L1dCNVRZR3Nvd2tFRjFkMjVJQkI0RXN1?=
 =?utf-8?B?dVR0RWZCQzU0K2V4SDR3Q1QvblpiWXFEbkRuamFVSzRDRFlqb2ZJemNRSEVZ?=
 =?utf-8?B?TUtvYlpwTEJ5SGVRdFh5ZnVjNENkVytuM2JYMHRvVjRFeVJIckJ0V2lNOVY1?=
 =?utf-8?B?WGpwSXBqbG90TVhaWEFmZFJ6K3VEb3pOc3RvbWZHUDNJa3dZRk1VWFMrV1dr?=
 =?utf-8?B?MXFSbjZuTWI1c2hKdURkaHFFRGNZWXA3YXRRM1dGOVJXM1JQZC9aa0JHeXBP?=
 =?utf-8?Q?f/HVN0hrNZo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWdpakZyM0tiNlpOa3RqQ2lEZ0lycENWemxsdnQwMXBJUHpEOGZwS3RWOXgw?=
 =?utf-8?B?dVUvTFR2WW5BVzhvc3gxcENQQjFnOXRPenJQT0JPTHhhcmc0dzBkczNLeW5k?=
 =?utf-8?B?Ly9qZXZNM2hWZWxJbFlnZWQxaGM1aXgxTUhQUjF4OUYrZFJpeXRxVXg1VDVC?=
 =?utf-8?B?S2QxU1kxZmpHU2R1Tjc0V3l3TnlrVjYxTG1LN3UwdmdhQ0tLWUtoTUZlVzl3?=
 =?utf-8?B?cFkvK1Z4djNldlA5VHpnd0hrZDkxamFETWpYQnhGQm03Rm1zc1g4RVlrUmNG?=
 =?utf-8?B?clBGZkplWUJYMDR3bi9mYWFmV0NVcmc4RG1TNXdVTVB1QWoxeVlPd2IvUDh1?=
 =?utf-8?B?d0J2bXQvMW9LTWoxNnhsY3hVZ2ljTHpSNWJ3V1llK2ZGQWwzMTJPUnNFOUd4?=
 =?utf-8?B?QzdhWVdnaTluSEdiWUdMemR3YXdlOTVFMHVaWUpmb01DYktTRW1ucHF4ZzBy?=
 =?utf-8?B?WDRCUzdzdFhMdWZFOENveUVWMllXVC9GVGY1ZHhsU2tLRmErVkN4NXVjcStW?=
 =?utf-8?B?RVUzeEswYnpnNWwvbkdxSHNwbnVsY3BKZDRtUENWcmhDeUhhYnhUOXdSSXlm?=
 =?utf-8?B?UlJlODZmWXM1RE5TWXYwODhvRjRZWGFuOWxNeW1kZmFGSDVHbS8ycGw4MlpL?=
 =?utf-8?B?RXRZOTBRQkZzZ212UVd5NGtFUGoyYTdsUG1OSWh6MkF2L3JUUm0zUm1jSGFZ?=
 =?utf-8?B?OElSUndjOG5waFRLL01pcHAvWUE2bTQxaTNBOU9OWGI3NmRCbkU4cmtmLy9W?=
 =?utf-8?B?aG16R1ZRUFlpTXgvOXJzUDVwb1AwM2llcmVBU25LZUJWWTA3aTBJRnBZeHVl?=
 =?utf-8?B?dXBQU0JCMytlZlBYNnM2Vm52S28rSXprNG1IY3djTFlTQVNiUUMvRThvWndy?=
 =?utf-8?B?OWtZVEtLTGRVRjI5dDlBRThxQ3RWUU0xaldXWVlxRGdBZE9NS0lhQW1UWUhz?=
 =?utf-8?B?UHZOcHVCV2JkMms1WjBBR2xoVDdKWXFpVXJPRWpnV1gvMUFKblM0V2ZUTzFZ?=
 =?utf-8?B?WmpUOGYvdDdTNjhXR1FZN1ZuendsM1VKNHo5L1NMa2VuaGNUdXp0SVA3SWhV?=
 =?utf-8?B?V2RjcXU5YkFJRzZCWk0rdDdVOHFaeXYvK00zRGtKVXRNTzIwOUhveUJTdXgw?=
 =?utf-8?B?aHArVTdqM29pOW9YQ0czTlRmaCtwQ1c1SDMzUkZDK0ZQU3dtQVNPZ1hscCtX?=
 =?utf-8?B?TUdRWThlT1BDOE5QNEZEZUxOQW5sOFFLdTY5RTlSNmVBK3RNVEl6R2ZqRFQ2?=
 =?utf-8?B?dnVlVWdheC9tbk9LVWYyemloanZHdWxrUGlOcUF1VEhGWGZRVVdGSU9OTDVD?=
 =?utf-8?B?SEJlajZtekJXMGozRXRkRzdabkVRM05abkF6K3p2eVJyWjlPODR0UzN5Wm9m?=
 =?utf-8?B?aUswbExxMitkNUFJVFpZQlZHdFQrVmkrUFR1NWFQbDZrL3pMN3hOYXFscDBn?=
 =?utf-8?B?MGQxV01sUXM3UWFGWWZpWG40cjZuN2ZWbzNvTnY5RDlGYk9kOXJscjZTZjdl?=
 =?utf-8?B?aDBMQzhodWthWk1zejZaV1hYZWVyQVowUFQwZEZiSkp4MGNSaXhCeU1uUlJv?=
 =?utf-8?B?VEg2LzBUSmRKbitPRWJLL04rUVhNVHZRdWxiUTFOcVlUV3ZMUUUwUExSRVdn?=
 =?utf-8?B?UTNWSHhMR0FYUG4xSWt5WjFocU5DR1orVm1QTHAydUIvSHEwVUxoSmZ2bXZK?=
 =?utf-8?B?L1ljQk51SDNWU0dqQkJEaCtLRHJPNVpGd3ZTUFBQbC9zZ1ZRSnRUZkVKQnF4?=
 =?utf-8?B?UmJid2VTM1dJdjc4Yk4vS3lkRytmN3IxTVIyOStSMHdjQzk0aDhqczR1YURx?=
 =?utf-8?B?UEQ5aEZVYXhkOURkK1NZSDdJdGx4TnJ2OWtDdXpkeGxrcXplUWE5L2ovdzdE?=
 =?utf-8?B?Y0VLQTFJSTlEWG1rMWVSTVVHZTI2V2pKeUNQbjFYcUwwUEFTeGhhUlhteVUz?=
 =?utf-8?B?dGhYT3pkMzNsbmlaYTJ1Mjh6MGNjRFdnS0NneUN4bGlld2phbkJuYWwxU3JX?=
 =?utf-8?B?YVNub1Q5eW9uZzhKelJjYTlmSTRhOUwyS3BKUkorUTNtcjFUckc2aTl4Vlpt?=
 =?utf-8?B?dWpkcEhDNDE1Rnd0SCtBbmVSUzR1MkJZYlBNdHBGeXNJaXJZekdqVjdBQlpi?=
 =?utf-8?B?ZkRDVHhWWVkrV2xGR1dJZ0ZFTnMxMFpmQkFVaHZMK0ZHVHdxVHpBandZK2tu?=
 =?utf-8?B?ZkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WP0oDSjWpCm8o9S6HxqJPNx8YeXgcECCykwb/iwPlKLWJcZ7oc5+3Gt+csQ4jOGBvGiaJnOgZnWmONL2fFRQBIZ/aPykGe60uIH+pQIWIQAx0KoZESgQgLmQVOFrSv5VPM2VOMGoogwCH2B9rk3c9cRJIW24cHDIRCPvY2wWvHlf3ezeaE+P97pYYMXOOtO4/vnHowJiSJXq6eqp5qQcf7bufXa2FxeQhZFv1BKcJKckkv5vd5u8sSykBDernzG8zKkS91QRszOT5g5FMvr69+u15o6qejf8yeWW3eIMICdGCaoJqMtT6Tw4kW2C/Ac9B1RZSnAgYM7+XreGtrCEFnEVoGzLs/I25AWVtH0KTg2xdNuuw/iZQNYtMQ+NaDkpTmaOzlyryLSjJOexphnb4FdUIOivvxDIGEaQucY+OQo72XRPgbOUlApOcaBfdsZB5g3F27QDXn8sK2knJi8cOeGlHuyi+DIEsAv11J3M9sSfWcvmFOy/ZBqYhXo0xRC2aVd600F63b8woo1oQhroj2ZU6yj4WtMuZ2RWtgMj15bX7Ml81ht96ZRUrINOeV1BO8Mzr1T10DkyU6FAYg9anwsA80fhudBgwBIWJBKgNAw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5e2f325-44fb-4e8a-4de2-08ddf3806c44
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2025 11:18:25.6099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nLjQ1FIEumIgay6hOjU4/eWsxRaY5Abnl54Yqb9CCSOPjE+PLvVeGFSvaaFz5iP/KNriJSDfL3i2uJOyaezvYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6285
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509140107
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyNSBTYWx0ZWRfX3U6cSR+dwD31
 bwDhS2dAo3s0m1tGivLZByfjaLZiXCpD9utIxPULIaKV6N6SoWq+sxWi7BWWE6/ukXrj4FLijLy
 9B/Q9hGXl2idnY/Vu2aq0BguQJs4L1BN02p8fs9Ai48lxqnW34hjir+Wo+WKPNPJ/N14ZFdqNaX
 3JFGKsPqhwSBYM2xv7QSnL78zamtxgonzi/RKgbOgS4Y5+6+gF/h4RkbnvPeWJwzweeMaa5ou6C
 wyhdlTcjBjRFEdZHq9WUx72ouR5EW5+8EZ8rgcHfuOPNvmwv2suMsy30NYJJUrdGVEGPMw9h5gC
 8KWU68FhONnxJkBYvB5cJBfgZwizRQV0cmXtJrAxIbmjZFPutYXWGM9DY1+cEVoxeFb3eFkbkZ4
 zObsvmedbArvVAi5K/bxCVqUYj0SPA==
X-Proofpoint-ORIG-GUID: 9n4boYLHvgyOWl4T3KCYelZ_YjMUB2ML
X-Authority-Analysis: v=2.4 cv=RtPFLDmK c=1 sm=1 tr=0 ts=68c6a485 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=ON_vxIAW2XHK4o7xpwkA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12083
X-Proofpoint-GUID: 9n4boYLHvgyOWl4T3KCYelZ_YjMUB2ML

On 30 Oct 2024, Eugene Loh stated:

> E.g.,
> =C2=A0=C2=A0=C2=A0 $ uname -r
> =C2=A0=C2=A0=C2=A0 5.15.0-205.149.5.1.el9uek.aarch64
> =C2=A0=C2=A0=C2=A0 $ sudo grep ext4_dir_operations /proc/kallmodsyms
> =C2=A0=C2=A0=C2=A0=C2=A0 ffffc45a59d9ee88 100 D ext4_dir_operations
> =C2=A0=C2=A0=C2=A0=C2=A0 $ sudo awk '/ext4/ { print NF }' /proc/kallmodsy=
ms | uniq -c
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2342 4
> =C2=A0=C2=A0=C2=A0 $ sudo grep -w ext4 /proc/kallmodsyms

Something is presumably wrong there -- ext4 should always be considered
a built-in module if it's built in, that's what built-in modules *are*,
things that might be being built as modules but aren't.

i.e. this test is working as intended and pointing out a real bug :)
whether it's one we care about is another matter.

> So, lots of ext4 symbols (including ext4_dir_operations) but none of them=
 are [ext4].=C2=A0 Bug in... kallmodsyms?
>
> On 10/25/24 17:16, Kris Van Hees wrote:
>> I am not too sure about this patch...  We are not using kallmodsyms anym=
ore
>> for newer kernels, and on older kernels that symbol certainly be listed =
as
>> [ext4].  So, if ext4_dir_operations *is* in the ext4 module code (compil=
ed in
>> or loadable), then the proper ref to it would be ext4`ext4_dir_operation=
s.
>> So the test should be able to use that - if not, that seems like a bug r=
ather
>> than something to change in the test?

Yes.

>> On Fri, Oct 04, 2024 at 12:43:55AM -0400, eugene.loh@oracle.com wrote:
>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>
>>> It is possible that there is no ext4 module, whether built-in or otherw=
ise,
>>> even if its symbols are present.  E.g.,

That wasn't true in the kallmodsyms world I wrote this for.

>>>      # grep ext4_dir_operations /proc/kallmodsyms
>>>      ffffc45a59d9ee88 100 D ext4_dir_operations
>>>      # grep -w ext4 /proc/kallmodsyms
>>>      #
>>>
>>> Meanwhile, in
>>>      ab883bae "tests, io, scalars: use kallsyms instead of kallmodsyms =
where possible"
>>> we read:
>>>      scalars/tst.misc.x needs adjusting to check for the presence of th=
e actual
>>>      symbols we are looking up, since the modules might well be built-i=
n, and
>>>      thus not show up in /proc/kallsyms.
>>>
>>> With that patch, in test/unittest/scalars/tst.misc.x, we check:
>>>     -if ! $(grep -qw ext4 /proc/kallmodsyms); then
>>>     +if ! grep -qw ext4_dir_operations /proc/kallsyms; then
>>>          exit 1
>>>      fi
>>>
>>> So it is possible for us to find
>>>          `ext4_dir_operations
>>> but not
>>>      ext4`ext4_dir_operations
>>>
>>> Change the .d script to look simply for `ext4_dir_operations.
>>>
>>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>>> ---
>>>   test/unittest/scalars/tst.misc.d | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/test/unittest/scalars/tst.misc.d b/test/unittest/scalars/t=
st.misc.d
>>> index 60edab45e..6a5f4ae2e 100644
>>> --- a/test/unittest/scalars/tst.misc.d
>>> +++ b/test/unittest/scalars/tst.misc.d
>>> @@ -20,7 +20,7 @@
>>>   BEGIN
>>>   {
>>>   	printf("\nr_cpu_ids =3D 0x%x\n", `nr_cpu_ids);
>>> -	printf("ext4`ext4_dir_operations =3D %p\n", &ext4`ext4_dir_operations=
);
>>> +	printf("ext4`ext4_dir_operations =3D %p\n", &`ext4_dir_operations);
>>>   	printf("isofs`isofs_dir_operations =3D %p\n", &isofs`isofs_dir_opera=
tions);
>>>   	printf("vmlinux`major_names =3D %p\n", &vmlinux`major_names);
>>>   	x =3D 123;
>>> -- 2.43.5
>>>

--=20
NULL && (void)
