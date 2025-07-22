Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB672E9ECA
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 13:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753192314; cv=fail; b=uGQPZFEG2BVKEwBMM0BzsHHIMYBkVLhZ+NSKb2dV2WuWSjcOujthvhLgNDCNvdoMvhyYa0QA8Aa8QpjWVwlQ0KHLMR0PqiqikINpNk04cJEGfC6IDHQpp91Y+7dHlHC43K8JzwTiEJwM826REi+Mwf60JwRQT2o+DNr68L152w0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753192314; c=relaxed/simple;
	bh=njwqU3ECeVIOHNchIq6Qxgy9R/tlC/fXlnPRuY9iT0w=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=r5eVUW0Wyng4kwJk1LXDie2HhlkYYOcNfJhoqjhqYljPotIGKf6EPhHpKHQGjGMYWPNyAuENNggBBpBE7sva8oljbd5fmpHUo7SkzNg36DY0P3/3HQ8L3IAYwdIJ9uCx3sGBNBd5eQw1nZ0KUIO15xl0K6gzMe+WadX2YpXpEok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=pPvPFyrB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CMskzYXU; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="pPvPFyrB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CMskzYXU"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M5TCPF031671
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 13:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=K+TUBYD3Go4jdJRJID
	g5zf40n28R1DaKBF0nF9LZ8Lk=; b=pPvPFyrB/PUKkj/u7H5pjeLWgFTcIH+0Ea
	GxfGWXwT9tMu4l4bZlsl+i7m4DFP7OyWkEDA0mgKiaJuodkPMAav9rMMdASraxyp
	xMvLyQrFAdjRuAG83KvzI9FxdYWodBqMTcGVY6kW4SJOSm/r7+N9R5P0e6wnyrIC
	JL2amUaptj3vLJWef9DwtXTfMKTziOBdMcr3ulZHBNUf6W7ca9gflFzalmf6c6jB
	78VSx9C7jBjGk4fGnlB8YV2arvyC/CouleLKVlMwnV/KY8p+icHoSudJW4m6isnm
	NAjxktrrGLqjspD93f6o0hpXxEddRB2mgTTlEndANCdKG4uNVLUQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 480576n5vw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 13:51:50 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56MCltJg011585
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 13:51:49 GMT
Received: from sj2pr03cu002.outbound.protection.outlook.com (mail-westusazon11013019.outbound.protection.outlook.com [52.101.44.19])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801t9b0xe-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 13:51:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UDB44YNPWt+9bWx+BO9L0lspZJnfflXlJOgZujoi9RQINxfJFXrIs0KYC28D+NTAE9gjfvZrMPXtPgkHmyMmwtN/XB3cQDouwrq7f+2iFzdHmjGM2eaX7amvvKUwuG4itdnNQJ2x9vxMDdGxMrS0la15+TL8etGC+BAe3z4vngPSkEmfOIetzq+oKgRaUyRoZxmKoalVmdPaGCt66jx3Tn1Gw1vbS1hQOW0cZJKnOAN3Fgg6mMtUuRnMpQMRDhDk/ZnhYGXLnjYMgecmSB7wDqOa54okxS0FJ5ptDEIuFD21TfmsErsoeFPzt+8s6HysUSzLxwgwqoilyKWmbEyYrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+TUBYD3Go4jdJRJIDg5zf40n28R1DaKBF0nF9LZ8Lk=;
 b=t/BL38FuV9YhTunIpGlVnhER1fPo+dqDJOjYTfCXHdsvFdp4aCZvJ06uR8ogcpv/94wJIKaiyX4+bjHi4+qFj3SUpfuK99+P8AqulEFyrkVRwueMagkaax3b6n5yV55RbmjQ9r/Mi6l4X9Rla2BXVrHs3JdKeVVELdBcV7AwBRRT9Nw/8/RXcT4QfmjeOd98NjJ7OilUPVmsokGmxZp02CKL1sfFx5YF9bA2dQsmAYIvnE5OQTBU/7SUx8OBYbKZl7QWmCBi+kzvnTUF7H0gNMs66d7G/KovgaHzMYAxTTyhPi5vBJ2U9EY8sSrCzZEzRdXuEv+dHYX/0uTcJ07fSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+TUBYD3Go4jdJRJIDg5zf40n28R1DaKBF0nF9LZ8Lk=;
 b=CMskzYXU4ReOP923+EEdXK+HAE+IxPLqxg+loC8fJVXdfqsWIBc+5+pX4S8MeXb2w7M1WibtpjaUaXSk41f3KQfNCflHYd46/txgSFN9f4QLM1oUe9dpX3oTecJMUzXr7RFLfhrVjBfiNNqKf5JOlBKEC7kD57phu+kU0BBTtKU=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by SJ2PR10MB7559.namprd10.prod.outlook.com (2603:10b6:a03:546::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 13:51:47 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8901.021; Tue, 22 Jul 2025
 13:51:47 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 3/4] test: Update some char-array results files
References: <20250325222521.15224-1-eugene.loh@oracle.com>
	<20250325222521.15224-3-eugene.loh@oracle.com>
Emacs: more than just a Lisp interpreter, a text editor as well!
Date: Tue, 22 Jul 2025 14:51:45 +0100
In-Reply-To: <20250325222521.15224-3-eugene.loh@oracle.com> (eugene loh's
	message of "Tue, 25 Mar 2025 18:25:20 -0400")
Message-ID: <87wm8072q6.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO6P265CA0030.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::20) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|SJ2PR10MB7559:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a4ea67c-f4dd-46c2-25ba-08ddc926e6dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qYD90k9ve5TQLioyTGfwtxkKDaR1LPZwyYlbdur+gW8W20O/awhZ2mfvnMmV?=
 =?us-ascii?Q?NND2gGUCA9bkd/H2CiHFpyExac1C5boVCHI5ZDM0rzJlYPhLfXkVldzejOf5?=
 =?us-ascii?Q?WR7GXIRwiXuP37iC/arsREjjobecCnwFaHg242SXIZMmwETN+X3r2yN42zxL?=
 =?us-ascii?Q?RJN1hne55AYZugmdJTdmJo8bYOXkGD/mFVmrupyxpKHiCy3UJYYrOravVBDJ?=
 =?us-ascii?Q?kZ+xJCKPwDtQ5eHIRcsEd7QP60VvcXmOBIoLKs0FPukTDfuC4zZQURznWiv3?=
 =?us-ascii?Q?Z7t0NC52iwO1wPEL/nA3XXYcsz8i3XBcomBZqUfil1zYXx+dXfCVyrAxYjn7?=
 =?us-ascii?Q?1MfgFTUBo7VukgtcAaHp4T+6hXVpRof/adZxWkRUpUKhSYJ9tWMR+lhz+PvR?=
 =?us-ascii?Q?7JqUmXM6U3TJRwOqn7pG4ykKkbbYjJ0wctYqort/Bkchay0bAF6bZeXPFQPI?=
 =?us-ascii?Q?u8CoiUoyrOkyeFyxjLMhMLUp2ckXtA0FuP0K7aT8tsgyXD2v4eQdFL1ZpRLj?=
 =?us-ascii?Q?xDE0hQ5mz1Zyl/qvRCavHNgtmJPwx/m/ctwPb3oTbTE9gt3Ogr7xzWLyDYHH?=
 =?us-ascii?Q?yDNwK/D46aVKW3xd2uSd12xTgCJdE4xF4zZ5tWj7ikUmIiBFQtNGS9+AN2ys?=
 =?us-ascii?Q?3aJldvBARuheWeeFjZgtDXx5LH5+nNkGJpQ7ErpFBYtvoUKDAH5kGorC9qJe?=
 =?us-ascii?Q?iZzKF5bfA3wUFcRlfVFw7GE794f02DuehGcogMWL0Life+tdmUWYHEu7vg+O?=
 =?us-ascii?Q?1XMYTtrwATSivffrlxfsqNmIrkL70u9Ek2hkXkJrk+vtHUkLv1wmsY5vDGz5?=
 =?us-ascii?Q?l/MIB9KwbxXbaLMDPiE2pLj+w/Nf1sIcoTIgNVm2JScMhC/xI61/H6mAxJxE?=
 =?us-ascii?Q?IIhyuPmxytz5LguOskxyRVjK0snbbhMwqNnnJBQFjpgD5AihWw9NDcqqCqnc?=
 =?us-ascii?Q?ZgLxLJFUgmMwtJIuYDy0sORVRzBXDtmWgpd31EANwJhUA1N2J7CEOy3tW8XM?=
 =?us-ascii?Q?9Rje7ZXGbqCPd3nS2XY+9OZQ/fcTET4L5linkY3AmMqU12A4Tzbfp06Tgtfw?=
 =?us-ascii?Q?55NkhU/p/VRk0pfvElzL2n/EEKxd8Yz77HOimOO2rDG4sRWO3MmW6DpjmhrG?=
 =?us-ascii?Q?vILYrofGwystVVGXP1OP4hoXY1quHVAO+44YewFf0nCkjX3WT942jIAYxZd7?=
 =?us-ascii?Q?JnZJ6aHn8eaxFB+90BPUrjnmUFU8u1R8fG5vCwwU29GEPBrAkjZeA87RZR08?=
 =?us-ascii?Q?JivEhbny7M/CtUUUDtE6HpGRzSa9WwxTp0TRFNKDDpebc+cOQ9TMwVD7n0tB?=
 =?us-ascii?Q?f5HWLoH6potDvTprif2OQzpiTZorq7UGKN/9RGNhsy09nkoPtEIe/98KFQdo?=
 =?us-ascii?Q?gQ9q+4dTqm4cJ+kmZ0LEz25gsIpwTqT6+hwMu+5HY7076teWgxJd7ImhKBeM?=
 =?us-ascii?Q?mAdwMZr/cC8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U1nvem+Wpi1UAmX5ZkV6vCrfDGPnuCbYVjVuZwrl4W5sB1G9mB2mfmySOrWz?=
 =?us-ascii?Q?eJReQT1J3zOuNX2imChY88nX8pmWk45v1mdWW0WqGO2eu4nxEK2AeJqAy+Ih?=
 =?us-ascii?Q?rnNV4SkfR0hqx9SEz5fQJ/g41uSYwN8kRpwLWWEh3xMM3qxCLZWA6cSn8Vzk?=
 =?us-ascii?Q?w5GFP49ajlQ6NfZbq7+0CE6MGAfUbLEe1DwZYieHfcGE1LROIubo0ekFDAWT?=
 =?us-ascii?Q?UFmqpCTLuoO0RNY8Zi6JyeOBX4PL1pUtI0v0xGLZTM42ZDqFnjRgYv2F/wod?=
 =?us-ascii?Q?EVMOG5ygz3bNPO46SLOcvJeuPRurla8l+3QM1Ylv+di7AEMzEOyACsOu/G1u?=
 =?us-ascii?Q?blOk8FBEqWoZ3uj+0b3KcAFlTK8AQUiEl26iDIbZsafk+6WreAdbDHIy6a5D?=
 =?us-ascii?Q?OgZS5of/f/464AhTc+ZW3SdVZPz5PD0GUEHRweGAhZVZdVAThqEiuxXazEAG?=
 =?us-ascii?Q?3SSQ7ahREVUhxl1lQZYBglfR+YwEbYxgx2fypLguTYBLEfMIVN+SAcBRH2hq?=
 =?us-ascii?Q?DRL8qvCzvF+57/MXyTukEiJgWqQuXtpTEoXN5UcfN2qk4KCjisD1kD3udauD?=
 =?us-ascii?Q?gw/Ddq6Q8kqnrcILzHAG9KhSBB2cEAYzRhCf3LQW2OXdE6JhzcUxo7BEAT/1?=
 =?us-ascii?Q?QTFrymPJPR0fkX5nUoFcLY1vGcw/sBmEH+5lxgR/SfI4TSZk3T1WNZfFhay1?=
 =?us-ascii?Q?7BnRFVApyY/XqUs5aXi6DmGH/VZ4l9ras9+goCMxQnZCnf+SjC0cGvFyAORf?=
 =?us-ascii?Q?uDGfgzOMyCtxUdIOnyhZm9a+4ifdqm5pIaYvFgKtmT8oukM3DIVn2Jc+77Vq?=
 =?us-ascii?Q?3fZptgnIpWFu0C7YaxQ1ak/lFuinl6YU/3oDVqjkk2TaM+6jYBAVCEUvQ6q1?=
 =?us-ascii?Q?2mouHmE7SJR8VpdueALpXoRv1rovQEFFZCHex4whmA1givwAGKRxjm4SrGWW?=
 =?us-ascii?Q?BO8wJgSLqjDM/a3rvzdF5IXK4vropeLvC/erjmK+NTc2a45Cuf47+0TFidMF?=
 =?us-ascii?Q?JXa4rq2d6LoovVniU649v8/n3PIlpBwh9TDGEQCiUfhTDt4I5cJv1aX9+/vM?=
 =?us-ascii?Q?09ewqS8qTHdCusNVAXRphQgU9UF/jU1auOcBTqN511BiN+bOnum5ISO9YvxE?=
 =?us-ascii?Q?FuBaAGH4MH/Ow5ajR4IDBq4oM2REbe6jkqtdt+aUy8ij0M/o66cm2eqcGaNT?=
 =?us-ascii?Q?ZVwj+jMLwpuSCooWRmIcb6xQnk2vJGhdWRCx2hTtO1hl0ZGSQ/uhOjOQMWlt?=
 =?us-ascii?Q?xpGHuyjr9KjUe1zbTuxEgh4FkB4SdxG6RBVe19AgSkhVu7W/8ClIsVAYUnmH?=
 =?us-ascii?Q?k8sdrAbAhCW3tu/EuRpx4VWAJFg9Vk1T/dqCTmn1KO2KUcZQzWnPzuF1eOeb?=
 =?us-ascii?Q?4j+ZYrvv4gIKOw6kJuHQ5vMYRmd0tNoTpDsB4ZIegeIYz+CNu37sxESCWKm2?=
 =?us-ascii?Q?ZKlawAjIXJa81pNf4okEy7+cbbyOI2ol1Y/8/xGy5IDZD6g5Rysopnn1KYdo?=
 =?us-ascii?Q?ElQD2sFU4mMZaEYDEtil6LRTV/oGVC27QxsYJr9ABWzCovQ1piO/llU2TtmG?=
 =?us-ascii?Q?gnIXdOB6xMCfuRnEDz3UkbbcAy1qs1RuWcxNNZQghV84xN4NmNYu/GUNYP6H?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ol1lFOg+tQLd8zTxwG7IlwlV6jPmmOy4FbtuzwYNkcSqAe/08x1GHBVg42L+/261Y4rqafGEe0UiZFXHeH5Dg2chWktwCq+Jg59tGMTUqFp7CYtJrRLl5TKcJRS6GkIePQTplr6/BrpxzX2kGconWr/bwZG9IZOigcLpKveeagytCet5Q7DBzrZplg0EJXuNQrsozAD0kfX4ayTF5z4bh50m6WloLoA29QGB2oVuoaSNVgXrAwkmUjGqfUvuihuiBq0100LD8UnaeT2zxiUSKS5CHeogHClsa9nTnETntfZgMgb6wZpQpOulj5xydBaA5N+17iutnDeKGIgxkU/hsW0uRWIs/z/tx4/841iLIkGr/yvgPRnVYKgz7it3xwhfx4oalZSEzOHehu5/UVsRgkSVI7dJu1+7iwU9p6uaxByCdtnyOTT5por+Ji3ZOOKNMyZTpipygrMg6SH5RkQpMPzAiR4GwSKkMikN30fouHhrOqL4AwP3KOg3hgMoz4K/egk3EfL6DBHgACSP9teIKtahEt+TimKPyiuv37dZ22szWUBBXaSH6uVZcj5H/0MBsb6wVRKjqHnp84WhLm3wFNcqeevbvQcQAQmwdU4EIjI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a4ea67c-f4dd-46c2-25ba-08ddc926e6dd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 13:51:47.7040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WQlpPKOgAXe+kNxn/sbkarLXDlKFgoJCTJh5pQeoVeqSLvOVpFYwfaX6gfMS7W/SXSszx6wrSl1hDFWB6LrnXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7559
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507220113
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDExNCBTYWx0ZWRfX/0yfJQPBqFv/
 kdNSNFrZ8krZBPU+XHCBpIrUBnlg/MIcN6QfSxK43Bj4DEfovej7TzF4fJ4+AGetSXp3VR/MsYA
 xD5jPnAoqu/uqaT7jPuVGYTFySZz2Wx7Vr3T2qtTY402cdOfgkrzEFyGgOxO8oWKqQh3qUPOv0w
 lfykTd/ZDq2gN3TZ2WgZH+dOR/SO/zO3kVIVx6Nu1ovH2z/Vjpccm68RzC406mzUw8gTwO5DMTA
 U+Xt+lt0MZKnDX4Ilk3wC9oCnorS27Bix4bJinVGi0dheiP3wMe8KrFRzYWkGpyeeK3BNe0F2Ef
 6FOaSe7ckeXP2nTu/uUQDtkfiP1pKepvKxGP9CGlcX8oWR2Z3LGxk2Mo4bzl8X27Ugxr4/vF1nb
 1XzrZG9dp5UbRbvuSZs2kP8eVn7Ps9kCuxM4hSmVjcRafnuy5utxdPVUFQDj1i687Uxc7aHO
X-Authority-Analysis: v=2.4 cv=doDbC0g4 c=1 sm=1 tr=0 ts=687f9776 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=yMz4bCZL8JP46Gr5jbUA:9
X-Proofpoint-GUID: DV3dzUzsnBO4Y53TeMYkml5tuLpip5qa
X-Proofpoint-ORIG-GUID: DV3dzUzsnBO4Y53TeMYkml5tuLpip5qa

On 25 Mar 2025, eugene loh said:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> A few tests started failing with commit 3a551bfd
> ("trace: fix char-array handling").  Update the results files to
> reflect older behavior, whether on Solaris or with the legacy
> Linux DTrace implementation.

I think this commit didn't get reviewed because nobody understood what
this meant. If tests started failing, why adjust the results to reflect
*older* behaviour (presumably "before that change"?)

Or do you mean that commit 3a551bfd adjusted trace() to work like it
historically did, but one test was missed and needs correspondingly
adjusting?

> Notice that test/unittest/funcs/substr/tst.substr-large-idx.d
> specifies strsize=256.  The older behavior would result in 256
> chars being shown.  We add a results file that includes a 257th
> char.

(the trailing NUL, presumably.)
