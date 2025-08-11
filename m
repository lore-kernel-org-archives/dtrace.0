Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706AC311C02
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 16:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754929205; cv=fail; b=ULopiYCndJg91Ad5avUvf209qfR6a2dewF0LyaH/qyNewI/aUrJSNwq7HbLDANr4I3eO5dZ4bSsgg2HIUVDqdq+0QmJ4N+q2aYJYw/X3Q1Ml6NaqrJBd1hkmp2zt7Cl0qV42PoHmL0VBl+kZvWduacpqFU09ukT6ShHaZDilWgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754929205; c=relaxed/simple;
	bh=9+foAO1f2bp3iwVfp5IcpvcHRsahM+5B+U6vlAlycmY=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=Q7KLiHF1VKW4FQztQ2sE03wG4PtRAE0weWyS+aa15xXYS2pzLtK0sRSxdyKzRrxOEcl86OsBR1X8SpSj6xCtRTngb04eDxIeplo+N4vI+uJgX8pU1F9DwJv7viYvWkt5M+SN1w/rdMb9q1NxGm+By2tlcSbiHNyzjUnb4AZJzAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kID6c72d; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cA8jYHt3; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kID6c72d";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cA8jYHt3"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BFN4ss007154
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 16:20:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=08JmE4q+d6Z+C+9wiU691pav/0IzedIFwiPokQ4Bxxw=; b=
	kID6c72dt0zqQci7BE4EtYq9kp3BFpXdwVv62d0ECtvxXFxMx9vhVG8B70n6YTE7
	KeBSSE/rz3NGhvjTJbwRNo0i2UkYNEQBRpLvmIUszCnAUi+6z8Y4oC0yBXDZ9O8j
	KWNrG/uoGvIMh6l8RX1KoewONMTSYJVb/erq7pLhl1IYqgruLlg1NsCyEmgu4uJw
	zqhDV+QKii84duU9rN4y9nHO4GhT/asHFkaq6oLfi/st8ovRU9MBz8CJM6ORXFHl
	VXqn39sipp+OGNesdr5/N2EIylXRDEpCHbk1HborhqfA4zYC9c6uxAHgXGoovsqe
	32Xrd52ri8vYE7qJzkO6QQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dvrfu00h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 16:20:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57BFpN3X009858
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 16:20:01 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011055.outbound.protection.outlook.com [52.101.62.55])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsf4gcm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 16:20:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H5NuSJ7UVWCxhjTHNZcYO/+8mCEfbQt3lSiqsUkHFTcfkja0NnQ1ehXRBg3rjfU9ecVU0ByWOeGN9ln9qs+/15yqDbvl54zeNs1xwUZad2gRmg1eOvc4t155g7DQJ2vrQC/tPaEfxc/gONxg1T6zRI5W2NAoJn7AWdpxNWNZi6iMfMZB0zIY3+6pTUPR3gcGOeM+yl+htzPlA+L/uqrHH0PVFztd3bvIM9DLTH4SWkLF7Uy2qB8gYUmJC7hRlRRFg/e7OstkJ6B6fgk4q3DHfFC/EXXLNRqNw71Bz/wbhWMD0pkZgvWjyF2CXhFHgtzl9xX8FwZWGHDfclo+xyM/dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08JmE4q+d6Z+C+9wiU691pav/0IzedIFwiPokQ4Bxxw=;
 b=w75+2k6ig9d7FWa1Jem4NMp0Eh1LadfsKEjET0ZtfuvwW6Hkb/i+Sh7KpHJ/9L2ESN6Ok3pXTmDgQVN7Pfr+ZFGEP/D/ErFFYu7p+1mIGjgM0nJ5474h11CuO4JJn1gjuBO5ZcbziUKFxho+visH2xkfgopfJdGw61RWUxDIf9PhANyzVfVgx0lU2ojEEc8q/UneNPtO5ECdxEYMeHQ8+wfjS2zxR+oZD9RS6BEM8e6OM2Rg5rwZt4yF3DHC3qvPJFmU5bpFFOjisAakTyH82KDCncLbG83HlWWOym++fuiTG/QqmtfqSj58gUS2cSemhRyJdTmBJ3OhZ5WPn62ohQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08JmE4q+d6Z+C+9wiU691pav/0IzedIFwiPokQ4Bxxw=;
 b=cA8jYHt37iZ6CZeMCAEgvAoYJyMCDq+WbDfR0yttyLXlGZ8HxfCwHSs2dar9HzNTpZtuWcVVyvQPtxIsMYzS36IpXQIxWrgf35h4lFm4krgYCRVmyXr55nmSzugSAnh+O3OTXXoizcvOTJsoGS1MzVIzVYqdOH7rwo52V0v1FLk=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA0PR10MB7667.namprd10.prod.outlook.com (2603:10b6:208:48a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 16:19:58 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 16:19:58 +0000
Date: Mon, 11 Aug 2025 12:19:56 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] dvar: ensure dynamic variables cannot overwrite eachother
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:208:36e::25) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB567260B7DAF0EA9EB8C2F252C228A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA0PR10MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: 09b8a08c-d673-490e-e05c-08ddd8f2ea1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FPKqwGOeaJ8n0bmOfJ7SrwezX2MVo6Ql6Fbph4pSIOPNhagf1VNUclkF3AAq?=
 =?us-ascii?Q?KhcC7YH+cHAN0olV1FAQSMRQuvAxbeWro5uXFmQGXwFTaxdm0nFtmP+UyLAL?=
 =?us-ascii?Q?vzlFXsqaf4+aGwR/+V7h8Tti9EJxdTjYFmMmZZrr+LppmEUi8u6GZYfF/Qkd?=
 =?us-ascii?Q?BVi05q5cxkUlC0tDmWUr7DyPLoVz1L4xBpPYXVEF5Zxj/Xx8s0PQp5NoH3bb?=
 =?us-ascii?Q?/6Qqgq7v6MfvTdAV8Q9E2F9IqsOhl7C5rVImTTnfNKUX0zHQWZGsHG0ses64?=
 =?us-ascii?Q?SEdzAtP35Q7cotXPGEgIyKe0tR8rS/NRdB9dtOy/M/FJkjdSw4iRBu+FxkS6?=
 =?us-ascii?Q?kTOwJND3tG91oUps6fbHuccPzi+Ny/892g9v5fy3tKzsmccT+bWrMgXQ/TKI?=
 =?us-ascii?Q?voeWrYp++2j79x2V2hcvnnEIMrBMbqymFDRNTw7EoHC2DDHmw88gnxwJVFTj?=
 =?us-ascii?Q?HcxiObn4BRzssuHABr8qLLW4CkJjA9S4s044u/w239z05r0LvT9rJ8KFsjG7?=
 =?us-ascii?Q?BpcIWMJJAneKx0wKNGNx9i2i1XsO66ZmCVRp+/XWVzUI5GTRPQc0nprdBnP6?=
 =?us-ascii?Q?+eVyNJDTJVJKTME0HoFQ9lFtBmWYm8nZqUJvqXwGelbbpd+qZkxqGWO8eOxj?=
 =?us-ascii?Q?LmQlmPkVkhDgqR0UTzVjYsTFCdOVcsD1fdMfkkUsPKeQT0UP4uyO5jdLKjl+?=
 =?us-ascii?Q?b9i+VomCcEIuOQ3p+BJ9roADibHY6GIL8a1pkNO9rJv1uZgJUPw1A4hdo9HM?=
 =?us-ascii?Q?Ijhf7gORSKcYuGRdubc2U9bBiWV1hFSqMzAJApOxGrGfmWkeCn4snmxPgc9q?=
 =?us-ascii?Q?PJ94xHVpBK32NrUrYY2B2A5feN3EoMmH6G/eC4w4deshVDfVX0T2mfF5nRYh?=
 =?us-ascii?Q?pr1T4Bdy6cnMKSuZ9yF1+hRCkdurxt8TXiE4BgDp4fPubI+1AilHON3zFxqH?=
 =?us-ascii?Q?wUWRNdSb4sk/0R7R7DF5dQO4ksQX4wOJliWEgc0vvGeAvAjS+VDzHUhFwdiM?=
 =?us-ascii?Q?81atjmAjks5jiYt5mGqzEaTtqDNCyF/wSY8yDcOqUH+6GowEkJ1M0Ml8DJaF?=
 =?us-ascii?Q?DT1GAzBFzPWULqRGGADuLn4XlHYM46e+BukY9Y1Swoqc25JUveLA4obqZd2i?=
 =?us-ascii?Q?eegDL7GK8kmEi3xnxXYFuM7Z90342niZNts/zD90tjlwda/pb1nLgd+vDXsX?=
 =?us-ascii?Q?7MzEkn9BQZc0f+u4nooQYuN2PiVuWQZp1VULpU+1uCHwZJwbZcGNmWvjxYfv?=
 =?us-ascii?Q?JM/9UNk+uGe9wcSzwd5TIYDUaN4c1AZI3UUUmTn/fj6knl+2w8UbPs/QFU77?=
 =?us-ascii?Q?2PwpG7EJm5RRaGq/+rY5x6u1TAfKWat3+IVAsHlGgbtVz/8vZy9YRRlpPCJx?=
 =?us-ascii?Q?eGdjG4V/4EGZIs91qsbmbQkJOqy/8br1xVF5syB2n8BOBkd0IZX0cL4aP2Pw?=
 =?us-ascii?Q?ftPLHzjLPto=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XldMHOX6WuRBjN4P/v1BI6LjpXWY905in9N/JdLTaQdMWtCVIxPxa+MZIR5K?=
 =?us-ascii?Q?sDajmcVcMJj0s6EWOcDAPAzWZvZ+xQD9bWk3AaVkk8FQCPVH+nDEibaG7cJc?=
 =?us-ascii?Q?W2crtGM1rSHbhTcRTde4oXa4CrU1tIhptkH8tdatkv9d4fEhsYPM13S9VQat?=
 =?us-ascii?Q?7aPRRkEnKyPCm1iErWhOtSmLJx9sZaYaltKPbSd3mjZsfQ0I5IPrtjNbuJWf?=
 =?us-ascii?Q?hoOAp+TIGkNrBpYuJu7s//2oRPn8j71kyRt0GUvKndt023kF6lYHqXcGoYw6?=
 =?us-ascii?Q?vsR4Wt5lpRC9AiSE7QZ8PRU/osqvMsSdhP69D9pRvUyA9EEDGzxjyYMF21l2?=
 =?us-ascii?Q?SUDVyf5NoRTCTXpxSStB29orI3B2wki5TJbd4hPJqb9OreWv4ZM1Kd/U2cRR?=
 =?us-ascii?Q?IGPVAYaaavdy2nONufytFC7i30EvE6OoLfu13SGGX/DuJPjlLM0KrpG3coSi?=
 =?us-ascii?Q?CAE1xyfr/U5/q2kzcbGrp+J8Bmdz3MQ0v4JzqrD/h8DS1ht+79Rk4qUfUI79?=
 =?us-ascii?Q?UalHUnP8T+I4W+zY4euim4Ha0lC71YCkrDFRmlb0P7LqApTQmYboy2svyfc2?=
 =?us-ascii?Q?f1E5yEckwvl7TWWW7ViZ4wDuO2MtN8dwNKphbHsVx1qCaHYtn0iZhjxllXvR?=
 =?us-ascii?Q?raQrhbZK5c8987CeaBSGBm4knh3PWZfkyBG8OFbd2UirS9gF8ju+yJeVpALu?=
 =?us-ascii?Q?7OUXhh2oGKpZuQ6U+IW6U6xbPzE0kNWBluBWUcblJwuAae7evtEE23FzySY/?=
 =?us-ascii?Q?/j8oyXzETgY/hyMvmebHusfqR4mG2nscjLug/43rguf990DC3SYMT+nCf0H2?=
 =?us-ascii?Q?OI6mpF2241ZpHgnEUOmK40CSoFxl29mFbHEBiFvclvxWbgBeVcTtTODKMyZk?=
 =?us-ascii?Q?Raho+L/iNh/RgONjujpF2sg/fgPNO82NRset2fAUrTq6etqIr52ceyqnakt5?=
 =?us-ascii?Q?63pKaY+/8/U441BuIch80kBMbJATrMJ5HC639HOCn5Do97fOkDMHnJ5Je/tu?=
 =?us-ascii?Q?d/UgKJgFnXPrnfscU96fxRvrulmfbxqf83qi3pQQHqDRg8z0/xFxJfRnQt58?=
 =?us-ascii?Q?1LkKJvD26+sW6Ps4pZBBgrj3QP1kHPDxQebTFG2UKLctY473TOAviZPpxK3I?=
 =?us-ascii?Q?qylY8YgQAnN8dbA1tnavdm1QniU7sOTKyvt2BlJmYGCulSIEVRiu+cuB8KaR?=
 =?us-ascii?Q?agISe3wO4pMeNDeEP+95kJ3gOHE03FmaJMdbA45kw4PJ/jcSg+LlK10r/6O2?=
 =?us-ascii?Q?BXRWNz45sSM3wGcgyZ08HXju18hs2NzlA/8IreKVhkza7QtuJpk+FfYdN00k?=
 =?us-ascii?Q?pA9ZYSFYdkTwCU1g9hngeqtQ8cSTDnzdPEVBVdulMV/OleA9ze6sDTfiEuA2?=
 =?us-ascii?Q?wwU4jNYe7oFw9tSsZUEi+ocLF6qYWtiDO9VMPnW61mc4wjEZ+5u80D4o6ZhA?=
 =?us-ascii?Q?T7Dx3J2Z8eAJQ/AgO7kWikCPJvkoGZGJaZHEXtzawgt6+f3EIIJ0ViKqaNBh?=
 =?us-ascii?Q?Bkg4Tz5qPh00pa3Wvri+TkUrWlhCrRq2gGHcPEDwEhbTjzM/2gPMdoz/1eGk?=
 =?us-ascii?Q?rbIJeI/eTwxUUh2PvNv3bGAWIcz/VIenj9coRkVPCvhQFv7lFZPIBHMZs55Z?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jAdhsNZFsNv9/YZVvjpXx8RgEThbSU/KZ8MujJI3c1Cnwhf20Q4zjtgx8BGiiQ7/DO7KZ4dEKvS4/JwXxTYJSHvTY2N+ivnpWYoFWfRggMleDCtjuCl4oX7fAaM0vzJWLYdku+tTo72Nza3t19WX8BwOw27N+gTz2P30ZoFCeFcgX7gVK6aJu+Zu+8BZXRg9gczF4P5er0NBxOFwb+pvBcQIiXirDZhDPoQxEd46mp8Nb6VzYuQnpu6FhAp0JRCM/kI0nzIWxi6rql6sIE7W670uKoGOdatyj/g2HWl7xoreEHx61PfIrtd86QCggZctdOrbdKdD6eMjwENDLgi4oSK1oAT3cA/UyIjRfhA2548kexJA1hAuCkeqWsGY5GqVfZK+yfYn7Rh89PxlXGEAXI//q0xjxQ2tIBbfCAMqZpbREnyZYPgwdyC1hzoEYbLETSIbLDtSrQ8wg/0NcaLxC3jy7Cu5/WhVyJ0EH3bfpi6bInMC0uMWepSmWrggnKnSz8F4OOjPlv50GUOvM4NGsNLtxtMP/rpdBVe8O7akR5ZMBB98kenk+3KrG+aPg7+Gg45ZFh+CftJi47sAbUITkKXsDlk9PXy7knfngocFBKU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09b8a08c-d673-490e-e05c-08ddd8f2ea1b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 16:19:57.9704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CTeGRfEzk2284UiclTdt4ahWm5f2J9EOsFZiqcOehOCYg8htu9QN/494gLlo+CmRUwAkqk5wuolOZEFJgrXjd5l3lHlhmR9vKmmHbZoGn2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7667
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_03,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 adultscore=0 mlxscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508110105
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=689a1831 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=OvBZXy8-2zA3o2Obo5wA:9 cc=ntf
 awl=host:12069
X-Proofpoint-ORIG-GUID: c8p7t57w_BKzEn0VGIMlgbTQTNY2ClxI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNSBTYWx0ZWRfXwjLmK00nynpW
 3XVy/Ei/SusOz9f7lGKNukCrvmrPvRQR3WIsZwe8zh03lm0DspEHU8iDNNqlEVndJBJ7MpAWc6S
 6RAq0Bmz2YKGEkM7VCm3IFi15ay+Kq3eXYhFeVaSOUxewIEugDTpqVpNOPeSSaRjQBW+59zealo
 Zlvhk2PMuuYgSO/+HrqwY5m3RDdrODKgI6Eigt7La5nQoW4M68kvVPC96zNvSd+OhPA6eoQZff3
 LuzXB2Vwo1QKDfKaeS0H66xdKKOm2i0S8JEQR4zcM14im2cI4kDCeF97D4O21W95K4iElc35A8M
 1NP27k3WeDscsO26Hw4mSe0DBBXpntZZkMHCBO3XIC1YlDMAKvq8r74TUU/txIsI98lZWJflWdA
 KxdSixc68/t+ifsLIQErDbUVtmJP7wrDJRsCng0hIhYFy9lnxNI5hB53CAi/5f7OUEXZghl8
X-Proofpoint-GUID: c8p7t57w_BKzEn0VGIMlgbTQTNY2ClxI

As Eugene discovered, it was possible for dynamic variables (elements
of associative arrays and TLS variables) to overwrite eachother.  The
problem turns out to be due ot the implementation of the BPF helper
bpf_map_update_elem().  In order for the update to be seen as an atomic
operation, it does not update the balue of the map element in-place but
instead allocates a new element and places it in front of the old one
before it removes the old one.  The result is that the address of the
map element changes as a result of the bpf_map_update_elem() call.

Fortunately, we can just assign the address of the map element in the
value that we obtained using bpf_map_lookup_elem() because that gives
us a pointer to the map value, and we can assign directly into it.

In other words, we do not need the 2nd bpg_map_update_elem() anyway,
and since that was the culprit, removing it resolves the issue.

Test included.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 bpf/get_dvar.c                       |  3 ---
 test/triggers/Build                  |  5 +++--
 test/triggers/pid-tst-timer.c        | 26 ++++++++++++++++++++++
 test/unittest/assocs/tst.collision.d | 33 ++++++++++++++++++++++++++++
 4 files changed, 62 insertions(+), 5 deletions(-)
 create mode 100644 test/triggers/pid-tst-timer.c
 create mode 100644 test/unittest/assocs/tst.collision.d

diff --git a/bpf/get_dvar.c b/bpf/get_dvar.c
index 1bb5eb002..803345638 100644
--- a/bpf/get_dvar.c
+++ b/bpf/get_dvar.c
@@ -150,9 +150,6 @@ noinline void *dt_get_assoc(uint32_t id, const char *tuple, uint64_t store,
 		if (valp == 0)
 			return dt_no_dvar();
 		*valp = (uint64_t)valp;
-		if (bpf_map_update_elem(&tuples, tuple, valp, BPF_ANY) < 0)
-			return dt_no_dvar();
-
 		val = *valp;
 	} else {
 		/*
diff --git a/test/triggers/Build b/test/triggers/Build
index d49b996a6..30991db16 100644
--- a/test/triggers/Build
+++ b/test/triggers/Build
@@ -5,8 +5,8 @@
 
 EXTERNAL_64BIT_TRIGGERS = testprobe readwholedir mmap bogus-ioctl open delaydie futex \
     periodic_output \
-    pid-tst-args1 pid-tst-float pid-tst-fork pid-tst-gcc \
-    pid-tst-ret1 pid-tst-ret2 pid-tst-vfork pid-tst-weak1 pid-tst-weak2 \
+    pid-tst-args1 pid-tst-float pid-tst-fork pid-tst-gcc pid-tst-ret1 \
+    pid-tst-ret2 pid-tst-timer pid-tst-vfork pid-tst-weak1 pid-tst-weak2 \
     proc-tst-sigwait proc-tst-omp proc-tst-pthread-exec profile-tst-ufuncsort \
     raise-tst-raise1 raise-tst-raise2 raise-tst-raise3 syscall-tst-args \
     ustack-tst-basic ustack-tst-bigstack ustack-tst-bigstack-spin \
@@ -191,6 +191,7 @@ pid-tst-args1_CFLAGS := -O0
 pid-tst-fork_CFLAGS := -O0
 pid-tst-ret1_CFLAGS := -O0
 pid-tst-ret2_CFLAGS := -O0
+pid-tst-timer_CFLAGS := -O0
 pid-tst-weak1_CFLAGS := -O0
 pid-tst-weak2_CFLAGS := -O0
 profile-tst-ufuncsort_CFLAGS := -O0
diff --git a/test/triggers/pid-tst-timer.c b/test/triggers/pid-tst-timer.c
new file mode 100644
index 000000000..ae98ffbfb
--- /dev/null
+++ b/test/triggers/pid-tst-timer.c
@@ -0,0 +1,26 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#include <unistd.h>
+
+void
+foo(void)
+{
+#if 0
+	usleep(1 * 1000 * 1000);
+#else
+	usleep(1 * 1000);
+#endif
+}
+
+int
+main(void)
+{
+	while (1)
+		foo();
+	return 0;
+}
diff --git a/test/unittest/assocs/tst.collision.d b/test/unittest/assocs/tst.collision.d
new file mode 100644
index 000000000..1dc0ec7e3
--- /dev/null
+++ b/test/unittest/assocs/tst.collision.d
@@ -0,0 +1,33 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@runtest-opts: $_pid */
+/* @@trigger: pid-tst-timer */
+/* @@trigger-timing: before */
+
+
+/*
+ * ASSERTION: Dynamic variables do not overwrite eachother.
+ */
+
+pid$1:a.out:foo:entry { n++ }
+pid$1:a.out:foo:entry / n == 1 / { fdepth[0x1234] = 1; }
+pid$1:a.out:foo:entry / n == 2 / { self->start[1] = 0x1111; }
+pid$1:a.out:foo:entry / n == 3 / { self->start[1] = 0; }
+pid$1:a.out:foo:entry / n == 4 / { self->start[2] = 0x2222; }
+
+pid$1:a.out:foo:entry
+/ n == 5 /
+{ printf("%x / %x\n", fdepth[0x1234], self->start[2]); }
+
+pid$1:a.out:foo:entry
+/ n == 5 && fdepth[0x1234] == 1 &&  self->start[2] == 0x2222/
+{ exit(0); }
+
+pid$1:a.out:foo:entry
+/ n == 5 /
+{ exit(1); }
-- 
2.45.2

