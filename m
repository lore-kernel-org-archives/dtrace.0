Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4391020B80B
	for <dtrace@lists.linux.dev>; Mon,  8 Dec 2025 22:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765232057; cv=fail; b=cieTxCzJgXZtDAigRoG5rdLF2x/7d3p9fRZtiCdBYnVXGrt034Ydw+7Lb4om4YbNlBciQVPEKT9vOgM5p6YvTgymcLrlztIDORZz1tdxO66h+yFEl9NDGsRjnINGv9zDKqvZdlL8gmufEHR1ZaZS4kVxDMWtXSSt/xLWu0WqDmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765232057; c=relaxed/simple;
	bh=0QZ8CdgSqqnrsQ8jx6bDlUxz9BipNq9+j8EqiusMTaA=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=DlOeZBK2tI9fRZOJzLdxA2zVaCEPN5jisC9Glocqdy5uwmtdLHdNq1Bu/6lrrk2sJcP7QTo0sNEs3xZGP7pny9b/vmsIC2s/5jv61BcVHpHcnfjMh0S0+lA2wKJOjhz4rq407AzAQ5+VraCcqMJ22LjAQOTDhk3Oc8DCVMzwdf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Z+f/qBbq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BmQuLEa5; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Z+f/qBbq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BmQuLEa5"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8LNHH23604931
	for <dtrace@lists.linux.dev>; Mon, 8 Dec 2025 22:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=oYQanA39jcIBa1apiaJiTHjc3hya1jnUi6bX658E25U=; b=
	Z+f/qBbqzR5H6POgdHROpvl5ufU+BXEM+Jlw56z0R1xlrL+KwrirIxTNIYsoIawN
	nOeOGA72PqPp4vTupoPKHcZ7vitl8sIWW2O0Ri4jNv4oaU67BxlTsH69GKoVl3HW
	RzSv7cedbzSmo0v7XGak6La8g3t8WNiAl1etRr219zc4DxSDo7biESt2OYfom7a+
	RvmyTdRw8TQNBbdcV4pBR70fKj51rznlDY1TAKMLgEVzZ84SWvXmP/tdoznenA2M
	qq5vsqUlF8hxkrcVau7lKk3m7qQ0PQjfI9GmbKtAxOpsTArQRfSCF1nZybgpx3I1
	G6Zg+129YdUM5M3ANyFfZw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4ax69mr4jc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 08 Dec 2025 22:14:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5B8LCH8q040871
	for <dtrace@lists.linux.dev>; Mon, 8 Dec 2025 22:14:07 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013001.outbound.protection.outlook.com [40.93.201.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4avaxc3jj3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 08 Dec 2025 22:14:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oOsM3kc95FjU+qYV+PV8o9fVlfJIKqxhdXE437H+o5HsiU32owVXEMh0g/cvGIvzQJk70aKnGdWGYXNZqry4WAaNgOWXMQq8bNMKe+gS0lVOantJnfSzHuiSVbcvIIQdi4jcxfXKRG0DJLavz8/0qJzRe2cWYxo9PwFNpRfKJ+IZz57YyBrtH7cEvBL1hECqbzDnH3ENepmtbWVEQRgddUwWx/+TAVT1cmd/+dqy58kWG5epmgpbolZyZmf6E+ekjRXagw0ObBOPy+URSqOd5939v/tLXWzrTrbWikYZOx78ifY8y6q9S0PDxRVl2eT/nmpRWEXlAG8Jmrl9HXeP2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYQanA39jcIBa1apiaJiTHjc3hya1jnUi6bX658E25U=;
 b=pjfntmEHoM9bepdMydTABmG2NFf1/vEUSYSSZMlq5Pc1k8Yi4Vx+eZXsQYcF0pSBBS4Hks21J+YH2v9aruohPMxccL5XdVHkdXyc0Z8uZa9ZBzMxwMi7dnC7gdQbGTjl2eD9PY7EC915pPFXKj/DB5KxguXKaT2YBD1l+9qo6/J0cx1BB1FwcRU5uns+N5qJs7cG9Xiz1YWAzXDHJnQrtfC52dS76WKTnFxetIg//lOlWb/ZLCF8dJ3cNW5UZviTpr3F3P+w/uJ/i1dG7PrNyFLMrmMDcT70LrImyHAJmmEk2+3Fmn0qJ2BHH+VdYOXL5AwuEACyRavkqQ6yriStxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYQanA39jcIBa1apiaJiTHjc3hya1jnUi6bX658E25U=;
 b=BmQuLEa5g7QQc4Tb7FTqtc7RJesEbxaAlcd4oftPESQH1Y+1dD9wRD7ZC4ciRbWReEgs5iJih+xSY+7KmnpYzmwZi1itWIXDFaP88zYn167m7OO5NnJnVwgZj7Vo9G604PEfb2G0BIZ3jRTFqGC86n7GIuMKGN7LlWPfRq1uV/8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO1PR10MB4595.namprd10.prod.outlook.com (2603:10b6:303:98::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 22:14:02 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 22:14:02 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3 2/2] doc: Update the sdt provider documentation
Date: Mon,  8 Dec 2025 17:14:01 -0500
Message-Id: <20251208221401.5603-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0057.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::32) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO1PR10MB4595:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ff5e374-ba30-4196-b8c4-08de36a71831
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CtqdP1zejGMuG4MRybbctblx0rO+NeR41V+JxuLkJFEJJlvriwcC9zq/YdWF?=
 =?us-ascii?Q?4zwzxmL9nQWCMIjExnc5s9Kh2h/R2x1LeIwtSK6ehlPBbFu4V7Lb6UZzxrqZ?=
 =?us-ascii?Q?RP0thD/y6hGvt3PiZEltEw3OssM+QL+Jih2KLMzTlVeLHm/YLlbH9flWZVDp?=
 =?us-ascii?Q?6ljV7GJVeu9eAgVcFFyXnzH/UFZjG/MDeVGIiK7Yw/aRN2WWRuwsyJsT2KI6?=
 =?us-ascii?Q?mT+ojJfRiALReEWhW4JgzGjWz/E3r/f9Rq+6eI5cFZwsUWKCvIb2/8Xw9k6S?=
 =?us-ascii?Q?fLL/lotfZC66S1JieCALUxTOL6mv6gm3svi1gNyNNYfSeQwyysOQkfUKo1id?=
 =?us-ascii?Q?R5ADmaNbTgP4wG5MABY9eePhvjEVXp7XELXeN1rGL4mK9jM230KFtrqKU+M3?=
 =?us-ascii?Q?e6OKQe2oBqHjiKaYCm6vmvUg0c5AdcOuYCUF79M8zP4yMAkcSqAZLHPyNI2g?=
 =?us-ascii?Q?ybsAleBH6sknpKQCs3CFEWTyd7FXN3ojttr6cBWB5WaG2uzZRyFV7iyADOQv?=
 =?us-ascii?Q?gkANb0ptOJUHRcXs9pvTgjVq/MGWTlJFCgxENBZaKkQPu8GMeDH1ZMZrT3yP?=
 =?us-ascii?Q?kaKdFtPi+ztnkbikhLImVs/JslG0IYEV2hQuolnWPgPnf9dkS3ThGULLbuhG?=
 =?us-ascii?Q?r3tpXKjUznts27pxpd6GS8Nr4Ow3IUOLBip6u3fMxEWICHFDpmt1jSQ9PE0M?=
 =?us-ascii?Q?DUfYRwlzCauBNT4y5y1JG9uvhoK9BsQ26eXRMVaqZ3Jx5dzRKCrW5iYir1Rj?=
 =?us-ascii?Q?bynuQbI323yeqqpWD95yh7/mZyacUX8PYbK4ziagjC/jS6x22GFn7A64lnhQ?=
 =?us-ascii?Q?2r3TO0hRnp8QDPwKNtR1Y5q4E3UVz/6MKaF6nAJHTOYzt+HbiY4/itqvlTwC?=
 =?us-ascii?Q?2ofCGMGQD+U8i/21Kq2tvWY1VJq+ZY4RgQB8U48v5AUaP/yYL8RoAfCtBnIH?=
 =?us-ascii?Q?PP9H9JtfLv8oJjbAfzcRPBH1QclR4yoQ8jD/4Ng8dSWdGNUG69Azfsf2G9ZW?=
 =?us-ascii?Q?rmuExDNNixzSCwqKDL6pn17ks5V3QGSQaCdAXA8gsn+vjoqQTUrcaA8NVD3g?=
 =?us-ascii?Q?f0yF//H/q5ZmP9VEwPNRolZ9wPm12j0dtBbgFo2BTFodlhvJrAWU60Fz61i4?=
 =?us-ascii?Q?Hvtw48vN2vsBATaWFyr1SYgGKFzFBlbd3gwHeKWaMWd8qgbR+N70YfvpuZ0j?=
 =?us-ascii?Q?1Kbh29E/m1h6NrtLTvHqwMVHHAEMv+7oeclrfUWsxS/A9cIS6XDg0CmkTNR6?=
 =?us-ascii?Q?pmJo1PSXFffYcVAhnCLc/hRt3GjoUYrcJaJHGExXSosknHmy5NOfYeQBGX4m?=
 =?us-ascii?Q?jYNO8PrhZMn9ngdySaTDWfA4IPQJFaA03/SQ5TvDKbGNnJQCydbtyb64u7Ey?=
 =?us-ascii?Q?3i3VUBlGATkRnS5IqjO+bFCK34EI12caQ3OYojrFiUDm2I7dMw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?61lg+m9L7qgAKlBCWZZwJcp16buorvmoMLLyazJnIV4R+XAhb+oN43Y4JcMZ?=
 =?us-ascii?Q?DdGROeY05Fb9ldR7l6B9/MT0pcz2shmixPzsy8Pb5vCPra8m4Lj6l3OsViUk?=
 =?us-ascii?Q?kiGapePw5cG5j1wBVpe2dar7AdAqxc5MNNXtJai7cXegaOGBTq2a/q+G8jN0?=
 =?us-ascii?Q?11J3nr6e/471I831S0hodMZEuYHEXh8m554u8X+1xoXddxOfIydIfaP/91uL?=
 =?us-ascii?Q?AgzYYwjPBYB8AltkqKwvppZIBg/pih2jnQ7nnLStElD1kmNV6CPr1k8Tu2Au?=
 =?us-ascii?Q?96Eyn/yc0Fk4DAYBzf43Jqk5qbCQUKnwIDjU7n2Es1kkjVWhbaGuw8GS1pJm?=
 =?us-ascii?Q?Wj0z7f5qtP7aAzbiW3G0uNhm/mLBN7ZXNjBlVuE3O+e2gwj19kJr3DcJ37JK?=
 =?us-ascii?Q?Lb4dv7iuTjUriFa/1D3k7DQfRUdE/nVEtAqtRjq5oFMY2O9FhxAdVKfoWkw7?=
 =?us-ascii?Q?5jVCvwUEjDEvbs06BMh/fHEkpKPnEea7EonYJGHlqY4g8XaaJdMG52BpsaL7?=
 =?us-ascii?Q?Gt6eRTWLzVFqdw02r8XnrJU5fiK3GgyLAEA0BhSJLEyTIQ26qO0Cz4Y8C99/?=
 =?us-ascii?Q?kBdbAyZwnvu4UpAqLVbIffHeTOGoo8PdtRYiMOuhxagzx3ybpYQv3vu3CH86?=
 =?us-ascii?Q?bahCKjNwz7Cg5TrWNI8zHS18bs7qAFQZ2U+fvIctKMxR9/3VBG372eRFWKvX?=
 =?us-ascii?Q?qtd5E8pyRVsxC/GxV6a8tRmsRL+gNlPSJEY5kip8aLpQql7ru1WqmtWBrsVk?=
 =?us-ascii?Q?bBTf7ASmmGGm7cYktku6Abiub4HkzbT+67uT50C2mbPS11HwHjD0KQ6rpDE2?=
 =?us-ascii?Q?oM2iXhJpxKI+50lfmZD/bS/UKnPi6JIf/3NOy89TSxx/CKGmvY7Zk52wl5/e?=
 =?us-ascii?Q?tmtZbjwKJkVnRPoK5xTMcAg2meHysQJwpjHcKPXGbq/1zT/A8EsyO9KBEigF?=
 =?us-ascii?Q?agjL5ZSVDYxxnZLu7UYdnB0815kuCEVb/qQuh4hyjnHPywdogUXyPVJ8V9CC?=
 =?us-ascii?Q?WY5Garmggq4Y235NIPwwSHumHLW9DsgWSLOW3Q8P/uWuGyLy/6B6oKY9OKzm?=
 =?us-ascii?Q?+7xOA+PHEr11pzL4C+skk1/9d/I+7HVvpUoisVgiGCxvUjZNuKPsOEjoWzZe?=
 =?us-ascii?Q?Yt3hTeO5nvwEKAhPsZxVxpf+J9AnFB5XlvZ19CPlsgJtj+615UMgmYMYqGB/?=
 =?us-ascii?Q?LVVIaJ3YvIfxb5jny1DBcMf1QwAUQGUxjQ0u7b9fU+YKHUHheKt0Oh/UE3+E?=
 =?us-ascii?Q?B57OaY+IxL7NbJHo80JKez6ELDitgxF0HV0stjAMuGU8icPS/NWWveqzs9qO?=
 =?us-ascii?Q?/5Gz6XVEUEi/4NYldLc1+avoSFBFV0pet1mTRuj88KInKvRdVsqjogtJaA1G?=
 =?us-ascii?Q?ozPrMPeYuDUkGZH8nwyLSzGCb61oJKMKtYElqMj0zrumiW6DffxoF6Kam9h6?=
 =?us-ascii?Q?An/vORXo7Tg4e1EJo9Ibi6orkkpylvBe/ONVyESkTcm80PS/YjiLm+GjrEr9?=
 =?us-ascii?Q?DOZt4YFTJgc0rrRB4ll9SXHAYFbeMo+tgrnDhb8w10pvJ3VC62mvZY1wkO14?=
 =?us-ascii?Q?N8kr2hvN//zoFml3QocDPlri9c8LXauk4iSX7Vcu?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Gv8XvxVNsmeNH+0hBlYfuO/e6Sstmt9Z7NWBarM13Yr9bzyyna0HLypTb8Y+QTeWz0dt6rBO0JGzqZGEb9WxhsTFqSqdVon3Fzbqlc8tljCdXXXG3GuBKs/yIgw9cUiK+jThZrSBcqliaZJC2aevo0UqOrc6HAh5edDj+E8I6n2XHPeVBoPIRZDAis15Wge8WYqiXB6N0298FZvtaOuFiSroBlAGwLaX1OPcbzYkhi6H/1GPk4RoavwEjHdHCkd2/MbTgxjHfXsg7BtHkYvH+NuPKD44jR9TSvkXSaztPTZfXhJAk4xO4ZdAclFuTlVfhR3uGch58UzLDQsHaAuKVwqYpcG/q6Nees/Dfgo9vtlwcGGuovc/6YsrAxcN7fpdDv01O4MT9089p3sscThpaoqgtuqgAnQ2xSd7C6Uww52ofNjwLJ0kU9mAXBxwyT/WOvZujDlkqL7xa4vhOJZpvHd8SWeuLvUbl8rp9f5xkCZsOpNrVnAKaewf0/inLibcfFikkYf5Ktckuzf1KX4UT/31F8ZjbVBdu60+G8G55AqHGodfpm7LA/RszdkG0H5kIaw4ajEsd6FabK8siR2y1j9mxYiiqT7jKj0GdMm5jgY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff5e374-ba30-4196-b8c4-08de36a71831
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 22:14:02.8090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ug5gMKIEGTt4tB3idn9hr/deiq3J/kFH0i9Y/mx3uAmoiAqzkZuPpPw2k11UsFj5Z5ZQu31F+N9hTkXdS2rsXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4595
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512080189
X-Proofpoint-GUID: r2RFrLiX2D4SILsY3KdSKA9cWYgqp5EP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDE4OCBTYWx0ZWRfXyjwnLX8mDIVR
 g5pgJxWYg26ayKO9avR5u7qIN2+hnhY9rp0oLNRaTQ2IBmGZ4rQHU4cQptknJhCv2zfRe2fsfuc
 LxdV+cg0XzkPApt1tVTEp85HA1IsNgyxpy47haGR2FvFyEl2RWtwg0Xr0ce29O/6u2B71jpU09E
 VcsWezLMjsS9L+E2ZhVwc5E3BvrMjNTbC8577ADb10WQUVNcZfN33khnkqSioHII1FcD1mo2CAt
 iiTkVSUH4dGcFInz27jn3B1Dq5c7wm1Br7sA525uKXAGvry1hG20UdEFDSFUIwY1ChvjzvqUctU
 AbW8rwA1/e94W6iyE0N2Z19ZPC/SwZf3z4NRXT7ytlsVGGfPWt/u75vVu9lthnkVj84NIqh8NMp
 ecV35QAykfAHNzwYAeAtp7p6ZZ5PhGg/vFeoP7pjC0NNx+qenDs=
X-Proofpoint-ORIG-GUID: r2RFrLiX2D4SILsY3KdSKA9cWYgqp5EP
X-Authority-Analysis: v=2.4 cv=X5Bf6WTe c=1 sm=1 tr=0 ts=69374daf b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=9AdMxfjQAAAA:20
 a=yPCof4ZbAAAA:8 a=rGfEaqrcWjzacY6KiiMA:9 a=bA3UWDv6hWIuX7UZL3qL:22 cc=ntf
 awl=host:12098

From: Eugene Loh <eugene.loh@oracle.com>

The documentation had been describing the legacy provider, in which sdt
probes were DTrace-specific instrumentation points in the kernel to
support other providers.  In the current implementation, the sdt
provider simply exposes Linux kernel tracepoints.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/index.md                        |  3 --
 .../reference/dtrace_providers_rawtp.md       |  8 ++-
 .../reference/dtrace_providers_sdt.md         | 53 ++++++++-----------
 3 files changed, 29 insertions(+), 35 deletions(-)

diff --git a/doc/userguide/index.md b/doc/userguide/index.md
index 3e057d4de..7d6b1caec 100644
--- a/doc/userguide/index.md
+++ b/doc/userguide/index.md
@@ -255,9 +255,6 @@
         -   [sched Examples](reference/dtrace_providers_sched.md#dt_ref_schedexamples_prov)
         -   [sched Stability](reference/dtrace_providers_sched.md#dt_ref_schedstab_prov)
     -   [SDT Provider](reference/dtrace_providers_sdt.md#dt_ref_sdt_prov)
-        -   [Creating sdt Probes](reference/dtrace_providers_sdt.md#dt_ref_sdtcreatep_prov)
-            -   [Declaring Probes](reference/dtrace_providers_sdt.md#dt_ref_sdtdeclp_prov)
-            -   [sdt Probe Arguments](reference/dtrace_providers_sdt.md#dt_ref_sdtparg_prov)
         -   [sdt Stability](reference/dtrace_providers_sdt.md#dt_ref_sdtstab_prov)
     -   [Stapsdt Provider](reference/dtrace_providers_stapsdt.md)
         -   [stapsdt Probes](reference/dtrace_providers_stapsdt.md#dt_ref_stapsdtprobes_prov)
diff --git a/doc/userguide/reference/dtrace_providers_rawtp.md b/doc/userguide/reference/dtrace_providers_rawtp.md
index 67cb0bedc..aa98f9c43 100644
--- a/doc/userguide/reference/dtrace_providers_rawtp.md
+++ b/doc/userguide/reference/dtrace_providers_rawtp.md
@@ -1,7 +1,13 @@
 
 # Rawtp Provider <a id="dt_ref_rawtp_prov">
 
-The `rawtp` provider gives DTrace users access to the raw tracepoints exposed by the kernel tracing system, including access to the untranslated arguments of the associated tracepoint events.
+The `rawtp` provider gives DTrace users access to the tracepoints exposed by the kernel tracing system.
+
+In contrast with the [sdt](../reference/dtrace_providers_sdt.md) provider,
+however, the `rawtp` provider delivers the raw arguments that the kernel
+provides to the tracepoint.
+For more information on kernel tracepoints, see
+<https://github.com/torvalds/linux/blob/master/Documentation/trace/tracepoints.rst>.
 
 To see what raw tracepoints are available on a system, use:
 
diff --git a/doc/userguide/reference/dtrace_providers_sdt.md b/doc/userguide/reference/dtrace_providers_sdt.md
index b4490401a..fc512484d 100644
--- a/doc/userguide/reference/dtrace_providers_sdt.md
+++ b/doc/userguide/reference/dtrace_providers_sdt.md
@@ -1,46 +1,37 @@
 
 # SDT Provider <a id="dt_ref_sdt_prov">
 
-The Statically Defined Tracing \(SDT\) provider \(`sdt`\) creates probes at sites that a software programmer has formally designated. Thus, the SDT provider is chiefly of interest only to developers of new providers. Most users access SDT only indirectly by using other providers.
+The Statically Defined Tracing \(SDT\) provider \(`sdt`\) is for
+tracing markers that have been added manually to the kernel source code.
 
-The SDT mechanism enables programmers to consciously choose locations of interest to users of DTrace and to convey some semantic knowledge about each location through the probe name.
+Historically, DTrace has used SDT instrumentation of the
+kernel source code to provide a number of other providers,
+such as `io`, `lockstat`, `ip`, `tcp`, and `udp`.
+With DTrace on Linux, however, DTrace is a user-space tool,
+avoiding modifications of the kernel source code,
+implementating those other providers on top of pre-existing probes.
 
-Importantly, SDT can act as a metaprovider by registering probes so that they appear to come from other providers, such as `io`, `lockstat`, `proc`, and `sched`.
+Therefore, the SDT provider now simply exposes kernel *tracepoints*,
+introduced by various kernel developers at semantically meaningful points of execution,
+making them available as DTrace probes.
 
-Both the name stability and the data stability of the probes are Private, which reflects the kernel's implementation and should not be interpreted as a commitment to preserve these interfaces.
+Probe arguments are converted from raw arguments provided by the kernel
+to a format specified by the tracepoint definition in the kernel source
+code and described in
+`/sys/kernel/debug/tracing/events/`*subsystem*/*tracepoint*/`format`.
 
-**Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
-
-## Creating sdt Probes <a id="dt_ref_sdtcreatep_prov">
-
-If you are a device driver developer, you might be interested in creating `sdt` probes for a Linux driver that you are working on. The disabled probe effect of SDT is only the cost of several no-operation machine instructions. You are therefore encouraged to add `sdt` probes to device driver code as needed. Unless these probes negatively affect performance, you can leave them in shipped code.
-
-DTrace also provides a mechanism for application developers to define user-space static probes.
-
-### Declaring Probes <a id="dt_ref_sdtdeclp_prov">
-
-The `sdt` probes are declared by using the `DTRACE_PROBE` macro from `<linux/sdt.h>`.
+To access the raw arguments,
+use the [rawtp](../reference/dtrace_providers_rawtp.md) provider.
 
-The module name and function name of an SDT-based probe correspond to the kernel module name and function name where the probe is declared. DTrace includes the kernel module name and function name as part of the tuple used to identify the probe in the probe description, so you don't need to explicitly include this information when devising the probe name. You can still specify the module and function name when referring to the probe in a DTrace program to prevent namespace collisions. Use the `dtrace -l -m *mymodule*` command to list the probes that *mymodule* has installed and the full names that are seen by DTrace users.
+For more information on kernel tracepoints, see
+<https://github.com/torvalds/linux/blob/master/Documentation/trace/tracepoints.rst>.
 
-The name of the probe depends on the name that's provided in the `DTRACE_PROBE` macro. If the name doesn't contain two consecutive underscores \(`__`\), the name of the probe is as written in the macro. If the name contains two consecutive underscores, the probe name converts the consecutive underscores to a single dash \(`-`\). For example, if a `DTRACE_PROBE` macro specifies `transaction__start`, the SDT probe is named `transaction-start`. This substitution enables C code to provide macro names that aren't valid C identifiers without specifying a string.
-
-SDT can also act as a metaprovider by registering probes so that they appear to come from other providers, such as `io`, `proc`, and `sched`, which don't have dedicated modules of their own. For example, `kernel/exit.c` contains calls to the `DTRACE_PROC` macro, which are defined as follows in `<linux/sdt.h>`:
-
-```
-# define DTRACE_PROC(name) \
-         DTRACE_PROBE(__proc_##name);
-```
-
-Probes that use such macros appear to come from a provider other than `sdt`. The leading double underscore, provider name, and trailing underscore in the `name` argument are used to match the provider and aren't included in the probe name.
-
-### sdt Probe Arguments <a id="dt_ref_sdtparg_prov">
-
-The arguments for each `sdt` probe are the arguments that are specified in the kernel source code in the corresponding `DTRACE_PROBE` macro reference. When declaring `sdt` probes, you can minimize their disabled probe effect by not dereferencing pointers and by not loading from global variables in the probe arguments. Both pointer dereferencing and global variable loading can be done safely in D functions that enable probes, so DTrace users can request these functions only when they're needed.
+**Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
 
 ## sdt Stability <a id="dt_ref_sdtstab_prov">
 
-The `sdt` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
+The `sdt` provider uses DTrace's stability mechanism to describe its stabilities.
+These values are listed in the following table.
 
 | Element   | Name Stability | Data Stability | Dependency Class |
 | :---      | :---           | :---           | :---             |
-- 
2.47.3

