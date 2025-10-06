Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCDB2874F2
	for <dtrace@lists.linux.dev>; Mon,  6 Oct 2025 16:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759767095; cv=fail; b=RCFPpNsniBH3kvajvknJUVQQV9OQJfTo7JWvmKqjNbpUR5HIMPx3O2YdkLN00sZb5JLhZEtc3LgzRZlIg+7j90M+9FMBfwKiyvRPLSiKBEhDNzprz+gsBkXuWJGQENi4iXcAgc2lmWQWFtuWEqH8fZtYbMb9JrG+Oll/Xvy9o8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759767095; c=relaxed/simple;
	bh=a0U21jPsUWHEgbcVhskXSqmD7PW5WBACVbrxbyGiq3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kEZgC9MCZOk3utvwdx6CE5lMUEd/xceR4Hy4X5sZBv2mQNAq0gWGwEG3jMKIze59LWTxJ66JSvPKty9YP5r4kLS6pzsYW9lDkl+NJmdU1pyw0CstltF4qnALqo9zr+Bx+gndgQRLHTCGO5G34FouS7jQl7TiKSq7h79LnptqwMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fwkySScX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=t8VXzZeL; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fwkySScX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="t8VXzZeL"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596G9RbA007536
	for <dtrace@lists.linux.dev>; Mon, 6 Oct 2025 16:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=p0kYO/Cmou0SgRzTGw
	GdsTO8MRNZcjp7I2OpFV8rPGI=; b=fwkySScXfrfx6JgKM5ItGE1Lt6f1EOG/gG
	3oXIhPkkNCG3C7r82dNxAc3Og4L7VqVPPl9Mfk+Z+mrjdKMiReT5/Q7DINh0iwkz
	LI9S/X4/sIsk+RDUZY8q5fictpT4yrTN0Bv+ykfQlRju+IkMkDQlyzFoDc8R48Ok
	X/BB6P3Ivxnk/ymOUCgxYIMQm44kwnKo2uSciAFMd1CAEOsUgtZ8Q6jN9hocQ8no
	4qjbDj4mSG9ORJAS0HILvV6HFRGM2t4sjMnf6fHpVg/3IHPfYymmyJzCKMxVdE49
	2+9zrGHYlS03LQA7XQ46how1LlkliEVREuosbveHZSFESwbZVk7A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49mh1u0058-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Oct 2025 16:11:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 596EaPZs001773
	for <dtrace@lists.linux.dev>; Mon, 6 Oct 2025 16:11:31 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010045.outbound.protection.outlook.com [40.93.198.45])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49jt17a03h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Oct 2025 16:11:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rpi277cHC4lpSavWIOjNMbEBFfjdfGEtN6CuSTZ39+uE3UJ2mB/sqqv0z+JbW+mxoNgQd8BaSbU6xCWKo3QPmhCQDICdj7gU0LZYCHtwIVnbHzXYnsxllqVK0lE0zjQgYeccNEInjwSTRA7WNGgspn4f7ORGYh6/oRq1VnD4RJIlv0DYus+fLwviYRqfLgIHs3cfLeXR4IHD5X5hqLVvzV10uQPCloiRIPsl2FdrSEJRM+x5uvnulYCorOES5QnLQIVzTaDw4JWUD2l0ht8nY/b7HGB/aheIZy26rGAERMA3zVeg2qF0nQ7E+QlpwENPLHwbL0WmcqUjQb+APyVlIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0kYO/Cmou0SgRzTGwGdsTO8MRNZcjp7I2OpFV8rPGI=;
 b=mgL5UfSWc0CnqEQc363FoZ0vAL4OUjPMpvybCl0NsmrojuTQ8JdTyZPtTbkhAqkLoX7rhZaUzojE6jPBapwe8tdFhjv5KEl0uIjBKY4Ajj7JzfZ+Tbide8TPVH5s0NKeM9hbgTHlU6HTJrZ1fq00sJH6sy7pmnpNynaoAN4/B8zW8IVbi0r1w1w0/dKJy/N15r3zPjN7fABBIuBB1G+eiCYfb+Dw60P2CWn8COLs8yTyQ8lYVJikE3m0bcU3G4HngUdyWq0lPmk9/7YYLFVqHnwuIXUdqs9ctY28CQ28cyICpovJFKF69+CRlIWGqCucpFAoZLulUIWCntrlDP0jjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0kYO/Cmou0SgRzTGwGdsTO8MRNZcjp7I2OpFV8rPGI=;
 b=t8VXzZeLDEItOBdMGEAx9vVx+ztjT8LFrQI43JB5gQCTVwNTMVbgWKKjhhOVh8uQGsidiLMT1alc5owiIFyAjakJRS+lBqb5NM7K17keF2guB85hcfO64aevcrrNiV3QUgxZIBe6F18iaNTY7bUNIIcke1cemS0DHIPhrip6xbk=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SJ0PR10MB4814.namprd10.prod.outlook.com (2603:10b6:a03:2d5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 16:11:22 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 16:11:22 +0000
Date: Mon, 6 Oct 2025 12:11:19 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/5] test: nfs: don't require a locking daemon
Message-ID: <aOPqJz+icWdvp0s2@oracle.com>
References: <20251006152829.239100-1-nick.alcock@oracle.com>
 <20251006152829.239100-2-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006152829.239100-2-nick.alcock@oracle.com>
X-ClientProxiedBy: BLAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:36e::14) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SJ0PR10MB4814:EE_
X-MS-Office365-Filtering-Correlation-Id: d9bd1908-75b1-434f-debb-08de04f2fe12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?khapuQLHMoICw84wvx4JXMPj232Ps/9EuRNMgm8zXVqkA2QM1mN1jsTtyv9X?=
 =?us-ascii?Q?aXUNYhm6mEXQ/uhrCmN2WbmKNdP7mziBDoVaMN8kqTyIry8xvyDiSWyf3AIi?=
 =?us-ascii?Q?3fKduFE/l4TwioIzZESpjCqJK+kSul9qhwF3T/9/tK0ITjVUUpDAS9Kk2Nx2?=
 =?us-ascii?Q?ejqBhZaAdv7iQE0nWQbxjXYJ+rJXbZF/FccDgJM4pjNCUgnuiuIa+obgD+Bu?=
 =?us-ascii?Q?HOaFaQsw1+LSYQORQFcqH5vbqdQ/QCX7EhicBE2JvBJe09LPGiP+M/YZzGXP?=
 =?us-ascii?Q?Q61+spwYevYJw5XX2yZ9T41CR0Cc/EPvC/BoMEIGAzYHJBAcFCTTgSkAjBAw?=
 =?us-ascii?Q?alfD/OvTeK+WlPjefO7yKo8faNKE0PttTJWkOMRCRFmnV6uc5/yEv7UNtmlK?=
 =?us-ascii?Q?y3oRp1MBiyJ42JbpuKfDpFV5I9dpcZuEXCCz23f1JOvhF3OSTzYsnz7UoP26?=
 =?us-ascii?Q?6fDqM30RupRnUhEQc/DZbxt5/Z1WnViBxvUI8S6UNBWjU2Tywlp7Wis/IEWF?=
 =?us-ascii?Q?CzBj7NJRxRb8eIv+8ab77IfZ0DEETC1xLr+Dkjebox0TpMkFgYV2oAS9H0FK?=
 =?us-ascii?Q?QUitXRxaTDp81iHdQXWkzNVpMYh293TDJnNm9U1OH9KNKJmFeWD4O2OUsJaf?=
 =?us-ascii?Q?hMOx8yUD3bXVAiEbPGASf5JJvgXkO8ukQ++qZU6ffLUgq5GzUUtx3wozcE+J?=
 =?us-ascii?Q?MVrwyT1nnoMmA1UUSZQsyBlx+Y22YD4lisIgWxMiXdD9dKJ9Te4lRhF9s06h?=
 =?us-ascii?Q?wnBYuatVEx8w89D61TsjAOPbUD7MqCEiD49gATZPiwFTgtRUoWMsqqBvjB/s?=
 =?us-ascii?Q?i/zgtbeHY2EEyEaVc73uiaL4mQRHxYH7OUMQzssLd/3Cp/Gu9dwU/0dH4kh+?=
 =?us-ascii?Q?rUbiZCOnpnzbNaOTOOlOcInvPAvWsxsTiKf31rjL9p+1t2FuHBPxj4+1cyPp?=
 =?us-ascii?Q?Vo29YsOpsg8G7Grcjj5QuSaosBZc16YM2uzrqXW2kONwKtJACKsm/JMNocLq?=
 =?us-ascii?Q?dnUz0p3O+mJ0m1Fm5/5HpIdSLnkPVGYlFiNPzDGVNg5dEh1nmILpHxKbd/ne?=
 =?us-ascii?Q?t1QcMxln/V+JE6QAPEXghmXMguuqzkRYbydGD0dTQ4y5qfa8qajo2d2czvoB?=
 =?us-ascii?Q?m264NjocgTuQUAvf7lT5VB940g0bs1wIDE701D6B5pjLQ0LpjEMKj1GOWLdW?=
 =?us-ascii?Q?H/yzhyO/6upNSTDcUJFQGUbIoKWugXSR/S+Op9pDkHj5pOda/hZ9WAhi69Cc?=
 =?us-ascii?Q?/I4uo4AvuWk0x9reOgyYNK1YRjLQClQHPeoz8sD3OvIgLOwIZT6E37GWz4ed?=
 =?us-ascii?Q?58Gp1cLUZALIzktA3uHUR6pkSPxyXsoPHPruUkKdrwSUPqKS2mMyES/3y3RC?=
 =?us-ascii?Q?8Im9X3jNd/+VziFddUNRA6pGxJGLzcF6Ju+8ikZg4aweKPRMP/QoD9izmc7o?=
 =?us-ascii?Q?C0Xl4VDeC2S01w4w206kKcbh7X7jHtzs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?snMXUNY+sVXfhQdkkMoaBYhMOUOF/GidXS/ckZV7x9uNev9XPzd4qyw4saDg?=
 =?us-ascii?Q?StIbesuJivVHKdlfHqw9qerWuCTWca0hgwE/Qr/Vy8rdLEQSVZIw1Mvsu7Fm?=
 =?us-ascii?Q?LzSfd65u27BFKVV6mZbt8ynblC+YNgO2cccf1U3Rb80K/6wY1AODM/wxLArQ?=
 =?us-ascii?Q?/JOTVuyjGr0P81HZL9vjbq6wEGNUure51I7mEc58cwoVWvLH6dJWMikUG2qn?=
 =?us-ascii?Q?SJy9qGHdSrHFhf0KWYLKWzJLP5dUuUKwNI23P5O7M9z9HzPD8+/nB5eZ0hSx?=
 =?us-ascii?Q?SNJxJQ3hVqlAG5fwXm2W08zlkwVcBjAUI47QzQ+eHPWeybNFtyy/sDL9qNnv?=
 =?us-ascii?Q?mMZdPCHLwar04Tj7EQymrZLv5N2nO0evrZWuYOWWRkMbicpg++KwPFWDK2Fy?=
 =?us-ascii?Q?qmCl9p6VFsL3GmbH+aTLBDGDlgYz4UH09DZRBReBPWGMwzrIlxNPinBXUrNA?=
 =?us-ascii?Q?wMYhORtPo5IzTHwlDaN6qYr/Lae5B55N0NbZoNTBm4LvtAjS4hyRzcBNzmrM?=
 =?us-ascii?Q?jDkAdl1DX0QJlOgXCcq4UsnZOeCgUCy/w/VPMm7XENA4op0Sqs9Acl1PSwZp?=
 =?us-ascii?Q?Ur5PORiunDkFRqa78bcRa3aMuJKuy2P4BQorLMeGSh1QAtFfFq/g25wHS9Mw?=
 =?us-ascii?Q?Yu3ix3ocaGRZ//iPrDtnNAXc6OQFOZlRGy6LQNUomSOKG+WfXs5CNpueIA/o?=
 =?us-ascii?Q?hqKUiJstjhFrt3JQT8xf3WOivJugq4lrhsLsbnfF0uO9mtC6ruAZdSMoSvmg?=
 =?us-ascii?Q?+sdjUz0UAkYopMfSGrWZRIyPZsVYc5Pa0jjmzTBLduvmo7OA/mwtl/txaxZs?=
 =?us-ascii?Q?bJ1G2H9wW85P2rrQ5g07xuTjIcSAcnE35XYa/IaFf3axLVmvt+t2zatGMB8r?=
 =?us-ascii?Q?hfbomDDutoUcBLAFwSW+A0KiomiaCfmYazWRRYNzjjVGDsUY2/VXEt7tJR3D?=
 =?us-ascii?Q?Kx4QhmLnk6Sv63YwvNjSBoxI44VHNYVkst5sVVDjXY0Hs7cgwo/nSiBQ70m5?=
 =?us-ascii?Q?gJ38TBn182KG37aMWrkl4vbea+uq/428Lr7OwNwJ2T1eC9t4ld9d4D0Zg2Xq?=
 =?us-ascii?Q?MwTtYK9H2neJ4nDebkU1uV4BnSnQ0ieJOvEPL3lybfeXp3ptGAJ0c57V9iTB?=
 =?us-ascii?Q?PgXV6xkEySY9XYM9a3bTtQPv2JKmLt+9vbU6yeEMTSde1r0+SBYCQ0QeKTGa?=
 =?us-ascii?Q?3t07nKepYxOKup4tYNNnRvPQmPYyH6ehCorZrZ+msStOpviBi92oVOZJoc94?=
 =?us-ascii?Q?bS3eep/bgzwZgz4Bj7Tr3zTzzonJTe34ON4y5IjpKDEYSSCbSZZRZIFL7X/k?=
 =?us-ascii?Q?FI3qkMKRXYSKMHwf9atbHAhYQOcuRMbGkCfxh453wv6+cyuS9724mO25VZki?=
 =?us-ascii?Q?rr3BlJW+RSIuTFaI5JsggsVZzq2jT1sO86CpMqo6/V3aP594IGpsI0NlP77Z?=
 =?us-ascii?Q?/0U41uQvhNLS2M+OWjZu13PG8dpccOI1Zp/HLc2iGWDkqoBNCJrOfTd/qYgl?=
 =?us-ascii?Q?GbqxYuOSe6J5Q0P7YAqLkbESRXc9ejdwuBYwY3NoaVbJ7EI0WHqQ8KJXln95?=
 =?us-ascii?Q?7E8xlrpci+BR4STvOc4s2MNNDXhDmhpROds3JtKoRWTSKTFLovrATPxxVBBM?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qU1f827RZKgsULE//vcOAMp4p/pZza+xO0tHDFTKuMuUvRa3Wju1uc6sWRco4NLEZve/xNwsfqu/Ruricdb88VEKYro4ve5Lxn/QW+Qg2tWA95KNdJTCehGJ6Tyf8mWDimWe7xqFaq1ynM90fNbECfSDa/vssbJAxQKPiSkHxx8TaOZmZAf6dECvAIMQwqpfqnmAW9f2yV5J4kMebtM1/WjOLa5Q6fD3fjlVH3pLmUYI/VSeRk7hcrH1U3NrPVw88T0/54Rt1XI/dzw9BfmpGUBTyYxoZ/JlaHbu6iNk96QRWjKBupsqGtg67Ig4FVls9S/K77BVdJDnmu80GedL18/yBFhkXt927CuMljfHhUm6+HofA4wpSBddrQ07ASvuQVTRNbBl6Gzd0yNfDlcvqL3b+pjbmCPY/KB8YEdKhuwIBmV0Hi4GwZVxY/otf1kX4wy7DjSurFtBJDJIanxt8MhW0zqN4SEzQ55uYRaHhf/+8a7nLxW6I6nCMiY0+81MgV8uXwzQPd0jC/CDfEfwLYpDSk7EeWUbSf4mfkie3zd5+Fc0z/CB6EGV84EjSsPEj4Z5fcy+qxrVcu3I6j5WoMhXdh/FTqkH2ZxsPfAuDd4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9bd1908-75b1-434f-debb-08de04f2fe12
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 16:11:22.6524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yg/41Uvrn4hDluLcw43YSHZr7+HPwSYqKSRgfpJRReZueubF6Kd6nZWTlAZeD2LNUDJH9p+CJbOQtak/Y2BCiHV1Q/l8AFa/yuwTYpkmSx4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4814
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_05,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2510060128
X-Proofpoint-GUID: Qh9vsQvZYISgjj9nRPljzo91j6ETtiTc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyNyBTYWx0ZWRfX4q+BSm4fNSCS
 SbfuWSImFor6p5kkPzdLg4UGPe+Qkqx++mb+TLxkKP/XuJMV94CxkcXcCiTDL5D9PXXJvhg8Wjr
 FRdhWoa6YQKYiBOw7t6IWuaxBQGcRcudUgEhlPrZs3yJoklVRFOgmwV6nRsKmQ9+UFc/tb0o0SR
 THSFgShuT4nWKiCW2sBo8eI2+K5vf00FIpywiQjZ/Q+o5LUYtVzEDQ5JDWJyuSvg/E26sANMymc
 meWu425xbnCswM/zaDXU+jX094CQDXv+IcHUgFeCZ052SGhMt2BDIXZwKulCYWUv9ELtVDZ/U4x
 k4Ix1nW5Vy2TUm6eMk0pSmRsZmcil6HweLdyRZPkLF+ORBKx9h/rmxGD90fN531Zf8K0w590WBm
 hm5F/KTOhohlUj+UJxAP6wnQlUkihA==
X-Proofpoint-ORIG-GUID: Qh9vsQvZYISgjj9nRPljzo91j6ETtiTc
X-Authority-Analysis: v=2.4 cv=WuQm8Nfv c=1 sm=1 tr=0 ts=68e3ea34 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=hT9fyAcR6DDq0sQSvrcA:9
 a=CjuIK1q_8ugA:10

On Mon, Oct 06, 2025 at 04:28:25PM +0100, Nick Alcock wrote:
> On modern (NFSv4) systems, there is no guarantee that statd is running,
> and indeed it has probably been explicitly turned off (unless writable
> NFSv3 exports exist).  This causes mount-time warnings that trigger test
> failures unless we disable locking.
> 
> No DTrace NFS tests need locking, so disable it.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/triggers/io-mount-nfs.sh | 2 +-
>  test/unittest/io/tst.nfs2.sh  | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/test/triggers/io-mount-nfs.sh b/test/triggers/io-mount-nfs.sh
> index 338443eb72240..71c83103075b8 100755
> --- a/test/triggers/io-mount-nfs.sh
> +++ b/test/triggers/io-mount-nfs.sh
> @@ -18,4 +18,4 @@ fi
>  mountdir=$1
>  serverpath=$2
>  
> -mount -t nfs -o nfsvers=3 127.0.0.1:$serverpath $mountdir
> +mount -t nfs -o nfsvers=3,nolock 127.0.0.1:$serverpath $mountdir
> diff --git a/test/unittest/io/tst.nfs2.sh b/test/unittest/io/tst.nfs2.sh
> index 41a7a465868f9..87452d3a3be10 100755
> --- a/test/unittest/io/tst.nfs2.sh
> +++ b/test/unittest/io/tst.nfs2.sh
> @@ -31,13 +31,13 @@ systemctl enable --now nfs-server > /dev/null 2>&1
>  mkdir $exdir
>    exportfs -i -v -o "rw,sync,no_root_squash,insecure,fsid=8434437288" 127.0.0.1:$exdir > /dev/null
>      mkdir $iodir
> -        mount -t nfs -o nfsvers=3 127.0.0.1:$exdir $iodir
> +        mount -t nfs -o nolock,nfsvers=3 127.0.0.1:$exdir $iodir
>              $rundt "dd if=/dev/urandom of=$tempfile count=$filesize bs=1 status=none" -o log.write
>              myinode=`stat $tempfile  | gawk '/	Inode: / {print $4}'`
>          umount $iodir
>          # flush caches and remount to force IO
>  	echo 3 > /proc/sys/vm/drop_caches
> -        mount -t nfs -o nfsvers=3 127.0.0.1:$exdir $iodir
> +        mount -t nfs -o nolock,nfsvers=3 127.0.0.1:$exdir $iodir
>              $rundt "sum $tempfile"                                                    -o log.read
>              rm -f $tempfile
>          umount $iodir
> -- 
> 2.51.0.284.g117bcb8de7
> 
