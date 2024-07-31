Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E2112B73
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 15:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722439205; cv=fail; b=BGxxGSrqmW7UOY+11ZKAL1IrfC9gaohAnM8x6aCxfRKicmnJyYTjZAYlaZecRGryR5OBdGAebqR6rXa+xBtY9GA4+WTtGLgVyxiSVnpmB0daqEBLPcTY/hY33Gb6mtQ87j3Q6AncRwgIllpmWX8v9HN4xBwesOt2iCiPdrwmJtE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722439205; c=relaxed/simple;
	bh=MziEaMT4sggQ+XkwxubaNJc3KjnUmTXKJjASusVaFVs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=m7gMrSQkcGRjTRgDAifSAa82GGXNiQM7IOe1ydhh7oLA8rdzJ0ZAQoWJISjiQWZ6N4IgPLR13W+jiZjrxHbppctBbFkIoeCyVSy1M7NekdCtROG8kscHGZRsOC9pcE562daxHaHrbZfGtbMKRjcwUf0IIFxwD6MuSdIRDz86QI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BGmSU4kM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=s4exXvFw; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BGmSU4kM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="s4exXvFw"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46V7tWPe000505
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 15:20:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:references:date:in-reply-to:message-id
	:content-type:mime-version; s=corp-2023-11-20; bh=Oa6Y2hemGQfii8
	0ylyuHmLBIIA6FuAMdZjhbghk0k9A=; b=BGmSU4kMJxhx3C5ilPfhfFR0rl3OJg
	j76xQoISgyKtbCZstXMCTV+UaOwTDhpYwydIwQKTCVaG1qiqAQIHGybcHovpLBTQ
	QQp7t0j46qp9uXDvReuWwtt/OyvqNijqOg6AnRurpXlPOuT+cWVoFZBmd7Qcelfl
	S6tT+aIhM8UO4jFlki5fMZU5/bnPwlTWszK9jvdNlvS2EsI0VTFizbIM8CERSBzY
	DOX7xFMw2o+S87KvmdNW31yRAgaZ46D9YsboMkllpXet5/8mprziSxr4PcUY2dIu
	BSF3vMCoqMf4CMHJN02gibeSutNfq5GKqSi9IStDF+gpglikTUmzFDJA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mqfyfm25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 15:20:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46VETJcV000677
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 15:20:01 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40pm84rama-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 15:20:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KjyBf8ARmmAwT+MLETopjqLXxCMxLW0xn1etKRNWV7E+Flbtw6KiQ2TaThzeSlFeCV/IkiDzHHPhFpDNR1/Zs7ieRr1Vc07gOCIfnDieQDqtsoEEEJOO39dvS8kbym/utrtWBecxnEbQhA3j9cN5rU312K3T3MQaaqijsLQhU3GBKziLIsBD25IX+XizVW1l0EkGvziN9+ufvzl8Tf9hwT/Up7hn71FqIfH3TtQlHb5d8jbhipjRmWD+cNIiEJF7SFfo/m+0SlIxMDVUToWxKmBX0PoXHoR8tRT/gfPz297ZYWmasg/AYNZ8H5eEMfkLsYbtNNQlzf5ZJeQoOWKTdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oa6Y2hemGQfii80ylyuHmLBIIA6FuAMdZjhbghk0k9A=;
 b=vpCb0igIGkJl9BtgJbdw+AiH/DF8eZNnMAVtF+65A2RxVuPXdE0b2u1jrD5FfdEA3wXEmKsmsshVAfVAAbIMWGZecuWOaWKwQQGxUpmdXT2/Is9B532cfpNEdRcUjBzzVIG7572IeIRqG08j3A7J9kWiFVGIQ+jYVL05YPql+bMwCsxm8s70MCNHM8vFn0VuuM3ogNSF+EwJQK8j2T5+PMXbaroDAc2F4rDwqoucHy9zrxdkTngd1VqAyf595UrE3rDsxkUmwki4HisGEFlKwWNZM/YOvI307EOGn9V6d3Vqf/bbO737ysE8coQDULo/Y0nz/tbd44Zg3tKsE+AHAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oa6Y2hemGQfii80ylyuHmLBIIA6FuAMdZjhbghk0k9A=;
 b=s4exXvFwMJZOhZ2Ilc4n7y3K7OimrC/SR4kxwKjleM1yfkl/gcWC3KJ9IdVj9CrhBDtonaGZwRoKocxi92BteJNEtul5eQ/GhQXv4kiHVPODE1aT4QdSXPrZuHQjBBtRABoNaGPV93yFhe0jb/8gFxO6EmqjlADx1DbqiO50SE4=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by MW6PR10MB7639.namprd10.prod.outlook.com (2603:10b6:303:244::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 15:19:58 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%6]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 15:19:58 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Kris Van Hees via DTrace-devel <dtrace-devel@oss.oracle.com>,
        dtrace@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>
Subject: Re: [DTrace-devel] [PATCH] test/triggers: ensure bogus-ioctl has a
 reasonable fd limit
References: <SN7PR10MB6287EE29B21318FADD0A8DD1C2B12@SN7PR10MB6287.namprd10.prod.outlook.com>
	<87cymtoarp.fsf@esperi.org.uk>
Emacs: no job too big... no job.
Date: Wed, 31 Jul 2024 16:19:53 +0100
In-Reply-To: <87cymtoarp.fsf@esperi.org.uk> (Nick Alcock's message of "Wed, 31
	Jul 2024 16:12:58 +0100")
Message-ID: <875xsloag6.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0282.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::30) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|MW6PR10MB7639:EE_
X-MS-Office365-Filtering-Correlation-Id: 44af98eb-9fef-4f0c-8034-08dcb1743d19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mYl92hJSnD9tWPZy4derGxRMy6zX6+SEBumo2sgQzFOlrPA/SV3ryvZrSyw/?=
 =?us-ascii?Q?UuDaKREz7c18vdG1C0pJmUNE7xDuhKT52qN1tuZav5p4EcYhOz/VIOxUDi39?=
 =?us-ascii?Q?+BEc39wHQeVQGAIaLXztCOPksN9IIqLkQqvz/BzHkKSGHfZ/UkUHwSYjUr9V?=
 =?us-ascii?Q?yueeV0Zj7djwOefbXB9h8rIITGv13bUayCM4CSa05N5S1qxM9HAuphOoF6w3?=
 =?us-ascii?Q?9JNJ5rFpw0xYiiNSznHSMtWfjic9uWs7xGmg6LUigJn52gTnesKuDObmmpFF?=
 =?us-ascii?Q?COuhmWtrfq8gmsQ0AlfkQZLVJJAL9nuyp4Fv6KFjE0miugL0GWWnchAgWV2m?=
 =?us-ascii?Q?utytFBLkMhwfcP6RGOIzuq46doewYSyuabAeF1iD2SP2bM3FWz049PMp2gvF?=
 =?us-ascii?Q?py3JeJngvFe/T0rtSe8+xAKudi0hNFryUT6dF2rLt9kSMEixjfBblz2+eKdg?=
 =?us-ascii?Q?CtBU+kVBpwERI9rswCE52OtXwJri2chmBtEKOelNckEmnCAumEvhNASlxzBF?=
 =?us-ascii?Q?65fSDffXI69G4Q8hsMnfhZ0cIHGKom2Wve+uY2sAv8v9Zorm6FLBECO0jJGT?=
 =?us-ascii?Q?OLyAyf/sebRa0BNpth6srYGJTrDVAqcvQ/a5/YGSynUDZrtB9eRY6eMFqF+W?=
 =?us-ascii?Q?LOKMGhi73MOYHCoE1+jnt2mclp2Or7EzRfejorgKCN6wTY4K49EZ8fjQ8WcM?=
 =?us-ascii?Q?T2KuqARMkNrfvSVGmpuXG+IQvz6IYT2BqXY774Dh5FCKskydlApEH84jnYLN?=
 =?us-ascii?Q?1MUBtqs2wIzViZiLfs+t8E9hRY7mtiVTDC9kBUESiPHxSTkOiNILbz+yE5F+?=
 =?us-ascii?Q?9cbyXpU8+QAsUysjw848yEIGKwbOxj35DAU6bDu2z4C/mBWW4Iq7Eg9uPDEY?=
 =?us-ascii?Q?HdFRQQDBr0jqObHvS2EIs5oyEf4ChhkTN0jOTp7ec9l8TXqjAiwByhVK2PY+?=
 =?us-ascii?Q?FuXvTg8GOW6Fku7hWcyWY2yzstvb7g+3fvSiya0mYmBXGOBvrHPuQmxV+ZSk?=
 =?us-ascii?Q?ZuNwq4j5rQdG4WSOJrYLr25SBS+XX1m3ACSfnySGXxmPRNQDg4pIirHaaQtr?=
 =?us-ascii?Q?gN46pDL5Ve5bqqFs+co+B3S6P+Q6LivBcjs+aegxXAFiDoiDu1NcMuomv3aG?=
 =?us-ascii?Q?alioa/Ma1f+auDZvGSkrjvTz40VoLy9HMoZS9/RoJ2geXFe7Hc5swE0ItKUv?=
 =?us-ascii?Q?FjEKf96eTa1D4qGrSRFJiX/2e2qRU/ZcfgxjsGAf6UC6Gf+tUrXPQYm+7vH5?=
 =?us-ascii?Q?Tn7GIYlLslNY8rJS5IQd3e/kNED5NjnJkq/kNyBDTQGbxIVCFpzHKW6rSn1V?=
 =?us-ascii?Q?IRPsVhdkZomOrYmgNIvQEPjvZPVcF4m/DlSv1E1OnugSJw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lCDoXTNtcl3peKMBE2eo+sJG3rJPkQs2waWzlycOXzk9yjtate1BXxsUobVY?=
 =?us-ascii?Q?g/KfIm41NAqcBu2ffTcuuPaPLj9tgbknwwAVDa/q1Kq77mgtlzgAsDB+XpXM?=
 =?us-ascii?Q?DiTi6p3nG8trLgQdHLTCX43ocbpJpllQRPjZWIAI2GALx1ID6nFkmF84U5Zq?=
 =?us-ascii?Q?1/WK7PWtyQbnVGtkaDRZPEdQGFRRhpByYP0OMVM6WZez9WKu6qi5X+BYdKES?=
 =?us-ascii?Q?SmtjgoJ5BCS28WTFqBVnJuWDXoCpaf7B5oiVShDxI7fHYnNnVhUxO+xZbsg8?=
 =?us-ascii?Q?kx9fO80P16r6Yb6smcSmg+PmmDe2rS0NGB82/MFUgYmzbF/4kWlCQC2mabMz?=
 =?us-ascii?Q?mmSohagwkCX8jV6cy+pvXvG2oclgD4N1H2VK2fDWV93Re3dJQk1P8KvXfa/N?=
 =?us-ascii?Q?VrgNq14L5j1ukQ4U4eoZaClKWy9MJMer5ERO1Hg1kvJTuZCDOR9g4gaY7WRB?=
 =?us-ascii?Q?VoURzXlobTVoTN/0UAD9nTsdd/Z609LuqvWfVgtMCo8Eq206AfxhrWFLMagd?=
 =?us-ascii?Q?C4BQ0yW26v7CnjIWyvZhUQI33JfCXf9c2n4z5/zPzO1rfbczXhPD0yPb4CBl?=
 =?us-ascii?Q?1n33qkENTVsXmOo6NONLNzrXBbMASJnJ5qdfTHjgSbZ7ycAOS+5zSVZMB9ZK?=
 =?us-ascii?Q?RFRwsGLx6p+Rr7esx9dnYgyTGDULw+hNervGVST8RzcNOhKnQw4FmrBxufmw?=
 =?us-ascii?Q?sXR64ff81ZyIXbmTNp+U09UE5N+LG1sbGTqC+MW3+9smZoh0SMD+NbtW3SWW?=
 =?us-ascii?Q?YeXl4LyoHVX1EkrTryPQ7hMtMPVGcMrUJXc4jeJF4urkhwEP/ljAfGtAtDIH?=
 =?us-ascii?Q?R8PRs21MZWfCNbcQxLHqoQZ0WjqR8ayye6pqKNacMqvp3OhMLMpyvwUwTlg+?=
 =?us-ascii?Q?XYuTnLvdW0KNU72FwvuyHrYz6vHV2ubEVhe7Ak7JrRgpZSt7hk7+dKF6AOiU?=
 =?us-ascii?Q?6S6K3JNm2Bce8CMZQpLgNsR3bwbY8jPcI9U8i1axw6YY7KxgP2cmXhevwp0E?=
 =?us-ascii?Q?oP+qniZK+Op9Gdw67ZBy6U84C7S09i5te1B1kdDUXflrE5Hdvm+PiwFurYtW?=
 =?us-ascii?Q?BG8OyZvi1PPgXFdhwPw2Rpqxvt5UjQTyqbtlw9RKH6cApJomWN1dlOo6+vR4?=
 =?us-ascii?Q?y/Ar51H08oVTkeDZaTKFLeM9tIlvwVYOmA7IGtBDlZeCZLPCdI0p2DjFN0ke?=
 =?us-ascii?Q?+ELMnLwbsw76wvhpZo/g6dTukDmHk/cu3wOWfwMwdueIZAV2o/B7NHJYB7T/?=
 =?us-ascii?Q?MR0MX4R+V7Tx+4v5vqsMLU8ArKohoRBWkEYHdTRBOLAkMHqm34xtH1I5lYQM?=
 =?us-ascii?Q?5cYu0TXKBUiH/6bNoEF56TylBp2dusGnfJJ4UYIcYXUFmP6Tq/I3we/o1oOZ?=
 =?us-ascii?Q?Yv9R98+r7BHEeeZkh1/TCEbT+CjgOZeE84sHRcsKhwXCPpNmi8113RtYrKux?=
 =?us-ascii?Q?ejiWUUDklIQdD7BW+xHUd+VZkpgEIDxlT9x56LXvOfh1FcwMgeKMfemfE/DK?=
 =?us-ascii?Q?7ZJ9RP1nLJ974tJJyY+65tkUe/hYbqDg0lbIprOQFkrq9vKbOWGXw8xO5APo?=
 =?us-ascii?Q?I/gQSb+ZqGGdzhvelgAWtkVANjT/lYujsxahiK4oIlm9LXc7DS0dnwGGZLJu?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	flq60os72k6EDCb3T6VFNZymoCEUmKI5ABD/SGQGwef62fcIIX31YogdGEgJCnhi57ipaFxwAlE08MPEcNcYqlX+pb5+MdCRkmilx4j0Ijfa1A53Bk5CCQCedfjf4/wqJbJgutGMI9Yhqjzd/MaO90BtR4EP/x+AalW/mYtZBi8FPNw7g3slK84xu9eUoFKDrTrA90sJZWXqkKnHCovNAA27IgPzzEKB8bNvXcKtjgityanop08MDEn0TXfVhB4hfsZ8seQ82e9VmI0DA7BBJ/7U4W798HdJSPYuWSHclCxnaspYtMZt4d+sQ61uBrtFebELPYhIdbNh9BT4YgInOaZ/BSWkxhebBky8aqrroWRtdh6uorpJWKc73r5Wol/a5tkEGcPZBUmdLIRbJKqkQ1mrZgYoSiOLlZgZXlZBMZ6F+ah4NmQDDq+nnl0XdLta23ANtn4eJntLJF3Bwp2NfACr9SBhaOdpL0lO8ZcSXkBo4smtSrgg3KQxZiG5DhZCdn+7+CBDbv0tSaXW4CMpLl9vI41OL/CXAv769xr3azD+mAPE1FAiEWjYcf3J3Ona2Ubc7lx5sST4uKBmMxTO2CHAmDNFKrgEW7L4oEg0L2Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44af98eb-9fef-4f0c-8034-08dcb1743d19
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 15:19:58.0638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SiHD4pIax/En+q7aXN7fnBJWwYFypELJNRTZLR04fRdL3YmnRMvXzlhN49u6dCeJmysGc07NAjR6sbsSqfEvgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7639
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_10,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 mlxscore=0
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407310107
X-Proofpoint-GUID: JAjs1IFONKpqGnBnZL3hRTnjnO7pMv1v
X-Proofpoint-ORIG-GUID: JAjs1IFONKpqGnBnZL3hRTnjnO7pMv1v

On 31 Jul 2024, Nick Alcock uttered the following:

> On 31 Jul 2024, Kris Van Hees via DTrace-devel spake thusly:
>
>> The bogus-ioctl trigger has a loop to close all possible fds, and it
>> was limit by rlim_max.  On some systems, that was such a high limit
>> that the loop was taking too long, causing tests to time out.  Set
>> the limit to 1024, so that the loop will end in reasonable time.
>
> Boggle. I guess this has grown a lot with time :)
>
>> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
>
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Er, I mean

Reviewed-by: Nick Alcock <nick.alcock@oracle.com> of course.

The heat is clearly destroying my mind...

-- 
NULL && (void)
